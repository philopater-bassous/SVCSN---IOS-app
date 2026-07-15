//
//  ContentView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

enum PageType: String, CaseIterable, Identifiable {
    case news = "News"
    case liveScores = "Live Scores"
    case favorites = "Favorites"
    case sports = "Sports" // Removed gameSchedule and playerStats

    var id: String { self.rawValue }

    var icon: String {
        switch self {
        case .news: return "newspaper.fill"
        case .liveScores: return "clock.fill"
        case .favorites: return "star.fill"
        case .sports: return "sportscourt"
        }
    }
}

struct ContentView: View {
    @State private var favoriteSports: Set<FavoriteSport> = []
    @State private var isLoggedOut = false
    @State private var username: String = UserDefaults.standard.string(forKey: "savedUsername") ?? ""
    @State private var selectedPage: PageType = .news
    @State private var showMenu: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                // Display selected page
                Group {
                    switch selectedPage {
                    case .news:
                        NewsView()
                    case .liveScores:
                        LiveScoresView()
                    case .favorites:
                        FavoritesView(favoriteSports: $favoriteSports)
                    case .sports:
                        SportsListView(favoriteSports: $favoriteSports)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            }
            .background(Color.white.ignoresSafeArea())
            .navigationTitle(selectedPage.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        ForEach(PageType.allCases) { page in
                            Button {
                                selectedPage = page
                            } label: {
                                Label(page.rawValue, systemImage: page.icon)
                            }
                        }
                    } label: {
                        Label("Menu", systemImage: "line.3.horizontal")
                            .labelStyle(IconOnlyLabelStyle())
                            .foregroundColor(Color("SVCGREEN"))
                            .font(.title2)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        logout()
                    }
                    .foregroundColor(.red)
                }
            }
            .onAppear {
                if let savedUsername = UserDefaults.standard.string(forKey: "savedUsername") {
                    username = savedUsername
                    loadFavorites()
                }
            }
            .onDisappear(perform: saveFavorites)
            .fullScreenCover(isPresented: $isLoggedOut) {
                LoginView()
            }
        }
    }

    func saveFavorites() {
        guard !username.isEmpty else { return }
        if let encoded = try? JSONEncoder().encode(favoriteSports) {
            UserDefaults.standard.set(encoded, forKey: "favoriteSports_\(username)")
        }
    }

    func loadFavorites() {
        guard !username.isEmpty else { return }
        if let data = UserDefaults.standard.data(forKey: "favoriteSports_\(username)"),
           let decoded = try? JSONDecoder().decode(Set<FavoriteSport>.self, from: data) {
            favoriteSports = decoded
        }
    }

    func logout() {
        saveFavorites()
        UserDefaults.standard.removeObject(forKey: "savedUsername")
        isLoggedOut = true
    }
}

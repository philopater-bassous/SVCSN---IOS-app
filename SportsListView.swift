//
//  SportsListView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct SportsListView: View {
    @Binding var favoriteSports: Set<FavoriteSport>

    let menSports = [
        "Baseball", "Basketball", "Volleyball", "Cross Country", "Track & Field",
        "Football", "Golf", "Lacrosse", "Soccer", "Swim", "Wrestling", "Tennis"
    ]

    let womenSports = [
        "Softball", "Basketball", "Lacrosse", "Soccer", "Bowling",
        "Tennis", "Golf", "Cross Country", "Track & Field", "Swimming", "Volleyball"
    ]

    var body: some View {
        List {
            Section(header: Text("Men's Sports").font(.headline)) {
                ForEach(menSports, id: \.self) { sport in
                    HStack {
                        NavigationLink(destination: SportDetailView(sportName: sport, category: "Men's")) {
                            Text(sport)
                        }
                        Spacer()
                        Button(action: {
                            toggleFavorite(sport, category: "Men's")
                        }) {
                            Image(systemName: favoriteSports.contains(FavoriteSport(name: sport, category: "Men's")) ? "star.fill" : "star")
                                .foregroundColor(favoriteSports.contains(FavoriteSport(name: sport, category: "Men's")) ? .yellow : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }

            Section(header: Text("Women's Sports").font(.headline)) {
                ForEach(womenSports, id: \.self) { sport in
                    HStack {
                        NavigationLink(destination: SportDetailView(sportName: sport, category: "Women's")) {
                            Text(sport)
                        }
                        Spacer()
                        Button(action: {
                            toggleFavorite(sport, category: "Women's")
                        }) {
                            Image(systemName: favoriteSports.contains(FavoriteSport(name: sport, category: "Women's")) ? "star.fill" : "star")
                                .foregroundColor(favoriteSports.contains(FavoriteSport(name: sport, category: "Women's")) ? .yellow : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationTitle("Sports")
    }

    private func toggleFavorite(_ sport: String, category: String) {
        let key = FavoriteSport(name: sport, category: category)
        if favoriteSports.contains(key) {
            favoriteSports.remove(key)
        } else {
            favoriteSports.insert(key)
        }
        saveFavorites()
    }

    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteSports) {
            UserDefaults.standard.set(encoded, forKey: "favoriteSports")
        }
    }
}

#Preview {
    SportsListView(favoriteSports: .constant([]))
}

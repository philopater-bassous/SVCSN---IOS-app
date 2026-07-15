//
//  SportDetailView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct SportDetailView: View {
    let sportName: String
    let category: String // Men's or Women's

    var body: some View {
        TabView {
            RosterView(sportName: sportName, category: category)
                .tabItem {
                    Label("Roster", systemImage: "person.3.fill")
                }

            GameScheduleView(sportName: sportName, category: category)
                .tabItem {
                    Label("Game Schedule", systemImage: "calendar")
                }
        }
        .navigationTitle("\(category) \(sportName)")
    }
}

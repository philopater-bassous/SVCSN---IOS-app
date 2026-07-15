//
//  RosterView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct PlayerInfo: Identifiable {
    let id = UUID()
    let number: Int
    let name: String
    let position: String
    let height: String
    let year: String
    let hometown: String
    let highSchool: String

    var imageName: String {
        "number\(number)"
    }
}

struct RosterView: View {
    let sportName: String
    let category: String

    let players: [PlayerInfo] = [
        PlayerInfo(number: 5, name: "Stephen Laun", position: "DS", height: "6'1\"", year: "Junior", hometown: "Pittsburgh, Pa.", highSchool: "North Allegheny"),
        PlayerInfo(number: 6, name: "Jackson Genicola", position: "Setter", height: "6'0\"", year: "Freshman", hometown: "North Huntingdon, Pa.", highSchool: "Norwin"),
        PlayerInfo(number: 8, name: "Zebadiah Wyant", position: "OH", height: "6'3\"", year: "Junior", hometown: "Martinsburg, Pa.", highSchool: "Central"),
        PlayerInfo(number: 9, name: "Ezra Glenn", position: "Middle Hitter", height: "6'1\"", year: "Freshman", hometown: "Irwin, Pa.", highSchool: "Penn-Trafford"),
        PlayerInfo(number: 10, name: "Nick Sikorski", position: "Middle Hitter", height: "6'5\"", year: "Freshman", hometown: "Homestead, Pa.", highSchool: "Seton LaSalle"),
        PlayerInfo(number: 12, name: "Tommy Barrick", position: "Outside Hitter", height: "6'2\"", year: "Freshman", hometown: "Harrisburg, Pa.", highSchool: "Central Dauphin"),
        PlayerInfo(number: 13, name: "Tyler Nelson", position: "OH", height: "6'2\"", year: "Sophomore", hometown: "Greensburg, Pa.", highSchool: "Greater Latrobe"),
        PlayerInfo(number: 14, name: "Nicolas Serapiglia", position: "OH/DS", height: "6'1\"", year: "Junior", hometown: "Dover, Pa.", highSchool: "Dover"),
        PlayerInfo(number: 15, name: "Kolton Butina", position: "Defensive Specialist", height: "6'0\"", year: "Freshman", hometown: "Luxor, Pa.", highSchool: "Hempfield"),
        PlayerInfo(number: 16, name: "Chrystiaan Sexton", position: "RS/OPP", height: "6'4\"", year: "Junior", hometown: "Chesapeake, Va.", highSchool: "Grassfield"),
        PlayerInfo(number: 17, name: "Rocco Marino", position: "MH", height: "6'4\"", year: "Sophomore", hometown: "Latrobe, Pa.", highSchool: "Greater Latrobe"),
        PlayerInfo(number: 18, name: "Shawn McSwiggen", position: "RS/OH", height: "6'5\"", year: "Junior", hometown: "Pittsburgh, Pa.", highSchool: "Thomas Jefferson"),
        PlayerInfo(number: 20, name: "Cole Frischmann", position: "Right Side", height: "7'1\"", year: "Freshman", hometown: "Coraopolis, Pa.", highSchool: "Montour")
    ]

    var body: some View {
        List {
            Section(header: Text("\(category) \(sportName) Roster").font(.title2)) {
                ForEach(players) { player in
                    NavigationLink(destination: PlayerStatsView(player: player)) {
                        HStack(alignment: .top, spacing: 15) {
                            Image(player.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(player.number)  \(player.name)")
                                    .font(.headline)
                                Text("\(player.position) / \(player.height)")
                                    .font(.subheadline)
                                Text("\(player.year) / \(player.hometown) / \(player.highSchool)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
        }
        .navigationTitle("Roster")
    }
}

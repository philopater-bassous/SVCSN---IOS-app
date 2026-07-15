//
//  PlayerStatesView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct PlayerStatsView: View {
    let player: PlayerInfo

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(player.name)
                    .font(.largeTitle)
                    .bold()

                Image(player.imageName)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 4)

                Text("Position: \(player.position)")
                Text("Height: \(player.height)")
                Text("Year: \(player.year)")
                Text("Hometown: \(player.hometown)")
                Text("High School: \(player.highSchool)")

                Divider()

                Group {
                    Text("2025 Season Statistics").font(.title2).bold()

                    Text("**Kills:** 224 | **Kills/Set:** 2.95 | **Attempts:** 537 | **Hit %:** .250")
                    Text("**Aces:** 44 | **Aces/Set:** 0.58 | **Assists:** 7 | **Assists/Set:** 0.09")
                    Text("**Digs:** 91 | **Digs/Set:** 1.20")
                    Text("**Blocks:** 16 (Solo), 14 (Assist), 30.0 Total | **Blocks/Set:** 0.39")
                    Text("**Points:** 291.0 | **Points/Set:** 3.83")
                }

                Divider()

                Group {
                    Text("Career Statistics").font(.title2).bold()

                    Text("**Kills:** 815 | **Kills/Set:** 3.68 | **Attempts:** 2204 | **Hit %:** .259")
                    Text("**Aces:** 100 | **Assists:** 26 | **Digs:** 479 | **Digs/Set:** 1.89")
                    Text("**Blocks:** 49 (Solo), 44 (Assist), 93.0 Total | **Blocks/Set:** 0.37")
                    Text("**Points:** 1097.0 | **Points/Set:** 4.32")
                }

                Divider()

                Group {
                    Text("2025 Season Highs").font(.title2).bold()

                    Text("**Kills:** 28 on 1/25/2025 vs Elizabethtown")
                    Text("**Assists:** 1 on 4/05/2025 vs Chatham")
                    Text("**Aces:** 4 on 3/26/2025 at Bethany (WV)")
                    Text("**Digs:** 18 on 2/20/2025 vs Geneva")
                    Text("**Blocks:** 3 on 3/29/2025 vs Hiram")
                    Text("**Points:** 30.0 on 1/25/2025 vs Elizabethtown")
                }
            }
            .padding()
        }
        .navigationTitle("Player Stats")
    }
}

//
//  GameScheduleView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//
import SwiftUI

struct Match: Identifiable {
    let id = UUID()
    let opponent: String
    let result: String
    let date: String
    let location: String
    let scoreDetails: String
    let assetName: String
}

struct GameScheduleView: View {
    let sportName: String
    let category: String

    let matches: [Match] = [
        Match(opponent: "#5 Juniata", result: "L, 0-3", date: "Jan 18 (Sat)", location: "Huntingdon, PA", scoreDetails: "(25-6, 25-14, 25-14)", assetName: "Juniata"),
        Match(opponent: "Elizabethtown", result: "L, 2-3", date: "Jan 25 (Sat)", location: "Elizabethtown, PA", scoreDetails: "(27-25, 25-23, 21-25, 17-25, 13-15)", assetName: "Elizabethtown"),
        Match(opponent: "Wilson", result: "W, 3-0", date: "Jan 25 (Sat)", location: "Elizabethtown, PA", scoreDetails: "(25-9, 25-22, 25-17)", assetName: "Wilson"),
        Match(opponent: "Wilkes", result: "L, 2-3", date: "Feb 1 (Sat)", location: "Altoona, PA", scoreDetails: "(27-29, 25-21, 22-25, 25-20, 13-15)", assetName: "Wilkes"),
        Match(opponent: "Penn State Altoona", result: "W, 3-1", date: "Feb 1 (Sat)", location: "Altoona, PA", scoreDetails: "(25-20, 25-17, 22-25, 25-17)", assetName: "Penn"),
        Match(opponent: "Carlow University (Pa.)", result: "W, 3-0", date: "Feb 6 (Thu)", location: "Latrobe, PA", scoreDetails: "(25-9, 25-14, 25-18)", assetName: "Carlow"),
        Match(opponent: "Mount Aloysius", result: "W, 3-0", date: "Feb 11 (Tue)", location: "Cresson, PA", scoreDetails: "(25-13, 25-21, 25-23)", assetName: "Mount"),
        Match(opponent: "Grove City", result: "L, 2-3", date: "Feb 13 (Thu)", location: "Grove City, PA", scoreDetails: "(25-14, 22-25, 20-25, 25-16, 10-15)", assetName: "Grove"),
        Match(opponent: "Penn State Altoona", result: "Canceled", date: "Feb 15 (Sat)", location: "Latrobe, PA", scoreDetails: "", assetName: "Penn"),
        Match(opponent: "Geneva", result: "L, 2-3", date: "Feb 20 (Thu)", location: "Latrobe, PA", scoreDetails: "(25-14, 22-25, 20-25, 25-23, 9-15)", assetName: "Geneva"),
        Match(opponent: "Carlow University (Pa.)", result: "W, 3-0", date: "Feb 24 (Mon)", location: "Latrobe, PA", scoreDetails: "(25-9, 25-16, 25-18)", assetName: "Carlow"),
        Match(opponent: "Bethany", result: "W, 3-0", date: "Feb 28 (Fri)", location: "Latrobe, PA", scoreDetails: "(25-12, 25-16, 25-13)", assetName: "Bethany"),
        Match(opponent: "Hiram", result: "L, 0-3", date: "Mar 4 (Tue)", location: "Hiram, OH", scoreDetails: "(23-25, 21-25, 17-25)", assetName: "Hiram"),
        Match(opponent: "Thiel", result: "L, 1-3", date: "Mar 7 (Fri)", location: "Greenville, PA", scoreDetails: "(18-25, 25-23, 22-25, 16-25)", assetName: "Thiel"),
        Match(opponent: "Chatham", result: "W, 3-1", date: "Mar 12 (Wed)", location: "Pittsburgh, PA", scoreDetails: "(19-25, 25-22, 25-20, 25-19)", assetName: "Chatham"),
        Match(opponent: "Grove City", result: "W, 3-0", date: "Mar 15 (Sat)", location: "Latrobe, PA", scoreDetails: "(27-25, 25-21, 25-14)", assetName: "Grove"),
        Match(opponent: "Roberts Wesleyan", result: "L, 1-3", date: "Mar 15 (Sat)", location: "Latrobe, PA", scoreDetails: "(23-25, 23-25, 25-23, 32-34)", assetName: "Roberts"),
        Match(opponent: "Geneva", result: "L, 0-3", date: "Mar 19 (Wed)", location: "Beaver Falls, PA", scoreDetails: "(22-25, 15-25, 17-25)", assetName: "Geneva"),
        Match(opponent: "Bethany", result: "W, 3-0", date: "Mar 26 (Wed)", location: "Bethany, WV", scoreDetails: "(25-12, 25-20, 25-23)", assetName: "Bethany"),
        Match(opponent: "Hiram", result: "L, 1-3", date: "Mar 29 (Sat)", location: "Latrobe, PA", scoreDetails: "(14-25, 27-25, 26-28, 16-25)", assetName: "Hiram"),
        Match(opponent: "Thiel", result: "L, 1-3", date: "Apr 2 (Wed)", location: "Latrobe, PA", scoreDetails: "(25-23, 17-25, 25-27, 19-25)", assetName: "Thiel"),
        Match(opponent: "Chatham", result: "W, 3-2", date: "Apr 5 (Sat)", location: "Latrobe, PA", scoreDetails: "(17-25, 25-19, 25-22, 16-25, 17-15)", assetName: "Chatham")
    ]

    var body: some View {
        List {
            Section(header: Text("\(category) \(sportName) Game Schedule").font(.title2)) {
                ForEach(matches) { match in
                    HStack(alignment: .top, spacing: 12) {
                        Image(match.assetName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 6))

                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(match.opponent)")
                                .font(.headline)
                            Text("\(match.result) \(match.scoreDetails)")
                                .font(.subheadline)
                            Text("\(match.date) • \(match.location)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle("Game Schedule")
    }
}

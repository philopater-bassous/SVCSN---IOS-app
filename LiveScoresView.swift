//
//  LiveScoresView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct LiveScoresView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Live Scores")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("SVCGreen"))
                    .padding(.top)

                ForEach(0..<5) { index in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Game \(index + 1)")
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("Score: TBD")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("SVCGreen"))
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .padding(.horizontal)
                }

                Spacer(minLength: 32)
            }
            .padding(.bottom)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color("SVCGreen").opacity(0.05)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    LiveScoresView()
}

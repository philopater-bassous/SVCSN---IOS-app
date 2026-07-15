//
//  NewsView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let imageName: String
}

struct NewsView: View {
    let articles: [NewsArticle] = [
        NewsArticle(title: "Men’s and Women’s Track and Field Competes at PAC Championship", date: "May 03, 2025", imageName: "svcnewspage1"),
        NewsArticle(title: "Saint Vincent Names Tyler Gallagher Head Men's Soccer Coach", date: "April 25, 2025", imageName: "svcnewspage2")
    ]

    var body: some View {
        NavigationView {
            List(articles) { article in
                VStack(alignment: .leading, spacing: 10) {
                    Image(article.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)

                    Text(article.title)
                        .font(.headline)

                    Text(article.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
            }
            .navigationTitle("SVC News")
        }
    }
}

#Preview {
    NewsView()
}

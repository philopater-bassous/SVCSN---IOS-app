//
//  FavoritesView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI

struct FavoritesView: View {
@Binding var favoriteSports: Set<FavoriteSport> // Store category with sport

var body: some View {
NavigationView {
List {
Section(header: Text("Favorite Sports")) {
if favoriteSports.isEmpty {
Text("No favorites yet. Tap the star next to a sport to favorite it.")
.foregroundColor(.gray)
} else {
ForEach(Array(favoriteSports), id: \.self) { favorite in
NavigationLink(destination: SportDetailView(sportName: favorite.name, category: favorite.category)) {
Text("\(favorite.category) \(favorite.name)")
}
}
}
}
}
.navigationTitle("Favorites")
}
}
}

#Preview {
FavoritesView(favoriteSports: .constant([
FavoriteSport(name: "Basketball", category: "Men's"),
FavoriteSport(name: "Soccer", category: "Women's")
]))
}

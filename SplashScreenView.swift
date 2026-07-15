//
//  SplashScreenView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//
import SwiftUI

struct SplashScreenView: View {
@State private var isActive = false

var body: some View {
ZStack {
Color.white.ignoresSafeArea()

Image("SVCSN logo resized")
.resizable()
.scaledToFit()
.frame(width: 200, height: 200)
.onAppear {
DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
isActive = true
}
}
}
.fullScreenCover(isPresented: $isActive) {
LoginView() // Navigate to LoginView after splash screen
}
}
}

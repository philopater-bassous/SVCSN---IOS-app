//
//  LoginView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/18/25.
//

import SwiftUI
import Security

struct LoginView: View {
@State private var username: String = UserDefaults.standard.string(forKey: "savedUsername") ?? ""
@State private var password: String = ""
@State private var showingLoginScreen = false
@State private var showingSignUpScreen = false
@State private var showingForgotPasswordScreen = false
@State private var loginError: String?

var body: some View {
NavigationView {
ZStack {
Color("white").ignoresSafeArea()

VStack(spacing: 20) {
Image("LoginScreen")
.resizable()
.scaledToFit()
.frame(width: 250, height: 150)
.padding()

TextField("Username", text: $username)
.textFieldStyle(RoundedBorderTextFieldStyle())
.padding()

SecureField("Password", text: $password)
.textFieldStyle(RoundedBorderTextFieldStyle())
.padding()

if let error = loginError {
Text(error)
.foregroundColor(.red)
}

Button("Login") {
authenticateUser(username: username, password: password)
}
.foregroundColor(.white)
.frame(width: 300, height: 50)
.background(Color("SVCYellow"))
.cornerRadius(10)

Button("Sign Up") {
showingSignUpScreen = true
}
.foregroundColor(.white)
.frame(width: 300, height: 50)
.background(Color("SVCYellow"))
.cornerRadius(10)

Button("Forgot Password?") {
showingForgotPasswordScreen = true
}
.foregroundColor(.blue)

Button("Continue as Guest") {
showingLoginScreen = true
}
.foregroundColor(.white)
.frame(width: 300, height: 50)
.background(Color.gray)
.cornerRadius(10)

NavigationLink(destination: ContentView(), isActive: $showingLoginScreen) { EmptyView() }
NavigationLink(destination: SignUpView(showingSignUpScreen: $showingSignUpScreen), isActive: $showingSignUpScreen) { EmptyView() }
NavigationLink(destination: ForgotPasswordView(showingForgotPasswordScreen: $showingForgotPasswordScreen), isActive: $showingForgotPasswordScreen) { EmptyView() }
}
.padding()
}
.navigationBarHidden(true)
}
}

func authenticateUser(username: String, password: String) {
if let storedPassword = KeychainHelper.getPassword(for: username), storedPassword == password {
UserDefaults.standard.set(username, forKey: "savedUsername")
showingLoginScreen = true
} else {
loginError = "Invalid username or password."
}
}
}

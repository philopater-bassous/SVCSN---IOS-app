//
//  SignUpView.swift
//  SVCSN
//
//  Created by Philopater Bassous on 2/22/25.
//

import SwiftUI

struct SignUpView: View {
    @Binding var showingSignUpScreen: Bool
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var contactInfo: String = "" // email or phone
    @State private var signUpError: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)

            TextField("Enter Username", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Email or Phone Number", text: $contactInfo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Enter Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if let error = signUpError {
                Text(error)
                    .foregroundColor(.red)
            }

            Button("Create Account") {
                signUpUser()
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)

            Button("Cancel") {
                showingSignUpScreen = false
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.gray)
            .cornerRadius(10)
        }
        .padding()
    }

    func signUpUser() {
        guard !newUsername.isEmpty, !newPassword.isEmpty, !confirmPassword.isEmpty, !contactInfo.isEmpty else {
            signUpError = "Please fill in all fields."
            return
        }

        guard newPassword == confirmPassword else {
            signUpError = "Passwords do not match."
            return
        }

        guard isValidPassword(newPassword) else {
            signUpError = "Password must be at least 8 characters, include uppercase, lowercase, number, and special character."
            return
        }

        if KeychainHelper.getPassword(for: newUsername) != nil {
            signUpError = "Username already exists."
        } else {
            KeychainHelper.savePassword(newPassword, for: newUsername)
            KeychainHelper.saveContactInfo(contactInfo, for: newUsername)
            UserDefaults.standard.set(newUsername, forKey: "savedUsername")
            showingSignUpScreen = false
        }
    }

    func isValidPassword(_ password: String) -> Bool {
        let regex = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$"#
        return password.range(of: regex, options: .regularExpression) != nil
    }
}

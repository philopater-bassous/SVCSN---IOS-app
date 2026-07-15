import SwiftUI

struct ForgotPasswordView: View {
    @Binding var showingForgotPasswordScreen: Bool
    @State private var username: String = ""
    @State private var contactInput: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var resetError: String?
    @State private var resetSuccess: Bool = false
    @State private var contactHint: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("Reset Password")
                .font(.largeTitle)

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: username) { _ in
                    loadContactHint()
                }

            if let hint = contactHint {
                Text("Enter full contact info matching: \(hint)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            TextField("Email or Phone Number", text: $contactInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm New Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if let error = resetError {
                Text(error)
                    .foregroundColor(.red)
            }

            if resetSuccess {
                Text("Password reset successfully!")
                    .foregroundColor(.green)
            }

            Button("Reset Password") {
                resetPassword()
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)

            Button("Cancel") {
                showingForgotPasswordScreen = false
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.gray)
            .cornerRadius(10)
        }
        .padding()
    }

    func loadContactHint() {
        guard let stored = KeychainHelper.getContactInfo(for: username) else {
            contactHint = nil
            return
        }

        if stored.contains("@") {
            // Email masking: *******sus@gmail.com
            let components = stored.split(separator: "@", maxSplits: 1)
            guard components.count == 2 else {
                contactHint = nil
                return
            }

            let namePart = String(components[0])
            let domainPart = String(components[1])
            let suffixCount = min(3, namePart.count)
            let visibleSuffix = namePart.suffix(suffixCount)
            let masked = String(repeating: "*", count: namePart.count - suffixCount)

            contactHint = "Email: \(masked)\(visibleSuffix)@\(domainPart)"
        } else {
            // Phone masking: ***-***-7847
            let digits = stored.filter { $0.isNumber }
            let suffix = digits.suffix(4)
            contactHint = "Phone: ***-***-\(suffix)"
        }
    }

    func resetPassword() {
        guard !username.isEmpty, !contactInput.isEmpty, !newPassword.isEmpty, !confirmPassword.isEmpty else {
            resetError = "Please fill in all fields."
            return
        }

        guard let actualContact = KeychainHelper.getContactInfo(for: username) else {
            resetError = "No account found with that username."
            return
        }

        guard actualContact == contactInput else {
            resetError = "Contact info does not match."
            return
        }

        guard newPassword == confirmPassword else {
            resetError = "Passwords do not match."
            return
        }

        guard isValidPassword(newPassword) else {
            resetError = "Password must be at least 8 characters, include uppercase, lowercase, number, and special character."
            return
        }

        KeychainHelper.savePassword(newPassword, for: username)
        resetSuccess = true
        resetError = nil
    }

    func isValidPassword(_ password: String) -> Bool {
        let regex = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$"#
        return password.range(of: regex, options: .regularExpression) != nil
    }
}

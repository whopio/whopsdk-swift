import Foundation

/// The authenticator must store a discoverable passkey, so it can sign in without a username.
public enum PasskeyAuthenticatorSelectionResidentKey: String, Codable, Hashable, CaseIterable, Sendable {
    case required
}
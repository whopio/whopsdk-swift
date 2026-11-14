import Foundation

/// The authenticator must verify the user, with a biometric or the device's screen lock.
public enum PasskeyRequestOptionsUserVerification: String, Codable, Hashable, CaseIterable, Sendable {
    case required
}
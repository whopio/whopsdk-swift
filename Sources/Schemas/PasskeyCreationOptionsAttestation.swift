import Foundation

/// Whop does not ask for attestation.
public enum PasskeyCreationOptionsAttestation: String, Codable, Hashable, CaseIterable, Sendable {
    case none
}
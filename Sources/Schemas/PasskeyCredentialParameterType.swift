import Foundation

/// Always `public-key`.
public enum PasskeyCredentialParameterType: String, Codable, Hashable, CaseIterable, Sendable {
    case publicKey = "public-key"
}
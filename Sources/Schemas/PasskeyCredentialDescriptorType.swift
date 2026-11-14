import Foundation

/// Always `public-key`.
public enum PasskeyCredentialDescriptorType: String, Codable, Hashable, CaseIterable, Sendable {
    case publicKey = "public-key"
}
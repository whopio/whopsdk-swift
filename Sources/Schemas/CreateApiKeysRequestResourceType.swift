import Foundation

/// The type of resource that will own this API key.
public enum CreateApiKeysRequestResourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case account
    case app
}
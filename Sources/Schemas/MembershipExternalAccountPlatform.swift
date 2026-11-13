import Foundation

/// The platform the member's account is on.
public enum MembershipExternalAccountPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case discord
    case telegram
}
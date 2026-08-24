import Foundation

/// The kind of identity profile (individual vs business).
public enum IdentityProfileKinds: String, Codable, Hashable, CaseIterable, Sendable {
    case individual
    case business
}
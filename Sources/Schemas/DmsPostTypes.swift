import Foundation

/// The types of post
public enum DmsPostTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case regular
    case system
    case automated
}
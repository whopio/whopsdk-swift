import Foundation

/// The placement variant this asset covers, or null for the original asset.
public enum AdCreativeFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case square
    case vertical
    case horizontal
}
import Foundation

/// The kind of media this asset holds.
public enum MediaAssetMediaType: String, Codable, Hashable, CaseIterable, Sendable {
    case video
    case image
}
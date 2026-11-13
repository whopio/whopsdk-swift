import Foundation

/// The ad platform the pixel belongs to.
public enum CreateAdPixelsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case meta
    case tiktok
    case google
    case thrad
}
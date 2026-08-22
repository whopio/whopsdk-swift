import Foundation

/// How the asset was created. Always `generated`.
public enum MediaAssetSource: String, Codable, Hashable, CaseIterable, Sendable {
    case generated
}
import Foundation

/// Mux asset statuses
public enum MuxAssetStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case uploading
    case created
    case ready
}
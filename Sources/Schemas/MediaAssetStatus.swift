import Foundation

/// Lifecycle state: `processing` while generation runs, `ready` when the file is available, `failed` when generation failed and the charge was refunded.
public enum MediaAssetStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case ready
    case failed
}
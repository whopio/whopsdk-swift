import Foundation

/// Current swap status. `complete` and `failed` are terminal.
public enum ListSwapsResponseDataItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case working
    case complete
    case failed
}
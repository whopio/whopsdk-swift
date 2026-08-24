import Foundation

/// The available bounty statuses to choose from.
public enum Statuses: String, Codable, Hashable, CaseIterable, Sendable {
    case published
    case archived
    case scheduled
}
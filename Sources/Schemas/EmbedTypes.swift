import Foundation

/// The type of embed for a lesson
public enum EmbedTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case youtube
    case loom
}
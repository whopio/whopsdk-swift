import Foundation

/// The kind of media to generate.
public enum GenerateMediaRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case video
    case image
}
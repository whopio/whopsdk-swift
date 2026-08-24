import Foundation

/// Controls whether an uploaded file is publicly accessible or requires authentication to access.
public enum FileVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case `public`
    case `private`
}
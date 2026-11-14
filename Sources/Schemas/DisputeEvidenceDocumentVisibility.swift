import Foundation

/// `public` files are served from an unsigned CDN URL. `private` files are served from a signed URL that expires.
public enum DisputeEvidenceDocumentVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case `public`
    case `private`
}
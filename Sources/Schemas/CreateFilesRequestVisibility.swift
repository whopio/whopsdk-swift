import Foundation

/// `public` files are served via an unsigned CDN URL — use for assets anyone may see. `private` files are served via a signed, expiring URL — use for sensitive documents. Defaults to `private`.
public enum CreateFilesRequestVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case `public`
    case `private`
}
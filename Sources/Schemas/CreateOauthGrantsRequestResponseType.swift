import Foundation

/// The OAuth response type. Only `code` is accepted; defaults to `code`.
public enum CreateOauthGrantsRequestResponseType: String, Codable, Hashable, CaseIterable, Sendable {
    case code
}
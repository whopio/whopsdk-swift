import Foundation

/// How `code_challenge` was derived. Only `S256` is accepted. Required with `code_challenge`.
public enum CreateOauthGrantsRequestCodeChallengeMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case s256 = "S256"
}
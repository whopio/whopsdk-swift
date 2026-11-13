import Foundation

/// Current state of audience creation. When a `pending` audience is waiting on something, such as an ad account to upload to, `error_message` says what. When status is `partial` or `failed`, `error_message` explains what went wrong.
public enum AudienceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case ready
    case partial
    case failed
}
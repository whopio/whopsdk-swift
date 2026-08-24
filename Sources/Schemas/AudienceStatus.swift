import Foundation

/// Current state of the audience import. `syncing` means Whop is sending matched rows to connected ad accounts. When status is `partial` or `failed`, `error_message` explains what went wrong.
public enum AudienceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case syncing
    case ready
    case partial
    case failed
}
import Foundation

/// `ready` while the code waits to be used. `pending` once it has: Whop removes the domain's email, Apple Pay and pixel from this account, then moves the registration and removes the domain from this account.
public enum DomainTransferState: String, Codable, Hashable, CaseIterable, Sendable {
    case ready
    case pending
}
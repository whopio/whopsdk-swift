import Foundation

/// Where the domain is moving. `internal` is another Whop account.
public enum DomainTransferDestination: String, Codable, Hashable, CaseIterable, Sendable {
    case `internal`
}
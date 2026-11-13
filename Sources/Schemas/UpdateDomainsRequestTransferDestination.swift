import Foundation

/// Where the domain moves. `internal` moves it to another Whop account.
public enum UpdateDomainsRequestTransferDestination: String, Codable, Hashable, CaseIterable, Sendable {
    case `internal`
}
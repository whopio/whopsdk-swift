import Foundation

/// `created` — saved, no payout has completed through it yet. `active` — a payout through it completed. `broken` — a payout through it failed with an error attributable to the method, and it no longer accepts payouts; a later successful payout returns it to `active`.
public enum UpdateMethodsResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case created
    case active
    case broken
}
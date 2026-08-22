import Foundation

/// Lifecycle state. `scheduled` bounties are unpublished drafts, visible to their poster and the account's authorized managers; `open` bounties accept new submissions; `closed` bounties are live but no longer accept new submissions; `completed` bounties paid out every winner slot; `canceled` bounties ended before filling their slots.
public enum BountyListItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case open
    case closed
    case completed
    case canceled
}
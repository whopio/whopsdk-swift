import Foundation

/// The most pressing state of the domain's capabilities: `releasing`, then `action_required`, then `pending`, then `ready`. `idle` when it wants nothing.
public enum DomainListItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case idle
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}
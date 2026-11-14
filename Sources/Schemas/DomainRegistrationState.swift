import Foundation

/// How far registering and keeping the domain has got.
public enum DomainRegistrationState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}
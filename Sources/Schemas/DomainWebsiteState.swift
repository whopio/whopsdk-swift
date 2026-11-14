import Foundation

/// How far serving the website has got.
public enum DomainWebsiteState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}
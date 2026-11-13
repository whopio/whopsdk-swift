import Foundation

/// Domain lifecycle status, matching the domain resource.
public enum AppDomainStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case idle
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}
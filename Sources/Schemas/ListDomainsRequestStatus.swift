import Foundation

public enum ListDomainsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case idle
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}
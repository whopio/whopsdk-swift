import Foundation

public enum ListDomainsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
    case any
}
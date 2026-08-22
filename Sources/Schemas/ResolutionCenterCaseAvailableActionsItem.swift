import Foundation

/// What you can do to this case right now, named for the endpoint that does it. Resolved for the calling credential, so a merchant and a customer reading the same case see their own options.
public enum ResolutionCenterCaseAvailableActionsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case accept
    case deny
    case requestInfo = "request_info"
    case reply
    case appeal
    case withdraw
}
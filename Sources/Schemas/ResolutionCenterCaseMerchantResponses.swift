import Foundation

/// The types of responses a merchant can make to a resolution.
public enum ResolutionCenterCaseMerchantResponses: String, Codable, Hashable, CaseIterable, Sendable {
    case accept
    case deny
    case requestMoreInfo = "request_more_info"
    case appeal
    case respond
}
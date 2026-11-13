import Foundation

public enum ListExternalAccountsRequestTrustLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case oauth
    case apiKey = "api_key"
    case verified
    case authorized
    case claimed
    case scraped
}
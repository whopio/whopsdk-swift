import Foundation

public enum ListPartnerReferralRequestsRequestRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case manual
    case ownershipTransfer = "ownership_transfer"
    case link
}
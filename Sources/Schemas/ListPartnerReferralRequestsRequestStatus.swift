import Foundation

public enum ListPartnerReferralRequestsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case accepted
    case denied
    case cancelled
}
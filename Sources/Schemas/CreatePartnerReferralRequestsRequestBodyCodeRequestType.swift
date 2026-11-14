import Foundation

/// Create or retrieve a reusable referral link without requesting attribution for an existing business.
public enum CreatePartnerReferralRequestsRequestBodyCodeRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case link
}
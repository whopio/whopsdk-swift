import Foundation

/// How the referral request was initiated.
public enum PartnerReferralRequestRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case manual
    case ownershipTransfer = "ownership_transfer"
    case link
}
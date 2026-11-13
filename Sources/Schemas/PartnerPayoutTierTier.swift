import Foundation

/// Referral tier: first for a directly referred business, or second for a business brought by a referred partner.
public enum PartnerPayoutTierTier: String, Codable, Hashable, CaseIterable, Sendable {
    case first
    case second
}
import Foundation

/// Reward recipient's role, or null for a fixed user who is not the requesting partner.
public enum PartnerReferralRewardRecipient: String, Codable, Hashable, CaseIterable, Sendable {
    case business
    case partner
}
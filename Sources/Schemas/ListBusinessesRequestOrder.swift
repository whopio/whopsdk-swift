import Foundation

public enum ListBusinessesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case referralStartedAt = "referral_started_at"
    case referralExpiresAt = "referral_expires_at"
    case payoutPercentage = "payout_percentage"
    case volumeUsd = "volume_usd"
    case earningsUsd = "earnings_usd"
}
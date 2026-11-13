import Foundation

/// The caller's own standing; null when the caller has no referral earnings.
public struct LeaderboardPartnersResponseMe: Codable, Hashable, Sendable {
    /// When the referrer's earliest partner business became active.
    public let firstReferralStartedAt: Date
    /// 1-based leaderboard position.
    public let rank: Int
    /// The referrer's pending + completed earnings across all referred businesses, in USD, without commission advances. Whop Sales commission counts only the share that reaches its people.
    public let totalEarningsUsd: String
    /// Credited GMV across all the referrer's referred businesses, in USD.
    public let totalVolumeUsd: String
    /// The ranked referrer. Identity fields (id, name, username, profile_picture) are returned only on the caller's own entry; other referrers expose coarse location only.
    public let user: Nullable<LeaderboardPartnersResponseMeUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        firstReferralStartedAt: Date,
        rank: Int,
        totalEarningsUsd: String,
        totalVolumeUsd: String,
        user: Nullable<LeaderboardPartnersResponseMeUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.firstReferralStartedAt = firstReferralStartedAt
        self.rank = rank
        self.totalEarningsUsd = totalEarningsUsd
        self.totalVolumeUsd = totalVolumeUsd
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstReferralStartedAt = try container.decode(Date.self, forKey: .firstReferralStartedAt)
        self.rank = try container.decode(Int.self, forKey: .rank)
        self.totalEarningsUsd = try container.decode(String.self, forKey: .totalEarningsUsd)
        self.totalVolumeUsd = try container.decode(String.self, forKey: .totalVolumeUsd)
        self.user = try container.decode(Nullable<LeaderboardPartnersResponseMeUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.firstReferralStartedAt, forKey: .firstReferralStartedAt)
        try container.encode(self.rank, forKey: .rank)
        try container.encode(self.totalEarningsUsd, forKey: .totalEarningsUsd)
        try container.encode(self.totalVolumeUsd, forKey: .totalVolumeUsd)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case firstReferralStartedAt = "first_referral_started_at"
        case rank
        case totalEarningsUsd = "total_earnings_usd"
        case totalVolumeUsd = "total_volume_usd"
        case user
    }
}
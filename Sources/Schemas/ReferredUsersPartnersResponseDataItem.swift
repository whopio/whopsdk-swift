import Foundation

public struct ReferredUsersPartnersResponseDataItem: Codable, Hashable, Sendable {
    /// Number of active businesses this user referred that credit the caller as a second-tier partner, or any earning partner in global mode. An earning-partner filter narrows the count to that partner. Excludes deleted businesses.
    public let businessCount: Int
    /// Total pending and completed affiliate earnings from this user for their current primary referrer, across all tiers, in USD. Includes historical earnings from removed referrals and deleted businesses.
    public let earnings: Money
    /// When the referred user joined Whop, as an ISO 8601 timestamp.
    public let joinedAt: Date
    public let totalEarningsUsd: String
    public let totalVolumeUsd: String
    public let user: ReferredUsersPartnersResponseDataItemUser
    /// Attributed volume over the last 30 days across the business referrals included in business_count, in USD.
    public let volume30D: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        businessCount: Int,
        earnings: Money,
        joinedAt: Date,
        totalEarningsUsd: String,
        totalVolumeUsd: String,
        user: ReferredUsersPartnersResponseDataItemUser,
        volume30D: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.businessCount = businessCount
        self.earnings = earnings
        self.joinedAt = joinedAt
        self.totalEarningsUsd = totalEarningsUsd
        self.totalVolumeUsd = totalVolumeUsd
        self.user = user
        self.volume30D = volume30D
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businessCount = try container.decode(Int.self, forKey: .businessCount)
        self.earnings = try container.decode(Money.self, forKey: .earnings)
        self.joinedAt = try container.decode(Date.self, forKey: .joinedAt)
        self.totalEarningsUsd = try container.decode(String.self, forKey: .totalEarningsUsd)
        self.totalVolumeUsd = try container.decode(String.self, forKey: .totalVolumeUsd)
        self.user = try container.decode(ReferredUsersPartnersResponseDataItemUser.self, forKey: .user)
        self.volume30D = try container.decode(Money.self, forKey: .volume30D)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.businessCount, forKey: .businessCount)
        try container.encode(self.earnings, forKey: .earnings)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.totalEarningsUsd, forKey: .totalEarningsUsd)
        try container.encode(self.totalVolumeUsd, forKey: .totalVolumeUsd)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.volume30D, forKey: .volume30D)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case businessCount = "business_count"
        case earnings
        case joinedAt = "joined_at"
        case totalEarningsUsd = "total_earnings_usd"
        case totalVolumeUsd = "total_volume_usd"
        case user
        case volume30D = "volume_30d"
    }
}
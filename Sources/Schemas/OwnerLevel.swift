import Foundation

public struct OwnerLevel: Codable, Hashable, Sendable {
    /// The level that applies: the highest the owner reached this month or in the 5 months before, from `0` up to `10`.
    public let appliedLevel: Int
    public let levels: [AccountProcessingOfferLevel]
    /// Whop Ads charges paid this calendar month across every account the owner owns, net of refunds, in USD, so it can be negative. An account whose month nets to zero or below is left out.
    public let monthlyAdsSpend: Money
    /// Captured Whop Card spend this calendar month across every account the owner owns, net of refunds, in USD, so it can be negative. An account whose month nets to zero or below is left out.
    public let monthlyCardSpend: Money
    /// Qualifying spend this calendar month across every account the owner owns, plus the owner's personal trading and partner points, in USD: `points` divided by 10.
    public let monthlyQualifyingSpend: Money
    /// Perpetual trading volume filled through Whop this calendar month across every account the owner owns and their personal wallet, in USD. An account whose month nets to zero or below is left out.
    public let monthlyTradingVolume: Money
    /// Points earned this month across every account the owner owns, plus the owner's partner points, rounded down. An account whose month nets below zero counts as zero.
    public let points: Int
    /// This month's points, split by where they were earned. Each source is net of its refunds, so one can be negative.
    public let pointsBySource: OwnerLevelPoints
    /// Points still needed this month to reach the next level, or `null` at level `10`.
    public let pointsToNext: Nullable<Int>
    /// When this month's points reset to zero, as an ISO 8601 timestamp.
    public let resetsAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appliedLevel: Int,
        levels: [AccountProcessingOfferLevel],
        monthlyAdsSpend: Money,
        monthlyCardSpend: Money,
        monthlyQualifyingSpend: Money,
        monthlyTradingVolume: Money,
        points: Int,
        pointsBySource: OwnerLevelPoints,
        pointsToNext: Nullable<Int>,
        resetsAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appliedLevel = appliedLevel
        self.levels = levels
        self.monthlyAdsSpend = monthlyAdsSpend
        self.monthlyCardSpend = monthlyCardSpend
        self.monthlyQualifyingSpend = monthlyQualifyingSpend
        self.monthlyTradingVolume = monthlyTradingVolume
        self.points = points
        self.pointsBySource = pointsBySource
        self.pointsToNext = pointsToNext
        self.resetsAt = resetsAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appliedLevel = try container.decode(Int.self, forKey: .appliedLevel)
        self.levels = try container.decode([AccountProcessingOfferLevel].self, forKey: .levels)
        self.monthlyAdsSpend = try container.decode(Money.self, forKey: .monthlyAdsSpend)
        self.monthlyCardSpend = try container.decode(Money.self, forKey: .monthlyCardSpend)
        self.monthlyQualifyingSpend = try container.decode(Money.self, forKey: .monthlyQualifyingSpend)
        self.monthlyTradingVolume = try container.decode(Money.self, forKey: .monthlyTradingVolume)
        self.points = try container.decode(Int.self, forKey: .points)
        self.pointsBySource = try container.decode(OwnerLevelPoints.self, forKey: .pointsBySource)
        self.pointsToNext = try container.decode(Nullable<Int>.self, forKey: .pointsToNext)
        self.resetsAt = try container.decode(String.self, forKey: .resetsAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appliedLevel, forKey: .appliedLevel)
        try container.encode(self.levels, forKey: .levels)
        try container.encode(self.monthlyAdsSpend, forKey: .monthlyAdsSpend)
        try container.encode(self.monthlyCardSpend, forKey: .monthlyCardSpend)
        try container.encode(self.monthlyQualifyingSpend, forKey: .monthlyQualifyingSpend)
        try container.encode(self.monthlyTradingVolume, forKey: .monthlyTradingVolume)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.pointsBySource, forKey: .pointsBySource)
        try container.encode(self.pointsToNext, forKey: .pointsToNext)
        try container.encode(self.resetsAt, forKey: .resetsAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appliedLevel = "applied_level"
        case levels
        case monthlyAdsSpend = "monthly_ads_spend"
        case monthlyCardSpend = "monthly_card_spend"
        case monthlyQualifyingSpend = "monthly_qualifying_spend"
        case monthlyTradingVolume = "monthly_trading_volume"
        case points
        case pointsBySource = "points_by_source"
        case pointsToNext = "points_to_next"
        case resetsAt = "resets_at"
    }
}
import Foundation

/// Per-bucket ad performance for an ad campaign, ad group, or ad. Bucket grain is set by the `ad_report` query's `granularity` argument.
public struct AdReportBreakdownItemGranularityItem: Codable, Hashable, Sendable {
    /// The bucket's start time as a real UTC instant. `(statDate, statHour)` resolved in the ad account's reporting timezone — render this in the viewer's local timezone.
    public let bucketStart: Date
    /// Clicks in this bucket.
    public let clicks: Int
    /// The bucket size of this row (`hourly`, `daily`, `weekly`, or `monthly`).
    public let granularity: Granularities
    /// Impressions in this bucket.
    public let impressions: Int
    /// Unique users reached in this bucket. Always `0` for hourly rows (Meta does not return reach at hourly grain).
    public let reach: Int
    /// Count of the primary optimization result in this bucket.
    public let resultCount: Nullable<Int>
    /// The type of optimization result represented by `resultCount`.
    public let resultLabelKey: Nullable<ResultLabelKeys>
    /// Advertiser-defined label for the result when `resultLabelKey` is `custom`.
    public let resultLabelOverride: Nullable<String>
    /// Charged spend in this bucket in the requested reporting currency — the amount billed including platform fees, not the platform-side net spend.
    public let spend: Double
    /// Currency of the `spend` value.
    public let spendCurrency: Currencies
    /// The date these stats cover (midnight UTC). For hourly rows, see `statHour` and `bucketStart`.
    public let statDate: Date
    /// Hour of the day in the ad account's reporting timezone (0-23). `null` for daily rows.
    public let statHour: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bucketStart: Date,
        clicks: Int,
        granularity: Granularities,
        impressions: Int,
        reach: Int,
        resultCount: Nullable<Int>,
        resultLabelKey: Nullable<ResultLabelKeys>,
        resultLabelOverride: Nullable<String>,
        spend: Double,
        spendCurrency: Currencies,
        statDate: Date,
        statHour: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bucketStart = bucketStart
        self.clicks = clicks
        self.granularity = granularity
        self.impressions = impressions
        self.reach = reach
        self.resultCount = resultCount
        self.resultLabelKey = resultLabelKey
        self.resultLabelOverride = resultLabelOverride
        self.spend = spend
        self.spendCurrency = spendCurrency
        self.statDate = statDate
        self.statHour = statHour
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bucketStart = try container.decode(Date.self, forKey: .bucketStart)
        self.clicks = try container.decode(Int.self, forKey: .clicks)
        self.granularity = try container.decode(Granularities.self, forKey: .granularity)
        self.impressions = try container.decode(Int.self, forKey: .impressions)
        self.reach = try container.decode(Int.self, forKey: .reach)
        self.resultCount = try container.decode(Nullable<Int>.self, forKey: .resultCount)
        self.resultLabelKey = try container.decode(Nullable<ResultLabelKeys>.self, forKey: .resultLabelKey)
        self.resultLabelOverride = try container.decode(Nullable<String>.self, forKey: .resultLabelOverride)
        self.spend = try container.decode(Double.self, forKey: .spend)
        self.spendCurrency = try container.decode(Currencies.self, forKey: .spendCurrency)
        self.statDate = try container.decode(Date.self, forKey: .statDate)
        self.statHour = try container.decode(Nullable<Int>.self, forKey: .statHour)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bucketStart, forKey: .bucketStart)
        try container.encode(self.clicks, forKey: .clicks)
        try container.encode(self.granularity, forKey: .granularity)
        try container.encode(self.impressions, forKey: .impressions)
        try container.encode(self.reach, forKey: .reach)
        try container.encode(self.resultCount, forKey: .resultCount)
        try container.encode(self.resultLabelKey, forKey: .resultLabelKey)
        try container.encode(self.resultLabelOverride, forKey: .resultLabelOverride)
        try container.encode(self.spend, forKey: .spend)
        try container.encode(self.spendCurrency, forKey: .spendCurrency)
        try container.encode(self.statDate, forKey: .statDate)
        try container.encode(self.statHour, forKey: .statHour)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bucketStart = "bucket_start"
        case clicks
        case granularity
        case impressions
        case reach
        case resultCount = "result_count"
        case resultLabelKey = "result_label_key"
        case resultLabelOverride = "result_label_override"
        case spend
        case spendCurrency = "spend_currency"
        case statDate = "stat_date"
        case statHour = "stat_hour"
    }
}
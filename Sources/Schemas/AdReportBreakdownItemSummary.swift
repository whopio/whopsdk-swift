import Foundation

/// Aggregate totals and rates for this entity over the date range.
public struct AdReportBreakdownItemSummary: Codable, Hashable, Sendable {
    /// Click-through rate (clicks / impressions).
    public let clickThroughRate: Double
    /// Total clicks over the date range.
    public let clicks: Int
    /// Cost per click in the requested reporting currency.
    public let costPerClick: Double
    /// Cost per thousand impressions in the requested reporting currency.
    public let costPerMille: Nullable<Double>
    /// Spend divided by `resultCount`. Null when there are no results.
    public let costPerResult: Nullable<Double>
    /// Average number of times each reached user saw an ad.
    public let frequency: Nullable<Double>
    /// Total impressions over the date range.
    public let impressions: Int
    /// Unique users reached, deduplicated by the external ad platform.
    public let reach: Int
    /// Count of the campaign's primary optimization result (purchases, clicks, etc.) — see `resultLabelKey`.
    public let resultCount: Nullable<Int>
    /// The type of optimization result represented by `resultCount`.
    public let resultLabelKey: Nullable<ResultLabelKeys>
    /// Advertiser-defined label for the result when `resultLabelKey` is `custom`.
    public let resultLabelOverride: Nullable<String>
    /// Alias for `purchaseReturnOnAdSpend` — return on ad spend for purchases, as reported by the external ad platform.
    public let returnOnAdSpend: Nullable<Double>
    /// Total spend over the date range in the requested reporting currency.
    public let spend: Double
    /// Currency of the `spend` value. Matches the requested `currency` when set.
    public let spendCurrency: Nullable<Currencies>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        clickThroughRate: Double,
        clicks: Int,
        costPerClick: Double,
        costPerMille: Nullable<Double>,
        costPerResult: Nullable<Double>,
        frequency: Nullable<Double>,
        impressions: Int,
        reach: Int,
        resultCount: Nullable<Int>,
        resultLabelKey: Nullable<ResultLabelKeys>,
        resultLabelOverride: Nullable<String>,
        returnOnAdSpend: Nullable<Double>,
        spend: Double,
        spendCurrency: Nullable<Currencies>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.clickThroughRate = clickThroughRate
        self.clicks = clicks
        self.costPerClick = costPerClick
        self.costPerMille = costPerMille
        self.costPerResult = costPerResult
        self.frequency = frequency
        self.impressions = impressions
        self.reach = reach
        self.resultCount = resultCount
        self.resultLabelKey = resultLabelKey
        self.resultLabelOverride = resultLabelOverride
        self.returnOnAdSpend = returnOnAdSpend
        self.spend = spend
        self.spendCurrency = spendCurrency
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clickThroughRate = try container.decode(Double.self, forKey: .clickThroughRate)
        self.clicks = try container.decode(Int.self, forKey: .clicks)
        self.costPerClick = try container.decode(Double.self, forKey: .costPerClick)
        self.costPerMille = try container.decode(Nullable<Double>.self, forKey: .costPerMille)
        self.costPerResult = try container.decode(Nullable<Double>.self, forKey: .costPerResult)
        self.frequency = try container.decode(Nullable<Double>.self, forKey: .frequency)
        self.impressions = try container.decode(Int.self, forKey: .impressions)
        self.reach = try container.decode(Int.self, forKey: .reach)
        self.resultCount = try container.decode(Nullable<Int>.self, forKey: .resultCount)
        self.resultLabelKey = try container.decode(Nullable<ResultLabelKeys>.self, forKey: .resultLabelKey)
        self.resultLabelOverride = try container.decode(Nullable<String>.self, forKey: .resultLabelOverride)
        self.returnOnAdSpend = try container.decode(Nullable<Double>.self, forKey: .returnOnAdSpend)
        self.spend = try container.decode(Double.self, forKey: .spend)
        self.spendCurrency = try container.decode(Nullable<Currencies>.self, forKey: .spendCurrency)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.clickThroughRate, forKey: .clickThroughRate)
        try container.encode(self.clicks, forKey: .clicks)
        try container.encode(self.costPerClick, forKey: .costPerClick)
        try container.encode(self.costPerMille, forKey: .costPerMille)
        try container.encode(self.costPerResult, forKey: .costPerResult)
        try container.encode(self.frequency, forKey: .frequency)
        try container.encode(self.impressions, forKey: .impressions)
        try container.encode(self.reach, forKey: .reach)
        try container.encode(self.resultCount, forKey: .resultCount)
        try container.encode(self.resultLabelKey, forKey: .resultLabelKey)
        try container.encode(self.resultLabelOverride, forKey: .resultLabelOverride)
        try container.encode(self.returnOnAdSpend, forKey: .returnOnAdSpend)
        try container.encode(self.spend, forKey: .spend)
        try container.encode(self.spendCurrency, forKey: .spendCurrency)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case clickThroughRate = "click_through_rate"
        case clicks
        case costPerClick = "cost_per_click"
        case costPerMille = "cost_per_mille"
        case costPerResult = "cost_per_result"
        case frequency
        case impressions
        case reach
        case resultCount = "result_count"
        case resultLabelKey = "result_label_key"
        case resultLabelOverride = "result_label_override"
        case returnOnAdSpend = "return_on_ad_spend"
        case spend
        case spendCurrency = "spend_currency"
    }
}
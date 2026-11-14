import Foundation

public struct RetrieveStatsResponseData: Codable, Hashable, Sendable {
    /// Present for webhook_deliveries. False while older deliveries are still being counted in the background: the points cover what is counted so far. Responses are cached for up to a minute, so wait a minute before requesting the same range again.
    public let complete: Nullable<Bool>?
    /// ISO currency the values are denominated in. Present for currency-unit metrics: the convert_to currency, or usd.
    public let currency: Nullable<String>?
    /// One entry per period, oldest first.
    public let points: [RetrieveStatsResponseDataPointsItem]
    /// Whole-window aggregates, present when the metric computes them. Don't derive these from `points`: a rate is measured across the whole window, not averaged across its points, and whole-window unique people are distinct across every bucket.
    public let totals: Nullable<[RetrieveStatsResponseDataTotalsItem]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        complete: Nullable<Bool>? = nil,
        currency: Nullable<String>? = nil,
        points: [RetrieveStatsResponseDataPointsItem],
        totals: Nullable<[RetrieveStatsResponseDataTotalsItem]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.complete = complete
        self.currency = currency
        self.points = points
        self.totals = totals
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.complete = try container.decodeNullableIfPresent(Bool.self, forKey: .complete)
        self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
        self.points = try container.decode([RetrieveStatsResponseDataPointsItem].self, forKey: .points)
        self.totals = try container.decodeNullableIfPresent([RetrieveStatsResponseDataTotalsItem].self, forKey: .totals)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.complete, forKey: .complete)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encode(self.points, forKey: .points)
        try container.encodeNullableIfPresent(self.totals, forKey: .totals)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case complete
        case currency
        case points
        case totals
    }
}
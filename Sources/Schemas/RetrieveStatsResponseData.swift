import Foundation

public struct RetrieveStatsResponseData: Codable, Hashable, Sendable {
    /// ISO currency the values are denominated in. Present for currency-unit metrics: the convert_to currency, or usd.
    public let currency: Nullable<String>?
    /// One entry per period, oldest first.
    public let points: [RetrieveStatsResponseDataPointsItem]
    /// Whole-window aggregates, present when the metric computes them. Don't derive these from `points`: a rate is measured across the whole window, not averaged across its points, and unique-people counts exist only at window level.
    public let totals: Nullable<[RetrieveStatsResponseDataTotalsItem]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: Nullable<String>? = nil,
        points: [RetrieveStatsResponseDataPointsItem],
        totals: Nullable<[RetrieveStatsResponseDataTotalsItem]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.points = points
        self.totals = totals
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
        self.points = try container.decode([RetrieveStatsResponseDataPointsItem].self, forKey: .points)
        self.totals = try container.decodeNullableIfPresent([RetrieveStatsResponseDataTotalsItem].self, forKey: .totals)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encode(self.points, forKey: .points)
        try container.encodeNullableIfPresent(self.totals, forKey: .totals)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case points
        case totals
    }
}
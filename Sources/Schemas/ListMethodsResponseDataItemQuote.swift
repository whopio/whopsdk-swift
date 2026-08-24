import Foundation

/// Fee and delivery estimate for withdrawing the requested amount through this method. Null unless an amount was provided, or when the estimate is unavailable.
public struct ListMethodsResponseDataItemQuote: Codable, Hashable, Sendable {
    /// The withdrawal amount the quote is for.
    public let amount: Float
    /// Currency of the quoted amount.
    public let currency: String
    /// Exchange rate from the withdrawal currency to the destination currency.
    public let exchangeRate: Float
    /// Instant-delivery estimate. Null if the method does not support instant delivery, instant delivery is unavailable for the account, or the amount does not cover the fee.
    public let instant: Nullable<ListMethodsResponseDataItemQuoteInstant>
    /// Maximum withdrawal amount for this method, in the withdrawal currency.
    public let maxLimit: Nullable<Float>
    /// Minimum withdrawal amount for this method, in the withdrawal currency.
    public let minLimit: Float
    /// Standard-delivery estimate. Null if the method does not support standard delivery, or the amount does not cover the fee.
    public let standard: Nullable<ListMethodsResponseDataItemQuoteStandard>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Float,
        currency: String,
        exchangeRate: Float,
        instant: Nullable<ListMethodsResponseDataItemQuoteInstant>,
        maxLimit: Nullable<Float>,
        minLimit: Float,
        standard: Nullable<ListMethodsResponseDataItemQuoteStandard>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.exchangeRate = exchangeRate
        self.instant = instant
        self.maxLimit = maxLimit
        self.minLimit = minLimit
        self.standard = standard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Float.self, forKey: .amount)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.exchangeRate = try container.decode(Float.self, forKey: .exchangeRate)
        self.instant = try container.decode(Nullable<ListMethodsResponseDataItemQuoteInstant>.self, forKey: .instant)
        self.maxLimit = try container.decode(Nullable<Float>.self, forKey: .maxLimit)
        self.minLimit = try container.decode(Float.self, forKey: .minLimit)
        self.standard = try container.decode(Nullable<ListMethodsResponseDataItemQuoteStandard>.self, forKey: .standard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.exchangeRate, forKey: .exchangeRate)
        try container.encode(self.instant, forKey: .instant)
        try container.encode(self.maxLimit, forKey: .maxLimit)
        try container.encode(self.minLimit, forKey: .minLimit)
        try container.encode(self.standard, forKey: .standard)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case exchangeRate = "exchange_rate"
        case instant
        case maxLimit = "max_limit"
        case minLimit = "min_limit"
        case standard
    }
}
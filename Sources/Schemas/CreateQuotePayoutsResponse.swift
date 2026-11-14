import Foundation

public struct CreateQuotePayoutsResponse: Codable, Hashable, Sendable {
    /// Gross payout amount.
    public let amount: Money
    /// How a USD balance pays a bank in another currency: it converts into the payout method's currency, and the payout leaves from the balance in that currency. Null when the payout is paid from the requested balance directly.
    public let conversion: Nullable<CreateQuotePayoutsResponseConversion>
    /// Exact amount quoted for delivery.
    public let destinationAmount: Money
    /// Quoted exchange rate from the source currency to the destination currency.
    public let exchangeRate: Double
    /// When the quote expires.
    public let expiresAt: Date
    /// Fee charged for the payout.
    public let fee: Money
    /// Provider-backed payout quote ID, prefixed `pout_`.
    public let id: String
    /// Interbank mid-market rate, with no spread, for the same conversion as `exchange_rate`. The gap between the two is the cost of the conversion. `null` when the payout provider does no foreign exchange, such as USD to a USD bank account. Also `null` when no market rate from the last 15 minutes is available, and on card-funded quotes.
    public let marketExchangeRate: Nullable<Double>
    /// When `market_exchange_rate` was taken from the market feed, as an ISO 8601 timestamp. `null` when `market_exchange_rate` is `null`.
    public let marketExchangeRateAt: Nullable<Date>
    /// Amount remaining after fees.
    public let netAmount: Money
    public let object: CreateQuotePayoutsResponseObject
    /// Server-signed quote token to submit to POST /payouts.
    public let quoteToken: String
    /// An optional payout method to connect for estimated savings. The quote still uses the requested saved method.
    public let recommendedMethod: Nullable<CreateQuotePayoutsResponseRecommendedMethod>
    /// Server time when the response was prepared, as an ISO 8601 timestamp. Subtract it from `expires_at` to get the remaining quote lifetime without relying on your own clock.
    public let serverTime: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        conversion: Nullable<CreateQuotePayoutsResponseConversion>,
        destinationAmount: Money,
        exchangeRate: Double,
        expiresAt: Date,
        fee: Money,
        id: String,
        marketExchangeRate: Nullable<Double>,
        marketExchangeRateAt: Nullable<Date>,
        netAmount: Money,
        object: CreateQuotePayoutsResponseObject,
        quoteToken: String,
        recommendedMethod: Nullable<CreateQuotePayoutsResponseRecommendedMethod>,
        serverTime: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.conversion = conversion
        self.destinationAmount = destinationAmount
        self.exchangeRate = exchangeRate
        self.expiresAt = expiresAt
        self.fee = fee
        self.id = id
        self.marketExchangeRate = marketExchangeRate
        self.marketExchangeRateAt = marketExchangeRateAt
        self.netAmount = netAmount
        self.object = object
        self.quoteToken = quoteToken
        self.recommendedMethod = recommendedMethod
        self.serverTime = serverTime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.conversion = try container.decode(Nullable<CreateQuotePayoutsResponseConversion>.self, forKey: .conversion)
        self.destinationAmount = try container.decode(Money.self, forKey: .destinationAmount)
        self.exchangeRate = try container.decode(Double.self, forKey: .exchangeRate)
        self.expiresAt = try container.decode(Date.self, forKey: .expiresAt)
        self.fee = try container.decode(Money.self, forKey: .fee)
        self.id = try container.decode(String.self, forKey: .id)
        self.marketExchangeRate = try container.decode(Nullable<Double>.self, forKey: .marketExchangeRate)
        self.marketExchangeRateAt = try container.decode(Nullable<Date>.self, forKey: .marketExchangeRateAt)
        self.netAmount = try container.decode(Money.self, forKey: .netAmount)
        self.object = try container.decode(CreateQuotePayoutsResponseObject.self, forKey: .object)
        self.quoteToken = try container.decode(String.self, forKey: .quoteToken)
        self.recommendedMethod = try container.decode(Nullable<CreateQuotePayoutsResponseRecommendedMethod>.self, forKey: .recommendedMethod)
        self.serverTime = try container.decode(Date.self, forKey: .serverTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.conversion, forKey: .conversion)
        try container.encode(self.destinationAmount, forKey: .destinationAmount)
        try container.encode(self.exchangeRate, forKey: .exchangeRate)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.marketExchangeRate, forKey: .marketExchangeRate)
        try container.encode(self.marketExchangeRateAt, forKey: .marketExchangeRateAt)
        try container.encode(self.netAmount, forKey: .netAmount)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.quoteToken, forKey: .quoteToken)
        try container.encode(self.recommendedMethod, forKey: .recommendedMethod)
        try container.encode(self.serverTime, forKey: .serverTime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case conversion
        case destinationAmount = "destination_amount"
        case exchangeRate = "exchange_rate"
        case expiresAt = "expires_at"
        case fee
        case id
        case marketExchangeRate = "market_exchange_rate"
        case marketExchangeRateAt = "market_exchange_rate_at"
        case netAmount = "net_amount"
        case object
        case quoteToken = "quote_token"
        case recommendedMethod = "recommended_method"
        case serverTime = "server_time"
    }
}
import Foundation

public struct FormCompanyAccountsResponse: Codable, Hashable, Sendable {
    /// Checkout session ID, prefixed `ch_`.
    public let checkoutSessionId: String
    /// Hosted checkout URL. Send the buyer here to pay for the formation; the filing is submitted once payment completes.
    public let checkoutUrl: String
    /// Always `usd`.
    public let currency: String
    /// Total due at checkout in USD cents.
    public let total: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        checkoutSessionId: String,
        checkoutUrl: String,
        currency: String,
        total: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.checkoutSessionId = checkoutSessionId
        self.checkoutUrl = checkoutUrl
        self.currency = currency
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.checkoutSessionId = try container.decode(String.self, forKey: .checkoutSessionId)
        self.checkoutUrl = try container.decode(String.self, forKey: .checkoutUrl)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.total = try container.decode(Int.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.checkoutSessionId, forKey: .checkoutSessionId)
        try container.encode(self.checkoutUrl, forKey: .checkoutUrl)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case checkoutSessionId = "checkout_session_id"
        case checkoutUrl = "checkout_url"
        case currency
        case total
    }
}
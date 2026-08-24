import Foundation

/// The saved payout destination used for this withdrawal (e.g., a bank account or PayPal address). Null if no payout token was used.
public struct WithdrawalPayoutToken: Codable, Hashable, Sendable {
    /// The datetime the payout token was created.
    public let createdAt: Date
    /// The three-letter ISO currency code that payouts are delivered in for this destination.
    public let destinationCurrencyCode: String
    /// The unique identifier for the payout token.
    public let id: String
    /// A user-defined label to help identify this payout destination. Not sent to the provider. Null if no nickname has been set.
    public let nickname: Nullable<String>
    /// The legal name of the account holder receiving payouts. Null if not provided.
    public let payerName: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        destinationCurrencyCode: String,
        id: String,
        nickname: Nullable<String>,
        payerName: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.destinationCurrencyCode = destinationCurrencyCode
        self.id = id
        self.nickname = nickname
        self.payerName = payerName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.destinationCurrencyCode = try container.decode(String.self, forKey: .destinationCurrencyCode)
        self.id = try container.decode(String.self, forKey: .id)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.payerName = try container.decode(Nullable<String>.self, forKey: .payerName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.destinationCurrencyCode, forKey: .destinationCurrencyCode)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.payerName, forKey: .payerName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case destinationCurrencyCode = "destination_currency_code"
        case id
        case nickname
        case payerName = "payer_name"
    }
}
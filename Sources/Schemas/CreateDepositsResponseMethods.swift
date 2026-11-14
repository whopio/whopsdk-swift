import Foundation

/// Available deposit methods for destination.
public struct CreateDepositsResponseMethods: Codable, Hashable, Sendable {
    /// Bank deposit details. Only present when bank deposits are active for the destination account.
    public let bank: Nullable<CreateDepositsResponseMethodsBank>
    /// The charge to a saved payment method. Null unless `payment_method_id` was passed.
    public let card: Nullable<CreateDepositsResponseMethodsCard>
    /// Crypto networks available for this deposit, each with its on-chain deposit address and the tokens accepted on that network. Crypto deposits require a $10 minimum.
    public let crypto: [CreateDepositsResponseMethodsCryptoItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bank: Nullable<CreateDepositsResponseMethodsBank>,
        card: Nullable<CreateDepositsResponseMethodsCard>,
        crypto: [CreateDepositsResponseMethodsCryptoItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bank = bank
        self.card = card
        self.crypto = crypto
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bank = try container.decode(Nullable<CreateDepositsResponseMethodsBank>.self, forKey: .bank)
        self.card = try container.decode(Nullable<CreateDepositsResponseMethodsCard>.self, forKey: .card)
        self.crypto = try container.decode([CreateDepositsResponseMethodsCryptoItem].self, forKey: .crypto)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bank, forKey: .bank)
        try container.encode(self.card, forKey: .card)
        try container.encode(self.crypto, forKey: .crypto)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bank
        case card
        case crypto
    }
}
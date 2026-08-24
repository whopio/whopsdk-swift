import Foundation

/// Available deposit methods for destination.
public struct CreateDepositsResponseMethods: Codable, Hashable, Sendable {
    /// Bank deposit details. Only present when bank deposits are active for the destination account.
    public let bank: Nullable<CreateDepositsResponseMethodsBank>
    /// Crypto networks available for this deposit, each with its on-chain deposit address and the tokens accepted on that network.
    public let crypto: [CreateDepositsResponseMethodsCryptoItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bank: Nullable<CreateDepositsResponseMethodsBank>,
        crypto: [CreateDepositsResponseMethodsCryptoItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bank = bank
        self.crypto = crypto
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bank = try container.decode(Nullable<CreateDepositsResponseMethodsBank>.self, forKey: .bank)
        self.crypto = try container.decode([CreateDepositsResponseMethodsCryptoItem].self, forKey: .crypto)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bank, forKey: .bank)
        try container.encode(self.crypto, forKey: .crypto)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bank
        case crypto
    }
}
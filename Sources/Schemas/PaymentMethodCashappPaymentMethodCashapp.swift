import Foundation

/// The Cash App-specific details for this payment method, including cashtag and buyer ID.
public struct PaymentMethodCashappPaymentMethodCashapp: Codable, Hashable, Sendable {
    /// The unique and immutable identifier assigned by Cash App to the buyer. Null if not available.
    public let buyerId: Nullable<String>
    /// The public cashtag handle of the buyer on Cash App. Null if not available.
    public let cashtag: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        buyerId: Nullable<String>,
        cashtag: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.buyerId = buyerId
        self.cashtag = cashtag
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.buyerId = try container.decode(Nullable<String>.self, forKey: .buyerId)
        self.cashtag = try container.decode(Nullable<String>.self, forKey: .cashtag)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.buyerId, forKey: .buyerId)
        try container.encode(self.cashtag, forKey: .cashtag)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case buyerId = "buyer_id"
        case cashtag
    }
}
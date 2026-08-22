import Foundation

/// The iDEAL-specific details for this payment method, including bank name and BIC.
public struct PaymentMethodListItemIdealPaymentMethodIdeal: Codable, Hashable, Sendable {
    /// The name of the customer's bank used for the iDEAL transaction. Null if not available.
    public let bank: Nullable<String>
    /// The Bank Identifier Code (BIC/SWIFT) of the customer's bank. Null if not available.
    public let bic: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bank: Nullable<String>,
        bic: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bank = bank
        self.bic = bic
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bank = try container.decode(Nullable<String>.self, forKey: .bank)
        self.bic = try container.decode(Nullable<String>.self, forKey: .bic)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bank, forKey: .bank)
        try container.encode(self.bic, forKey: .bic)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bank
        case bic
    }
}
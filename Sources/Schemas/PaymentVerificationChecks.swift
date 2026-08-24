import Foundation

/// The issuer's address and card security code check results for this payment. Null when the processor returned none.
public struct PaymentVerificationChecks: Codable, Hashable, Sendable {
    /// Whether the billing street address the customer entered matched the address the issuer has on file.
    public let addressLine1: Nullable<String>
    /// Whether the cardholder name the customer entered matched the name the issuer has on file.
    public let cardHolderName: Nullable<String>
    /// Whether the CVV / CVC the customer entered matched the card.
    public let cardSecurityCode: Nullable<String>
    /// Whether the billing postal code the customer entered matched the postal code the issuer has on file.
    public let zipCode: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        addressLine1: Nullable<String>,
        cardHolderName: Nullable<String>,
        cardSecurityCode: Nullable<String>,
        zipCode: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.addressLine1 = addressLine1
        self.cardHolderName = cardHolderName
        self.cardSecurityCode = cardSecurityCode
        self.zipCode = zipCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.addressLine1 = try container.decode(Nullable<String>.self, forKey: .addressLine1)
        self.cardHolderName = try container.decode(Nullable<String>.self, forKey: .cardHolderName)
        self.cardSecurityCode = try container.decode(Nullable<String>.self, forKey: .cardSecurityCode)
        self.zipCode = try container.decode(Nullable<String>.self, forKey: .zipCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.addressLine1, forKey: .addressLine1)
        try container.encode(self.cardHolderName, forKey: .cardHolderName)
        try container.encode(self.cardSecurityCode, forKey: .cardSecurityCode)
        try container.encode(self.zipCode, forKey: .zipCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case addressLine1 = "address_line1"
        case cardHolderName = "card_holder_name"
        case cardSecurityCode = "card_security_code"
        case zipCode = "zip_code"
    }
}
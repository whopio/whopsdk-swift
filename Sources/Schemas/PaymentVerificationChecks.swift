import Foundation

public struct PaymentVerificationChecks: Codable, Hashable, Sendable {
    /// The Address Verification Service (AVS) result for the billing street address.
    public let addressLine1: Nullable<String>
    /// The Acquirer Reference Number (ARN) that traces this charge through the card network, or null when the processor did not return one.
    public let arn: Nullable<String>
    /// The card issuer's authorization code for this charge, or null when the processor did not return one.
    public let authorizationCode: Nullable<String>
    /// Whether the cardholder name matched the issuer's records.
    public let cardHolderName: Nullable<String>
    /// The Card Verification Value (CVV/CVC) result.
    public let cardSecurityCode: Nullable<String>
    /// The Address Verification Service (AVS) result for the billing postal code.
    public let zipCode: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        addressLine1: Nullable<String>,
        arn: Nullable<String>,
        authorizationCode: Nullable<String>,
        cardHolderName: Nullable<String>,
        cardSecurityCode: Nullable<String>,
        zipCode: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.addressLine1 = addressLine1
        self.arn = arn
        self.authorizationCode = authorizationCode
        self.cardHolderName = cardHolderName
        self.cardSecurityCode = cardSecurityCode
        self.zipCode = zipCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.addressLine1 = try container.decode(Nullable<String>.self, forKey: .addressLine1)
        self.arn = try container.decode(Nullable<String>.self, forKey: .arn)
        self.authorizationCode = try container.decode(Nullable<String>.self, forKey: .authorizationCode)
        self.cardHolderName = try container.decode(Nullable<String>.self, forKey: .cardHolderName)
        self.cardSecurityCode = try container.decode(Nullable<String>.self, forKey: .cardSecurityCode)
        self.zipCode = try container.decode(Nullable<String>.self, forKey: .zipCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.addressLine1, forKey: .addressLine1)
        try container.encode(self.arn, forKey: .arn)
        try container.encode(self.authorizationCode, forKey: .authorizationCode)
        try container.encode(self.cardHolderName, forKey: .cardHolderName)
        try container.encode(self.cardSecurityCode, forKey: .cardSecurityCode)
        try container.encode(self.zipCode, forKey: .zipCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case addressLine1 = "address_line1"
        case arn
        case authorizationCode = "authorization_code"
        case cardHolderName = "card_holder_name"
        case cardSecurityCode = "card_security_code"
        case zipCode = "zip_code"
    }
}
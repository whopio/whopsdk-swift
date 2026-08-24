import Foundation

public struct LedgerActivityResourceBank: Codable, Hashable, Sendable {
    public let bank: Nullable<LedgerActivityResourceBankBank>
    public let card: Nullable<LedgerActivityResourceBankCard>
    /// Email identifier for email-based payment methods.
    public let emailIdentifier: Nullable<String>
    /// Payment gateway type.
    public let gatewayType: Nullable<String>
    /// Payment method ID.
    public let id: String
    public let object: LedgerActivityResourceBankObject
    /// Payment method type.
    public let paymentMethodType: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bank: Nullable<LedgerActivityResourceBankBank>,
        card: Nullable<LedgerActivityResourceBankCard>,
        emailIdentifier: Nullable<String>,
        gatewayType: Nullable<String>,
        id: String,
        object: LedgerActivityResourceBankObject,
        paymentMethodType: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bank = bank
        self.card = card
        self.emailIdentifier = emailIdentifier
        self.gatewayType = gatewayType
        self.id = id
        self.object = object
        self.paymentMethodType = paymentMethodType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bank = try container.decode(Nullable<LedgerActivityResourceBankBank>.self, forKey: .bank)
        self.card = try container.decode(Nullable<LedgerActivityResourceBankCard>.self, forKey: .card)
        self.emailIdentifier = try container.decode(Nullable<String>.self, forKey: .emailIdentifier)
        self.gatewayType = try container.decode(Nullable<String>.self, forKey: .gatewayType)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(LedgerActivityResourceBankObject.self, forKey: .object)
        self.paymentMethodType = try container.decode(Nullable<String>.self, forKey: .paymentMethodType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bank, forKey: .bank)
        try container.encode(self.card, forKey: .card)
        try container.encode(self.emailIdentifier, forKey: .emailIdentifier)
        try container.encode(self.gatewayType, forKey: .gatewayType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bank
        case card
        case emailIdentifier = "email_identifier"
        case gatewayType = "gateway_type"
        case id
        case object
        case paymentMethodType = "payment_method_type"
    }
}
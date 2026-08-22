import Foundation

/// A saved US bank account payment method, including bank name, last four digits, and account type.
public struct PaymentMethodListItemUsBankAccountPaymentMethod: Codable, Hashable, Sendable {
    /// The time of the event in ISO 8601 UTC format with millisecond precision
    public let createdAt: Date
    /// Every rendition of the icon to display this payment method with. A saved card carries its brand's icon (Visa, Mastercard, ...) rather than the generic card art.
    public let icons: PaymentMethodListItemUsBankAccountPaymentMethodIcons
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// The type of payment instrument stored on file (e.g., card, us_bank_account, cashapp, ideal, sepa_debit).
    public let paymentMethodType: PaymentMethodTypes
    /// The bank account-specific details for this payment method, including bank name and last four digits.
    public let usBankAccount: PaymentMethodListItemUsBankAccountPaymentMethodUsBankAccount
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        icons: PaymentMethodListItemUsBankAccountPaymentMethodIcons,
        id: String,
        paymentMethodType: PaymentMethodTypes,
        usBankAccount: PaymentMethodListItemUsBankAccountPaymentMethodUsBankAccount,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.icons = icons
        self.id = id
        self.paymentMethodType = paymentMethodType
        self.usBankAccount = usBankAccount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.icons = try container.decode(PaymentMethodListItemUsBankAccountPaymentMethodIcons.self, forKey: .icons)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentMethodType = try container.decode(PaymentMethodTypes.self, forKey: .paymentMethodType)
        self.usBankAccount = try container.decode(PaymentMethodListItemUsBankAccountPaymentMethodUsBankAccount.self, forKey: .usBankAccount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.icons, forKey: .icons)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.usBankAccount, forKey: .usBankAccount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case icons
        case id
        case paymentMethodType = "payment_method_type"
        case usBankAccount = "us_bank_account"
    }
}
import Foundation

/// A Whop balance the buyer can pay with — their own, or an account's they hold permission to spend. Charged by naming its ledger id on a `saved` confirmation token — it is a live wallet, not a stored credential, so it cannot be vaulted or charged off-session.
public struct PaymentMethodListItemPlatformBalancePaymentMethod: Codable, Hashable, Sendable {
    /// The time of the event in ISO 8601 UTC format with millisecond precision
    public let createdAt: Date
    /// Every rendition of the icon to display this payment method with. A saved card carries its brand's icon (Visa, Mastercard, ...) rather than the generic card art.
    public let icons: PaymentMethodListItemPlatformBalancePaymentMethodIcons
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let id: String
    /// The type of payment instrument stored on file (e.g., card, us_bank_account, cashapp, ideal, sepa_debit).
    public let paymentMethodType: PaymentMethodTypes
    /// What is available to spend, and whether the account may spend it.
    public let platformBalance: PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalance
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        icons: PaymentMethodListItemPlatformBalancePaymentMethodIcons,
        id: String,
        paymentMethodType: PaymentMethodTypes,
        platformBalance: PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalance,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.icons = icons
        self.id = id
        self.paymentMethodType = paymentMethodType
        self.platformBalance = platformBalance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.icons = try container.decode(PaymentMethodListItemPlatformBalancePaymentMethodIcons.self, forKey: .icons)
        self.id = try container.decode(String.self, forKey: .id)
        self.paymentMethodType = try container.decode(PaymentMethodTypes.self, forKey: .paymentMethodType)
        self.platformBalance = try container.decode(PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalance.self, forKey: .platformBalance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.icons, forKey: .icons)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.platformBalance, forKey: .platformBalance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case icons
        case id
        case paymentMethodType = "payment_method_type"
        case platformBalance = "platform_balance"
    }
}
import Foundation

public struct PaymentMethodDisplay: Codable, Hashable, Sendable {
    /// Present when the category is `bank_debit`. Empty until the account is charged.
    public let bankDebit: PaymentMethodDisplayPreview?
    /// Details of the card, when the category is `card`.
    public let card: PaymentMethodDisplayPreview?
    /// The family the type belongs to.
    public let category: PaymentMethodDisplayCategory
    /// Human-readable label for the method, e.g. `Visa •••• 4242`.
    public let displayName: String
    /// The saved payment method this preview came from, or `null` when the buyer supplied a new one.
    public let id: Nullable<String>
    /// Details of the stored card, when the category is `saved`. Absent for a balance.
    public let saved: PaymentMethodDisplayPreview?
    /// The payment method type, e.g. `card`, `apple_pay`, `klarna`.
    public let type: String
    /// Details of the network token the wallet supplied, when the category is `wallet`.
    public let wallet: PaymentMethodDisplayPreview?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bankDebit: PaymentMethodDisplayPreview? = nil,
        card: PaymentMethodDisplayPreview? = nil,
        category: PaymentMethodDisplayCategory,
        displayName: String,
        id: Nullable<String>,
        saved: PaymentMethodDisplayPreview? = nil,
        type: String,
        wallet: PaymentMethodDisplayPreview? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bankDebit = bankDebit
        self.card = card
        self.category = category
        self.displayName = displayName
        self.id = id
        self.saved = saved
        self.type = type
        self.wallet = wallet
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bankDebit = try container.decodeIfPresent(PaymentMethodDisplayPreview.self, forKey: .bankDebit)
        self.card = try container.decodeIfPresent(PaymentMethodDisplayPreview.self, forKey: .card)
        self.category = try container.decode(PaymentMethodDisplayCategory.self, forKey: .category)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.saved = try container.decodeIfPresent(PaymentMethodDisplayPreview.self, forKey: .saved)
        self.type = try container.decode(String.self, forKey: .type)
        self.wallet = try container.decodeIfPresent(PaymentMethodDisplayPreview.self, forKey: .wallet)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.bankDebit, forKey: .bankDebit)
        try container.encodeIfPresent(self.card, forKey: .card)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.saved, forKey: .saved)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.wallet, forKey: .wallet)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bankDebit = "bank_debit"
        case card
        case category
        case displayName = "display_name"
        case id
        case saved
        case type
        case wallet
    }
}
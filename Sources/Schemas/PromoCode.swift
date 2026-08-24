import Foundation

public struct PromoCode: Codable, Hashable, Sendable {
    /// Account that owns the promo code.
    public let account: AccountSummary
    /// Discount amount. Percentage discounts are represented as a decimal fraction.
    public let amountOff: Double
    /// Whether the promo code is restricted to churned customers.
    public let churnedUsersOnly: Bool
    /// Code entered at checkout.
    public let code: Nullable<String>
    /// When the promo code was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Currency used for a fixed-amount discount.
    public let currency: PromoCodeCurrency
    /// How long the discount applies.
    public let duration: PromoCodeDuration
    /// Whether the promo code applies only to existing memberships.
    public let existingMembershipsOnly: Bool
    /// When the promo code expires, as an ISO 8601 timestamp.
    public let expiresAt: Nullable<String>
    /// Promo code ID, prefixed `promo_`.
    public let id: String
    /// Custom key-value metadata stored on the promo code.
    public let metadata: [String: JSONValue]
    /// Whether the promo code is restricted to new customers.
    public let newUsersOnly: Bool
    /// Whether each customer may redeem the promo code only once.
    public let onePerCustomer: Bool
    /// Product the promo code is restricted to, or `null` when it is not product-scoped.
    public let product: Nullable<PromoCodeProduct>
    /// Billing intervals the discount applies to.
    public let promoDurationMonths: Nullable<Int>
    /// Whether the discount is percentage-based or a fixed amount.
    public let promoType: PromoCodePromoType
    /// Promo code lifecycle status.
    public let status: PromoCodeStatus
    /// Maximum uses when stock is limited.
    public let stock: Int
    /// Whether the promo code has no redemption limit.
    public let unlimitedStock: Bool
    /// When the promo code was updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Memberships that used the promo code.
    public let uses: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: AccountSummary,
        amountOff: Double,
        churnedUsersOnly: Bool,
        code: Nullable<String>,
        createdAt: String,
        currency: PromoCodeCurrency,
        duration: PromoCodeDuration,
        existingMembershipsOnly: Bool,
        expiresAt: Nullable<String>,
        id: String,
        metadata: [String: JSONValue],
        newUsersOnly: Bool,
        onePerCustomer: Bool,
        product: Nullable<PromoCodeProduct>,
        promoDurationMonths: Nullable<Int>,
        promoType: PromoCodePromoType,
        status: PromoCodeStatus,
        stock: Int,
        unlimitedStock: Bool,
        updatedAt: String,
        uses: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.amountOff = amountOff
        self.churnedUsersOnly = churnedUsersOnly
        self.code = code
        self.createdAt = createdAt
        self.currency = currency
        self.duration = duration
        self.existingMembershipsOnly = existingMembershipsOnly
        self.expiresAt = expiresAt
        self.id = id
        self.metadata = metadata
        self.newUsersOnly = newUsersOnly
        self.onePerCustomer = onePerCustomer
        self.product = product
        self.promoDurationMonths = promoDurationMonths
        self.promoType = promoType
        self.status = status
        self.stock = stock
        self.unlimitedStock = unlimitedStock
        self.updatedAt = updatedAt
        self.uses = uses
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(AccountSummary.self, forKey: .account)
        self.amountOff = try container.decode(Double.self, forKey: .amountOff)
        self.churnedUsersOnly = try container.decode(Bool.self, forKey: .churnedUsersOnly)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(PromoCodeCurrency.self, forKey: .currency)
        self.duration = try container.decode(PromoCodeDuration.self, forKey: .duration)
        self.existingMembershipsOnly = try container.decode(Bool.self, forKey: .existingMembershipsOnly)
        self.expiresAt = try container.decode(Nullable<String>.self, forKey: .expiresAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.newUsersOnly = try container.decode(Bool.self, forKey: .newUsersOnly)
        self.onePerCustomer = try container.decode(Bool.self, forKey: .onePerCustomer)
        self.product = try container.decode(Nullable<PromoCodeProduct>.self, forKey: .product)
        self.promoDurationMonths = try container.decode(Nullable<Int>.self, forKey: .promoDurationMonths)
        self.promoType = try container.decode(PromoCodePromoType.self, forKey: .promoType)
        self.status = try container.decode(PromoCodeStatus.self, forKey: .status)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.unlimitedStock = try container.decode(Bool.self, forKey: .unlimitedStock)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.uses = try container.decode(Int.self, forKey: .uses)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.amountOff, forKey: .amountOff)
        try container.encode(self.churnedUsersOnly, forKey: .churnedUsersOnly)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.duration, forKey: .duration)
        try container.encode(self.existingMembershipsOnly, forKey: .existingMembershipsOnly)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.newUsersOnly, forKey: .newUsersOnly)
        try container.encode(self.onePerCustomer, forKey: .onePerCustomer)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.promoDurationMonths, forKey: .promoDurationMonths)
        try container.encode(self.promoType, forKey: .promoType)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.stock, forKey: .stock)
        try container.encode(self.unlimitedStock, forKey: .unlimitedStock)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.uses, forKey: .uses)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case amountOff = "amount_off"
        case churnedUsersOnly = "churned_users_only"
        case code
        case createdAt = "created_at"
        case currency
        case duration
        case existingMembershipsOnly = "existing_memberships_only"
        case expiresAt = "expires_at"
        case id
        case metadata
        case newUsersOnly = "new_users_only"
        case onePerCustomer = "one_per_customer"
        case product
        case promoDurationMonths = "promo_duration_months"
        case promoType = "promo_type"
        case status
        case stock
        case unlimitedStock = "unlimited_stock"
        case updatedAt = "updated_at"
        case uses
    }
}
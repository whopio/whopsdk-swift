import Foundation

public struct CheckoutConfiguration: Codable, Hashable, Sendable {
    /// Account ID, prefixed `biz_`.
    public let accountId: String
    /// Affiliate code applied at checkout, or `null` when none is set.
    public let affiliateCode: Nullable<String>
    /// When the checkout configuration was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Currency used for setup-mode payment method availability; defaults to `usd` when omitted.
    public let currency: Nullable<CheckoutConfigurationCurrency>
    /// The configuration governing a checkout mounted from this configuration, resolved through every layer (its own overrides, the variant's, and the account's) — the shape a session's `payment_method_configuration` carries. Apply it over the payment method types catalogue for the offerable set. `null` means platform defaults; `payment_method_configuration` stays this configuration's own editable override.
    public let effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>
    public let id: String
    /// Custom key-value metadata copied to payments and memberships. `null` without the `checkout_configuration:basic:read` scope.
    public let metadata: Nullable<[String: JSONValue]>
    /// Controls whether checkout charges the buyer immediately or saves payment details for later.
    public let mode: CheckoutConfigurationMode
    /// Payment method overrides for this checkout. `null` when it uses the variant or platform defaults.
    public let paymentMethodConfiguration: Nullable<[String: JSONValue]>
    /// Checkout URL you can send to customers.
    public let purchaseUrl: Nullable<String>
    /// URL customers are sent to after checkout, or `null` when no redirect is configured.
    public let redirectUrl: Nullable<String>
    /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. Applies in setup mode; `null` uses frictionless 3DS. Payment mode uses the variant policy.
    public let threeDsLevel: Nullable<CheckoutConfigurationThreeDsLevel>
    /// When the checkout configuration was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Variant used for payment checkout. `null` in setup mode.
    public let variant: Nullable<CheckoutConfigurationVariant>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        affiliateCode: Nullable<String>,
        createdAt: String,
        currency: Nullable<CheckoutConfigurationCurrency>,
        effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>,
        id: String,
        metadata: Nullable<[String: JSONValue]>,
        mode: CheckoutConfigurationMode,
        paymentMethodConfiguration: Nullable<[String: JSONValue]>,
        purchaseUrl: Nullable<String>,
        redirectUrl: Nullable<String>,
        threeDsLevel: Nullable<CheckoutConfigurationThreeDsLevel>,
        updatedAt: String,
        variant: Nullable<CheckoutConfigurationVariant>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.affiliateCode = affiliateCode
        self.createdAt = createdAt
        self.currency = currency
        self.effectivePaymentMethodConfiguration = effectivePaymentMethodConfiguration
        self.id = id
        self.metadata = metadata
        self.mode = mode
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.purchaseUrl = purchaseUrl
        self.redirectUrl = redirectUrl
        self.threeDsLevel = threeDsLevel
        self.updatedAt = updatedAt
        self.variant = variant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.affiliateCode = try container.decode(Nullable<String>.self, forKey: .affiliateCode)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<CheckoutConfigurationCurrency>.self, forKey: .currency)
        self.effectivePaymentMethodConfiguration = try container.decode(Nullable<CheckoutSessionPaymentMethodConfiguration>.self, forKey: .effectivePaymentMethodConfiguration)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.mode = try container.decode(CheckoutConfigurationMode.self, forKey: .mode)
        self.paymentMethodConfiguration = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .paymentMethodConfiguration)
        self.purchaseUrl = try container.decode(Nullable<String>.self, forKey: .purchaseUrl)
        self.redirectUrl = try container.decode(Nullable<String>.self, forKey: .redirectUrl)
        self.threeDsLevel = try container.decode(Nullable<CheckoutConfigurationThreeDsLevel>.self, forKey: .threeDsLevel)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.variant = try container.decode(Nullable<CheckoutConfigurationVariant>.self, forKey: .variant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.affiliateCode, forKey: .affiliateCode)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.effectivePaymentMethodConfiguration, forKey: .effectivePaymentMethodConfiguration)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.mode, forKey: .mode)
        try container.encode(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encode(self.purchaseUrl, forKey: .purchaseUrl)
        try container.encode(self.redirectUrl, forKey: .redirectUrl)
        try container.encode(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.variant, forKey: .variant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case affiliateCode = "affiliate_code"
        case createdAt = "created_at"
        case currency
        case effectivePaymentMethodConfiguration = "effective_payment_method_configuration"
        case id
        case metadata
        case mode
        case paymentMethodConfiguration = "payment_method_configuration"
        case purchaseUrl = "purchase_url"
        case redirectUrl = "redirect_url"
        case threeDsLevel = "three_ds_level"
        case updatedAt = "updated_at"
        case variant
    }
}
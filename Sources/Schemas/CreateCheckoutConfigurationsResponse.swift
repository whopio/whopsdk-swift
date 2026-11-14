import Foundation

public struct CreateCheckoutConfigurationsResponse: Codable, Hashable, Sendable {
    /// Account ID, prefixed `biz_`.
    public let accountId: String
    /// Affiliate code applied at checkout, or `null` when none is set.
    public let affiliateCode: Nullable<String>?
    /// When the checkout configuration was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Currency used for setup-mode payment method availability; defaults to `usd` when omitted.
    public let currency: Nullable<String>?
    /// The configuration governing a checkout mounted from this configuration, resolved through every layer (its own overrides, the variant's, and the account's) — the shape a session's `payment_method_configuration` carries. Apply it over the payment method types catalogue for the offerable set. `null` means platform defaults; `payment_method_configuration` stays this configuration's own editable override.
    public let effectivePaymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration>?
    /// Checkout configuration ID, prefixed `ch_`.
    public let id: String
    /// Custom key-value metadata copied to payments and memberships. `null` without the `checkout_configuration:basic:read` scope.
    public let metadata: Nullable<[String: JSONValue]>?
    /// Controls whether checkout charges the buyer immediately or saves payment details for later.
    public let mode: CreateCheckoutConfigurationsResponseMode
    /// Payment method overrides for this checkout. `null` when it uses the variant or platform defaults.
    public let paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsResponsePaymentMethodConfiguration>?
    /// Checkout URL you can send to customers.
    public let purchaseUrl: Nullable<String>?
    /// URL customers are sent to after checkout, or `null` when no redirect is configured.
    public let redirectUrl: Nullable<String>?
    /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. Applies in setup mode; `null` uses frictionless 3DS. Payment mode uses the variant policy.
    public let threeDsLevel: Nullable<CreateCheckoutConfigurationsResponseThreeDsLevel>?
    /// When the checkout configuration was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Variant used for payment checkout. `null` in setup mode.
    public let variant: Nullable<CreateCheckoutConfigurationsResponseVariant>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        affiliateCode: Nullable<String>? = nil,
        createdAt: String,
        currency: Nullable<String>? = nil,
        effectivePaymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration>? = nil,
        id: String,
        metadata: Nullable<[String: JSONValue]>? = nil,
        mode: CreateCheckoutConfigurationsResponseMode,
        paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsResponsePaymentMethodConfiguration>? = nil,
        purchaseUrl: Nullable<String>? = nil,
        redirectUrl: Nullable<String>? = nil,
        threeDsLevel: Nullable<CreateCheckoutConfigurationsResponseThreeDsLevel>? = nil,
        updatedAt: String,
        variant: Nullable<CreateCheckoutConfigurationsResponseVariant>? = nil,
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
        self.affiliateCode = try container.decodeNullableIfPresent(String.self, forKey: .affiliateCode)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
        self.effectivePaymentMethodConfiguration = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration.self, forKey: .effectivePaymentMethodConfiguration)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
        self.mode = try container.decode(CreateCheckoutConfigurationsResponseMode.self, forKey: .mode)
        self.paymentMethodConfiguration = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsResponsePaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
        self.purchaseUrl = try container.decodeNullableIfPresent(String.self, forKey: .purchaseUrl)
        self.redirectUrl = try container.decodeNullableIfPresent(String.self, forKey: .redirectUrl)
        self.threeDsLevel = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsResponseThreeDsLevel.self, forKey: .threeDsLevel)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.variant = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsResponseVariant.self, forKey: .variant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.affiliateCode, forKey: .affiliateCode)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.effectivePaymentMethodConfiguration, forKey: .effectivePaymentMethodConfiguration)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        try container.encode(self.mode, forKey: .mode)
        try container.encodeNullableIfPresent(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encodeNullableIfPresent(self.purchaseUrl, forKey: .purchaseUrl)
        try container.encodeNullableIfPresent(self.redirectUrl, forKey: .redirectUrl)
        try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeNullableIfPresent(self.variant, forKey: .variant)
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
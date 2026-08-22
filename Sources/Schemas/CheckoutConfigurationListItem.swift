import Foundation

/// A checkout configuration is a reusable configuration for a checkout, including the plan, affiliate, and custom metadata. Payments and memberships created from a checkout session inherit its metadata.
public struct CheckoutConfigurationListItem: Codable, Hashable, Sendable {
    /// The affiliate code to use for the checkout configuration
    public let affiliateCode: Nullable<String>
    /// The ID of the company to use for the checkout configuration
    public let companyId: String
    /// The currency to use for the configuration when in 'setup' mode. This is used to target which currency specific payment methods are available. If not provided, it will default to 'usd' when in setup mode.
    public let currency: Nullable<Currencies>
    /// The unique identifier for the checkout session.
    public let id: String
    /// The metadata to use for the checkout configuration
    public let metadata: Nullable<[String: JSONValue]>
    /// The mode of the checkout session.
    public let mode: CheckoutModes
    /// The explicit payment method configuration for the session, if any. This currently only works in 'setup' mode. Use the plan's payment_method_configuration for payment method.
    public let paymentMethodConfiguration: Nullable<CheckoutConfigurationListItemPaymentMethodConfiguration>
    /// The plan to use for the checkout configuration
    public let plan: Nullable<CheckoutConfigurationListItemPlan>
    /// A URL you can send to customers to complete a checkout. It looks like `/checkout/ch_xxxx/`
    public let purchaseUrl: String
    /// The URL to redirect the user to after the checkout configuration is created
    public let redirectUrl: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        affiliateCode: Nullable<String>,
        companyId: String,
        currency: Nullable<Currencies>,
        id: String,
        metadata: Nullable<[String: JSONValue]>,
        mode: CheckoutModes,
        paymentMethodConfiguration: Nullable<CheckoutConfigurationListItemPaymentMethodConfiguration>,
        plan: Nullable<CheckoutConfigurationListItemPlan>,
        purchaseUrl: String,
        redirectUrl: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.affiliateCode = affiliateCode
        self.companyId = companyId
        self.currency = currency
        self.id = id
        self.metadata = metadata
        self.mode = mode
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.plan = plan
        self.purchaseUrl = purchaseUrl
        self.redirectUrl = redirectUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.affiliateCode = try container.decode(Nullable<String>.self, forKey: .affiliateCode)
        self.companyId = try container.decode(String.self, forKey: .companyId)
        self.currency = try container.decode(Nullable<Currencies>.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.mode = try container.decode(CheckoutModes.self, forKey: .mode)
        self.paymentMethodConfiguration = try container.decode(Nullable<CheckoutConfigurationListItemPaymentMethodConfiguration>.self, forKey: .paymentMethodConfiguration)
        self.plan = try container.decode(Nullable<CheckoutConfigurationListItemPlan>.self, forKey: .plan)
        self.purchaseUrl = try container.decode(String.self, forKey: .purchaseUrl)
        self.redirectUrl = try container.decode(Nullable<String>.self, forKey: .redirectUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.affiliateCode, forKey: .affiliateCode)
        try container.encode(self.companyId, forKey: .companyId)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.mode, forKey: .mode)
        try container.encode(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.purchaseUrl, forKey: .purchaseUrl)
        try container.encode(self.redirectUrl, forKey: .redirectUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case affiliateCode = "affiliate_code"
        case companyId = "company_id"
        case currency
        case id
        case metadata
        case mode
        case paymentMethodConfiguration = "payment_method_configuration"
        case plan
        case purchaseUrl = "purchase_url"
        case redirectUrl = "redirect_url"
    }
}
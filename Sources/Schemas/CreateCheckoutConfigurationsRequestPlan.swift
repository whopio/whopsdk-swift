import Foundation

/// Plan attributes used to create or find a plan for this checkout configuration. Mutually exclusive with `plan_id`.
public struct CreateCheckoutConfigurationsRequestPlan: Codable, Hashable, Sendable {
    /// Account ID for the inline plan, prefixed `biz_`. Defaults to the account resolved from the request.
    public let accountId: Nullable<String>?
    /// Recurring billing interval in days, such as 30 for monthly or 365 for annual.
    public let billingPeriod: Nullable<Int>?
    /// Three-letter ISO currency code for the plan's prices.
    public let currency: Nullable<String>?
    /// Customer-visible plan description.
    public let description: Nullable<String>?
    /// Access duration in days for expiration-based plans.
    public let expirationDays: Nullable<Int>?
    /// Whether to create a new plan instead of reusing a matching one.
    public let forceCreateNewPlan: Nullable<Bool>?
    /// Initial purchase price in the plan currency.
    public let initialPrice: Nullable<Double>?
    /// Custom key-value metadata stored on the plan.
    public let metadata: Nullable<[String: JSONValue]>?
    /// Tax classification override for this plan.
    public let overrideTaxType: Nullable<String>?
    /// Payment method overrides for the inline plan. `null` uses platform defaults.
    public let paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsRequestPlanPaymentMethodConfiguration>?
    /// Billing model for the plan.
    public let planType: Nullable<CreateCheckoutConfigurationsRequestPlanPlanType>?
    /// Product ID the inline plan should belong to, prefixed `prod_`.
    public let productId: Nullable<String>?
    /// Sales method for the plan.
    public let releaseMethod: Nullable<CreateCheckoutConfigurationsRequestPlanReleaseMethod>?
    /// Recurring price charged each billing period.
    public let renewalPrice: Nullable<Double>?
    /// Units available for purchase.
    public let stock: Nullable<Int>?
    /// 3D Secure behavior for the inline plan, or `null` to use the account default.
    public let threeDsLevel: Nullable<CreateCheckoutConfigurationsRequestPlanThreeDsLevel>?
    /// Plan display name shown to customers.
    public let title: Nullable<String>?
    /// Free trial days before the first renewal charge.
    public let trialPeriodDays: Nullable<Int>?
    /// Whether the plan has unlimited stock.
    public let unlimitedStock: Nullable<Bool>?
    /// Whether the plan is visible to customers or hidden from public view.
    public let visibility: Nullable<CreateCheckoutConfigurationsRequestPlanVisibility>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>? = nil,
        billingPeriod: Nullable<Int>? = nil,
        currency: Nullable<String>? = nil,
        description: Nullable<String>? = nil,
        expirationDays: Nullable<Int>? = nil,
        forceCreateNewPlan: Nullable<Bool>? = nil,
        initialPrice: Nullable<Double>? = nil,
        metadata: Nullable<[String: JSONValue]>? = nil,
        overrideTaxType: Nullable<String>? = nil,
        paymentMethodConfiguration: Nullable<CreateCheckoutConfigurationsRequestPlanPaymentMethodConfiguration>? = nil,
        planType: Nullable<CreateCheckoutConfigurationsRequestPlanPlanType>? = nil,
        productId: Nullable<String>? = nil,
        releaseMethod: Nullable<CreateCheckoutConfigurationsRequestPlanReleaseMethod>? = nil,
        renewalPrice: Nullable<Double>? = nil,
        stock: Nullable<Int>? = nil,
        threeDsLevel: Nullable<CreateCheckoutConfigurationsRequestPlanThreeDsLevel>? = nil,
        title: Nullable<String>? = nil,
        trialPeriodDays: Nullable<Int>? = nil,
        unlimitedStock: Nullable<Bool>? = nil,
        visibility: Nullable<CreateCheckoutConfigurationsRequestPlanVisibility>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.billingPeriod = billingPeriod
        self.currency = currency
        self.description = description
        self.expirationDays = expirationDays
        self.forceCreateNewPlan = forceCreateNewPlan
        self.initialPrice = initialPrice
        self.metadata = metadata
        self.overrideTaxType = overrideTaxType
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.planType = planType
        self.productId = productId
        self.releaseMethod = releaseMethod
        self.renewalPrice = renewalPrice
        self.stock = stock
        self.threeDsLevel = threeDsLevel
        self.title = title
        self.trialPeriodDays = trialPeriodDays
        self.unlimitedStock = unlimitedStock
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
        self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
        self.currency = try container.decodeNullableIfPresent(String.self, forKey: .currency)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.expirationDays = try container.decodeNullableIfPresent(Int.self, forKey: .expirationDays)
        self.forceCreateNewPlan = try container.decodeNullableIfPresent(Bool.self, forKey: .forceCreateNewPlan)
        self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
        self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
        self.overrideTaxType = try container.decodeNullableIfPresent(String.self, forKey: .overrideTaxType)
        self.paymentMethodConfiguration = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPlanPaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
        self.planType = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPlanPlanType.self, forKey: .planType)
        self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
        self.releaseMethod = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPlanReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
        self.stock = try container.decodeNullableIfPresent(Int.self, forKey: .stock)
        self.threeDsLevel = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPlanThreeDsLevel.self, forKey: .threeDsLevel)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.trialPeriodDays = try container.decodeNullableIfPresent(Int.self, forKey: .trialPeriodDays)
        self.unlimitedStock = try container.decodeNullableIfPresent(Bool.self, forKey: .unlimitedStock)
        self.visibility = try container.decodeNullableIfPresent(CreateCheckoutConfigurationsRequestPlanVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.expirationDays, forKey: .expirationDays)
        try container.encodeNullableIfPresent(self.forceCreateNewPlan, forKey: .forceCreateNewPlan)
        try container.encodeNullableIfPresent(self.initialPrice, forKey: .initialPrice)
        try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        try container.encodeNullableIfPresent(self.overrideTaxType, forKey: .overrideTaxType)
        try container.encodeNullableIfPresent(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encodeNullableIfPresent(self.planType, forKey: .planType)
        try container.encodeNullableIfPresent(self.productId, forKey: .productId)
        try container.encodeNullableIfPresent(self.releaseMethod, forKey: .releaseMethod)
        try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
        try container.encodeNullableIfPresent(self.stock, forKey: .stock)
        try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
        try container.encodeNullableIfPresent(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encodeNullableIfPresent(self.unlimitedStock, forKey: .unlimitedStock)
        try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case billingPeriod = "billing_period"
        case currency
        case description
        case expirationDays = "expiration_days"
        case forceCreateNewPlan = "force_create_new_plan"
        case initialPrice = "initial_price"
        case metadata
        case overrideTaxType = "override_tax_type"
        case paymentMethodConfiguration = "payment_method_configuration"
        case planType = "plan_type"
        case productId = "product_id"
        case releaseMethod = "release_method"
        case renewalPrice = "renewal_price"
        case stock
        case threeDsLevel = "three_ds_level"
        case title
        case trialPeriodDays = "trial_period_days"
        case unlimitedStock = "unlimited_stock"
        case visibility
    }
}
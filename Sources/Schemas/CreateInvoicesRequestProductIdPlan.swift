import Foundation

/// The plan attributes defining the price, currency, and billing interval for this invoice.
public struct CreateInvoicesRequestProductIdPlan: Codable, Hashable, Sendable {
    /// Whether this plan accepts local currency payments via adaptive pricing.
    public let adaptivePricingEnabled: Nullable<Bool>?
    /// The interval in days at which the plan charges (renewal plans).
    public let billingPeriod: Nullable<Int>?
    /// The three-letter ISO currency code for the plan's pricing. Defaults to USD.
    public let currency: Nullable<Currencies>?
    /// An array of custom field objects.
    public let customFields: Nullable<[CreateInvoicesRequestProductIdPlanCustomFieldsItem]>?
    /// The description of the plan.
    public let description: Nullable<String>?
    /// The number of days until the membership expires and revokes access (expiration plans). For example, 365 for a one-year access period.
    public let expirationDays: Nullable<Int>?
    /// An additional amount charged upon first purchase. Use only if a one time payment OR you want to charge an additional amount on top of the renewal price. Provided as a number in the specified currency. Eg: 10.43 for $10.43
    public let initialPrice: Nullable<Double>?
    /// A personal description or notes section for the business.
    public let internalNotes: Nullable<String>?
    /// Whether this plan uses legacy payment method controls
    public let legacyPaymentMethodControls: Nullable<Bool>?
    /// The explicit payment method configuration for the plan. If not provided, the platform or company's defaults will apply.
    public let paymentMethodConfiguration: Nullable<CreateInvoicesRequestProductIdPlanPaymentMethodConfiguration>?
    /// Indicates if the plan is a one time payment or recurring.
    public let planType: Nullable<PlanTypes>?
    /// This is the release method the business uses to sell this plan.
    public let releaseMethod: Nullable<ReleaseMethod>?
    /// The amount the customer is charged every billing period. Use only if a recurring payment. Provided as a number in the specified currency. Eg: 10.43 for $10.43
    public let renewalPrice: Nullable<Double>?
    /// The number of units available for purchase.
    public let stock: Nullable<Int>?
    /// The number of free trial days added before a renewal plan.
    public let trialPeriodDays: Nullable<Int>?
    /// When true, the plan has unlimited stock (stock field is ignored). When false, purchases are limited by the stock field.
    public let unlimitedStock: Nullable<Bool>?
    /// Shows or hides the plan from public/business view.
    public let visibility: Nullable<Visibility>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adaptivePricingEnabled: Nullable<Bool>? = nil,
        billingPeriod: Nullable<Int>? = nil,
        currency: Nullable<Currencies>? = nil,
        customFields: Nullable<[CreateInvoicesRequestProductIdPlanCustomFieldsItem]>? = nil,
        description: Nullable<String>? = nil,
        expirationDays: Nullable<Int>? = nil,
        initialPrice: Nullable<Double>? = nil,
        internalNotes: Nullable<String>? = nil,
        legacyPaymentMethodControls: Nullable<Bool>? = nil,
        paymentMethodConfiguration: Nullable<CreateInvoicesRequestProductIdPlanPaymentMethodConfiguration>? = nil,
        planType: Nullable<PlanTypes>? = nil,
        releaseMethod: Nullable<ReleaseMethod>? = nil,
        renewalPrice: Nullable<Double>? = nil,
        stock: Nullable<Int>? = nil,
        trialPeriodDays: Nullable<Int>? = nil,
        unlimitedStock: Nullable<Bool>? = nil,
        visibility: Nullable<Visibility>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adaptivePricingEnabled = adaptivePricingEnabled
        self.billingPeriod = billingPeriod
        self.currency = currency
        self.customFields = customFields
        self.description = description
        self.expirationDays = expirationDays
        self.initialPrice = initialPrice
        self.internalNotes = internalNotes
        self.legacyPaymentMethodControls = legacyPaymentMethodControls
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.planType = planType
        self.releaseMethod = releaseMethod
        self.renewalPrice = renewalPrice
        self.stock = stock
        self.trialPeriodDays = trialPeriodDays
        self.unlimitedStock = unlimitedStock
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adaptivePricingEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .adaptivePricingEnabled)
        self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
        self.currency = try container.decodeNullableIfPresent(Currencies.self, forKey: .currency)
        self.customFields = try container.decodeNullableIfPresent([CreateInvoicesRequestProductIdPlanCustomFieldsItem].self, forKey: .customFields)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.expirationDays = try container.decodeNullableIfPresent(Int.self, forKey: .expirationDays)
        self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
        self.internalNotes = try container.decodeNullableIfPresent(String.self, forKey: .internalNotes)
        self.legacyPaymentMethodControls = try container.decodeNullableIfPresent(Bool.self, forKey: .legacyPaymentMethodControls)
        self.paymentMethodConfiguration = try container.decodeNullableIfPresent(CreateInvoicesRequestProductIdPlanPaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
        self.planType = try container.decodeNullableIfPresent(PlanTypes.self, forKey: .planType)
        self.releaseMethod = try container.decodeNullableIfPresent(ReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
        self.stock = try container.decodeNullableIfPresent(Int.self, forKey: .stock)
        self.trialPeriodDays = try container.decodeNullableIfPresent(Int.self, forKey: .trialPeriodDays)
        self.unlimitedStock = try container.decodeNullableIfPresent(Bool.self, forKey: .unlimitedStock)
        self.visibility = try container.decodeNullableIfPresent(Visibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
        try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
        try container.encodeNullableIfPresent(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.customFields, forKey: .customFields)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.expirationDays, forKey: .expirationDays)
        try container.encodeNullableIfPresent(self.initialPrice, forKey: .initialPrice)
        try container.encodeNullableIfPresent(self.internalNotes, forKey: .internalNotes)
        try container.encodeNullableIfPresent(self.legacyPaymentMethodControls, forKey: .legacyPaymentMethodControls)
        try container.encodeNullableIfPresent(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encodeNullableIfPresent(self.planType, forKey: .planType)
        try container.encodeNullableIfPresent(self.releaseMethod, forKey: .releaseMethod)
        try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
        try container.encodeNullableIfPresent(self.stock, forKey: .stock)
        try container.encodeNullableIfPresent(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encodeNullableIfPresent(self.unlimitedStock, forKey: .unlimitedStock)
        try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adaptivePricingEnabled = "adaptive_pricing_enabled"
        case billingPeriod = "billing_period"
        case currency
        case customFields = "custom_fields"
        case description
        case expirationDays = "expiration_days"
        case initialPrice = "initial_price"
        case internalNotes = "internal_notes"
        case legacyPaymentMethodControls = "legacy_payment_method_controls"
        case paymentMethodConfiguration = "payment_method_configuration"
        case planType = "plan_type"
        case releaseMethod = "release_method"
        case renewalPrice = "renewal_price"
        case stock
        case trialPeriodDays = "trial_period_days"
        case unlimitedStock = "unlimited_stock"
        case visibility
    }
}
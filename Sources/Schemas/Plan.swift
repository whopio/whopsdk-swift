import Foundation

public struct Plan: Codable, Hashable, Sendable {
    /// Account that sells this plan; `null` for standalone invoice plans.
    public let account: Nullable<AccountSummary>
    /// Whether adaptive pricing is enabled for this plan. Raw setting — does not check processor compatibility or feature flags.
    public let adaptivePricingEnabled: Bool
    /// Number of days between recurring charges, such as 30 for monthly or 365 for annual. `null` for one-time plans.
    public let billingPeriod: Nullable<Double>
    /// Billing intervals the cancellation discount applies to (`0` forever, `1` first payment, or a month count). `null` when none is offered or the actor lacks the `plan:basic:read` scope.
    public let cancelDiscountIntervals: Nullable<Double>
    /// Cancellation discount as a whole-number percentage. `null` when none is offered or the actor lacks the `plan:basic:read` scope.
    public let cancelDiscountPercentage: Nullable<Double>
    /// Plan-level checkout styling (`background_color`, `button_color`, `font_family`, `border_style`); `null` inherits the account default.
    public let checkoutStyling: Nullable<[String: JSONValue]>
    /// Whether tax is collected on purchases of this plan, based on the account's tax configuration.
    public let collectTax: Bool
    /// When the plan was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code for this plan's prices.
    public let currency: PlanCurrency
    public let customFields: [PlanCustomField]
    /// Whether the plan can be deleted (it has no memberships or waitlist entries). `null` unless the actor has the `plan:basic:read` scope on the plan's account.
    public let deletable: Nullable<Bool>
    /// Customer-visible plan description. Maximum 1000 characters. `null` if no description is set.
    public let description: Nullable<String>
    /// The configuration governing a checkout for this plan, resolved through every layer (the plan's own and the account's) — the shape a session's `payment_method_configuration` carries. Apply it over the payment method types catalogue for the offerable set. `null` means platform defaults; `payment_method_configuration` stays the plan's own editable override.
    public let effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>
    /// Access duration in days for expiration-based plans, such as 365 for a one-year pass. `null` for plans without an expiration.
    public let expirationDays: Nullable<Double>
    /// Human-readable price for display (currency + interval), e.g. "$10 / month".
    public let formattedPrice: String
    /// Plan ID, prefixed `plan_`.
    public let id: String
    /// Pricing-tier image (`url`, `blurhash`) shown on the product page; `null` when no image is set.
    public let image: Nullable<[String: JSONValue]>
    /// Initial purchase price in plan currency.
    public let initialPrice: Double
    /// Private notes not shown to customers. `null` unless the actor has the `plan:basic:read` scope on the plan's account.
    public let internalNotes: Nullable<String>
    /// Invoice this plan was generated for; `null` unless created for an invoice.
    public let invoice: Nullable<[String: JSONValue]>
    /// Active memberships through this plan. `null` unless the actor has the `plan:basic:read` scope on the plan's account.
    public let memberCount: Nullable<Double>
    /// Custom key-value pairs stored on the plan. Included in webhook payloads for payment and membership events. Maximum 50 keys, 100 characters per key, 500 characters per value. The reserved keys `custom_cta` and `custom_cta_url`, when set, override the product's checkout call to action for this plan.
    public let metadata: Nullable<[String: JSONValue]>
    /// Whether a cancellation discount is offered. `null` unless the actor has the `plan:basic:read` scope on the plan's account.
    public let offerCancelDiscount: Nullable<Bool>
    /// Payment method configuration (`enabled`, `disabled`, `include_platform_defaults`); `null` when plan uses default settings.
    public let paymentMethodConfiguration: Nullable<[String: JSONValue]>
    /// Billing model for this plan.
    public let planType: PlanPlanType
    /// Product this plan belongs to; `null` for standalone plans.
    public let product: Nullable<[String: JSONValue]>
    /// URL where customers can purchase this plan directly.
    public let purchaseUrl: String
    /// Sales method for this plan.
    public let releaseMethod: PlanReleaseMethod
    /// Recurring price charged every billing period.
    public let renewalPrice: Double
    /// Installment payments required before the subscription pauses. Must be greater than 1. `null` if split pay is not configured.
    public let splitPayRequiredPayments: Nullable<Double>
    /// Units available for purchase. `null` unless the actor has the `plan:basic:read` scope on the plan's account.
    public let stock: Nullable<Double>
    /// Original initial price shown with a strikethrough, in the plan's currency. `null` when no strikethrough is set.
    public let strikeThroughInitialPrice: Nullable<Double>
    /// Original renewal price shown with a strikethrough, in the plan's currency. `null` when no strikethrough is set.
    public let strikeThroughRenewalPrice: Nullable<Double>
    /// How tax is handled for this plan, including whether tax is included in the price, added at checkout, or not configured.
    public let taxType: PlanTaxType
    /// 3D Secure behavior for this plan; `null` inherits the account default.
    public let threeDsLevel: Nullable<PlanThreeDsLevel>
    /// Plan display name shown to customers. Maximum 30 characters. `null` if no title has been set.
    public let title: Nullable<String>
    /// Free trial days before the first renewal charge. `null` if no trial is configured or the user has already used a trial for this plan.
    public let trialPeriodDays: Nullable<Double>
    /// Whether the plan has unlimited stock. When `true`, the `stock` field is ignored; waitlist plans always report `true`.
    public let unlimitedStock: Bool
    /// When the plan was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Controls where this plan can be seen. When `hidden`, the plan is reachable only by its direct link.
    public let visibility: PlanVisibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<AccountSummary>,
        adaptivePricingEnabled: Bool,
        billingPeriod: Nullable<Double>,
        cancelDiscountIntervals: Nullable<Double>,
        cancelDiscountPercentage: Nullable<Double>,
        checkoutStyling: Nullable<[String: JSONValue]>,
        collectTax: Bool,
        createdAt: String,
        currency: PlanCurrency,
        customFields: [PlanCustomField],
        deletable: Nullable<Bool>,
        description: Nullable<String>,
        effectivePaymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>,
        expirationDays: Nullable<Double>,
        formattedPrice: String,
        id: String,
        image: Nullable<[String: JSONValue]>,
        initialPrice: Double,
        internalNotes: Nullable<String>,
        invoice: Nullable<[String: JSONValue]>,
        memberCount: Nullable<Double>,
        metadata: Nullable<[String: JSONValue]>,
        offerCancelDiscount: Nullable<Bool>,
        paymentMethodConfiguration: Nullable<[String: JSONValue]>,
        planType: PlanPlanType,
        product: Nullable<[String: JSONValue]>,
        purchaseUrl: String,
        releaseMethod: PlanReleaseMethod,
        renewalPrice: Double,
        splitPayRequiredPayments: Nullable<Double>,
        stock: Nullable<Double>,
        strikeThroughInitialPrice: Nullable<Double>,
        strikeThroughRenewalPrice: Nullable<Double>,
        taxType: PlanTaxType,
        threeDsLevel: Nullable<PlanThreeDsLevel>,
        title: Nullable<String>,
        trialPeriodDays: Nullable<Double>,
        unlimitedStock: Bool,
        updatedAt: String,
        visibility: PlanVisibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.adaptivePricingEnabled = adaptivePricingEnabled
        self.billingPeriod = billingPeriod
        self.cancelDiscountIntervals = cancelDiscountIntervals
        self.cancelDiscountPercentage = cancelDiscountPercentage
        self.checkoutStyling = checkoutStyling
        self.collectTax = collectTax
        self.createdAt = createdAt
        self.currency = currency
        self.customFields = customFields
        self.deletable = deletable
        self.description = description
        self.effectivePaymentMethodConfiguration = effectivePaymentMethodConfiguration
        self.expirationDays = expirationDays
        self.formattedPrice = formattedPrice
        self.id = id
        self.image = image
        self.initialPrice = initialPrice
        self.internalNotes = internalNotes
        self.invoice = invoice
        self.memberCount = memberCount
        self.metadata = metadata
        self.offerCancelDiscount = offerCancelDiscount
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.planType = planType
        self.product = product
        self.purchaseUrl = purchaseUrl
        self.releaseMethod = releaseMethod
        self.renewalPrice = renewalPrice
        self.splitPayRequiredPayments = splitPayRequiredPayments
        self.stock = stock
        self.strikeThroughInitialPrice = strikeThroughInitialPrice
        self.strikeThroughRenewalPrice = strikeThroughRenewalPrice
        self.taxType = taxType
        self.threeDsLevel = threeDsLevel
        self.title = title
        self.trialPeriodDays = trialPeriodDays
        self.unlimitedStock = unlimitedStock
        self.updatedAt = updatedAt
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<AccountSummary>.self, forKey: .account)
        self.adaptivePricingEnabled = try container.decode(Bool.self, forKey: .adaptivePricingEnabled)
        self.billingPeriod = try container.decode(Nullable<Double>.self, forKey: .billingPeriod)
        self.cancelDiscountIntervals = try container.decode(Nullable<Double>.self, forKey: .cancelDiscountIntervals)
        self.cancelDiscountPercentage = try container.decode(Nullable<Double>.self, forKey: .cancelDiscountPercentage)
        self.checkoutStyling = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .checkoutStyling)
        self.collectTax = try container.decode(Bool.self, forKey: .collectTax)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(PlanCurrency.self, forKey: .currency)
        self.customFields = try container.decode([PlanCustomField].self, forKey: .customFields)
        self.deletable = try container.decode(Nullable<Bool>.self, forKey: .deletable)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.effectivePaymentMethodConfiguration = try container.decode(Nullable<CheckoutSessionPaymentMethodConfiguration>.self, forKey: .effectivePaymentMethodConfiguration)
        self.expirationDays = try container.decode(Nullable<Double>.self, forKey: .expirationDays)
        self.formattedPrice = try container.decode(String.self, forKey: .formattedPrice)
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .image)
        self.initialPrice = try container.decode(Double.self, forKey: .initialPrice)
        self.internalNotes = try container.decode(Nullable<String>.self, forKey: .internalNotes)
        self.invoice = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .invoice)
        self.memberCount = try container.decode(Nullable<Double>.self, forKey: .memberCount)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.offerCancelDiscount = try container.decode(Nullable<Bool>.self, forKey: .offerCancelDiscount)
        self.paymentMethodConfiguration = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .paymentMethodConfiguration)
        self.planType = try container.decode(PlanPlanType.self, forKey: .planType)
        self.product = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .product)
        self.purchaseUrl = try container.decode(String.self, forKey: .purchaseUrl)
        self.releaseMethod = try container.decode(PlanReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decode(Double.self, forKey: .renewalPrice)
        self.splitPayRequiredPayments = try container.decode(Nullable<Double>.self, forKey: .splitPayRequiredPayments)
        self.stock = try container.decode(Nullable<Double>.self, forKey: .stock)
        self.strikeThroughInitialPrice = try container.decode(Nullable<Double>.self, forKey: .strikeThroughInitialPrice)
        self.strikeThroughRenewalPrice = try container.decode(Nullable<Double>.self, forKey: .strikeThroughRenewalPrice)
        self.taxType = try container.decode(PlanTaxType.self, forKey: .taxType)
        self.threeDsLevel = try container.decode(Nullable<PlanThreeDsLevel>.self, forKey: .threeDsLevel)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.trialPeriodDays = try container.decode(Nullable<Double>.self, forKey: .trialPeriodDays)
        self.unlimitedStock = try container.decode(Bool.self, forKey: .unlimitedStock)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.visibility = try container.decode(PlanVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.cancelDiscountIntervals, forKey: .cancelDiscountIntervals)
        try container.encode(self.cancelDiscountPercentage, forKey: .cancelDiscountPercentage)
        try container.encode(self.checkoutStyling, forKey: .checkoutStyling)
        try container.encode(self.collectTax, forKey: .collectTax)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customFields, forKey: .customFields)
        try container.encode(self.deletable, forKey: .deletable)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.effectivePaymentMethodConfiguration, forKey: .effectivePaymentMethodConfiguration)
        try container.encode(self.expirationDays, forKey: .expirationDays)
        try container.encode(self.formattedPrice, forKey: .formattedPrice)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.internalNotes, forKey: .internalNotes)
        try container.encode(self.invoice, forKey: .invoice)
        try container.encode(self.memberCount, forKey: .memberCount)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.offerCancelDiscount, forKey: .offerCancelDiscount)
        try container.encode(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encode(self.planType, forKey: .planType)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.purchaseUrl, forKey: .purchaseUrl)
        try container.encode(self.releaseMethod, forKey: .releaseMethod)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.splitPayRequiredPayments, forKey: .splitPayRequiredPayments)
        try container.encode(self.stock, forKey: .stock)
        try container.encode(self.strikeThroughInitialPrice, forKey: .strikeThroughInitialPrice)
        try container.encode(self.strikeThroughRenewalPrice, forKey: .strikeThroughRenewalPrice)
        try container.encode(self.taxType, forKey: .taxType)
        try container.encode(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encode(self.unlimitedStock, forKey: .unlimitedStock)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case adaptivePricingEnabled = "adaptive_pricing_enabled"
        case billingPeriod = "billing_period"
        case cancelDiscountIntervals = "cancel_discount_intervals"
        case cancelDiscountPercentage = "cancel_discount_percentage"
        case checkoutStyling = "checkout_styling"
        case collectTax = "collect_tax"
        case createdAt = "created_at"
        case currency
        case customFields = "custom_fields"
        case deletable
        case description
        case effectivePaymentMethodConfiguration = "effective_payment_method_configuration"
        case expirationDays = "expiration_days"
        case formattedPrice = "formatted_price"
        case id
        case image
        case initialPrice = "initial_price"
        case internalNotes = "internal_notes"
        case invoice
        case memberCount = "member_count"
        case metadata
        case offerCancelDiscount = "offer_cancel_discount"
        case paymentMethodConfiguration = "payment_method_configuration"
        case planType = "plan_type"
        case product
        case purchaseUrl = "purchase_url"
        case releaseMethod = "release_method"
        case renewalPrice = "renewal_price"
        case splitPayRequiredPayments = "split_pay_required_payments"
        case stock
        case strikeThroughInitialPrice = "strike_through_initial_price"
        case strikeThroughRenewalPrice = "strike_through_renewal_price"
        case taxType = "tax_type"
        case threeDsLevel = "three_ds_level"
        case title
        case trialPeriodDays = "trial_period_days"
        case unlimitedStock = "unlimited_stock"
        case updatedAt = "updated_at"
        case visibility
    }
}
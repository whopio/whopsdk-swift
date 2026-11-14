import Foundation

public struct PlanListItem: Codable, Hashable, Sendable {
    /// Account that sells this variant; `null` for standalone invoice variants.
    public let account: Nullable<AccountSummary>
    /// Whether adaptive pricing is enabled for this variant. Raw setting — does not check processor compatibility or feature flags.
    public let adaptivePricingEnabled: Bool
    /// Whether more than one unit can be purchased in an order. Renewal variants cannot enable it. When `false`, checkouts, carts, and invoices reject a quantity above 1.
    public let allowMultipleQuantity: Bool
    /// Attribute values that distinguish this variant within its product, as a map of attribute name to value, e.g. `{"color": "Blue", "size": "Large"}`. Names are snake_case identifiers and come back in alphabetical order. Every attributed variant on a product carries the same attribute names and a distinct set of values; the product lists the full option set as `variant_attributes`. `null` when the variant has no attributes.
    public let attributes: Nullable<[String: Nullable<String>]>
    /// Number of days between recurring charges, such as 30 for monthly or 365 for annual. `null` for one-time variants.
    public let billingPeriod: Nullable<Double>
    /// Billing model for this variant.
    public let billingType: PlanListItemBillingType
    /// How long the cancellation discount lasts: `0` forever, `1` the next payment only, or a number of calendar months from when the customer accepts it. `null` when none is offered or the actor lacks the `plan:basic:read` scope.
    public let cancelDiscountIntervals: Nullable<Double>
    /// Cancellation discount as a whole-number percentage. `null` when none is offered or the actor lacks the `plan:basic:read` scope.
    public let cancelDiscountPercentage: Nullable<Double>
    /// Variant-level checkout styling (`background_color`, `button_color`, `font_family`, `border_style`); `null` inherits the account default.
    public let checkoutStyling: Nullable<[String: JSONValue]>
    /// When the variant was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO 4217 code of the currency every price on this variant is stated in, lowercase: the variant's own currency, or the `presentment_currency` the read asked for when the variant can be converted into it.
    public let currency: String
    public let customFields: [PlanCustomField]
    /// Customer-visible variant description. Maximum 1000 characters. `null` if no description is set.
    public let description: Nullable<String>
    /// Access duration in days for expiration-based variants, such as 365 for a one-year pass. `null` for variants without an expiration.
    public let expirationDays: Nullable<Double>
    /// Human-readable price for display (currency + interval) in `currency`, e.g. "$10 / month".
    public let formattedPrice: String
    /// Variant ID, prefixed `plan_`.
    public let id: String
    /// Pricing-tier image (`url`, `blurhash`) shown on the product page; `null` when no image is set.
    public let image: Nullable<[String: JSONValue]>
    /// Initial purchase price, in `currency`.
    public let initialPrice: Double
    /// Total charged at checkout for one unit, before promo codes and tax: `initial_price` plus the first `renewal_price` for recurring variants, or `initial_price` alone while a free trial applies. The trial does not apply when the viewing user has already used one for this variant. Stated in `currency`.
    public let initialPriceDue: Money
    /// Private notes not shown to customers. `null` unless the actor has the `plan:basic:read` scope on the variant's account.
    public let internalNotes: Nullable<String>
    /// Invoice this variant was generated for; `null` unless created for an invoice.
    public let invoice: Nullable<[String: JSONValue]>
    /// Active memberships through this variant. `null` unless the actor has the `plan:basic:read` scope on the variant's account.
    public let memberCount: Nullable<Double>
    /// Custom key-value pairs stored on the variant. Included in webhook payloads for payment and membership events. Maximum 50 keys, 100 characters per key, 500 characters per value. The reserved keys `custom_cta` and `custom_cta_url`, when set, override the product's checkout call to action for this variant.
    public let metadata: Nullable<[String: JSONValue]>
    /// Whether a cancellation discount is offered. `null` unless the actor has the `plan:basic:read` scope on the variant's account.
    public let offerCancelDiscount: Nullable<Bool>
    /// Payment method configuration (`enabled`, `disabled`, `include_platform_defaults`); `null` when variant uses default settings.
    public let paymentMethodConfiguration: Nullable<[String: JSONValue]>
    /// Product this variant belongs to; `null` for standalone variants.
    public let product: Nullable<[String: JSONValue]>
    /// URL where customers can purchase this variant directly.
    public let purchaseUrl: String
    /// Sales method for this variant.
    public let releaseMethod: PlanListItemReleaseMethod
    /// Recurring price charged every billing period, in `currency`.
    public let renewalPrice: Double
    /// Stock keeping unit, free text set by the seller (e.g. `TSHIRT-LARGE-BLUE`). Not enforced unique. `null` when unset.
    public let sku: Nullable<String>
    /// Installment payments required before the subscription pauses. Must be greater than 1. `null` if split pay is not configured.
    public let splitPayRequiredPayments: Nullable<Double>
    /// Units available for purchase. `null` unless the actor has the `plan:basic:read` scope on the variant's account.
    public let stock: Nullable<Double>
    /// Original initial price shown with a strikethrough, in `currency`. `null` when no strikethrough is set.
    public let strikeThroughInitialPrice: Nullable<Double>
    /// Original renewal price shown with a strikethrough, in `currency`. `null` when no strikethrough is set.
    public let strikeThroughRenewalPrice: Nullable<Double>
    /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. `null` inherits the account default.
    public let threeDsLevel: Nullable<PlanListItemThreeDsLevel>
    /// Variant display name shown to customers. Maximum 30 characters. A variant created without one defaults to its attribute values joined with ` / `. `null` if no title has been set.
    public let title: Nullable<String>
    /// Free trial days before the first renewal charge. `null` if no trial is configured or the user has already used a trial for this variant.
    public let trialPeriodDays: Nullable<Double>
    /// Whether the variant has unlimited stock. When `true`, the `stock` field is ignored; waitlist variants always report `true`.
    public let unlimitedStock: Bool
    /// When the variant was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Controls where this variant can be seen. When `hidden`, the variant is reachable only by its direct link.
    public let visibility: PlanListItemVisibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<AccountSummary>,
        adaptivePricingEnabled: Bool,
        allowMultipleQuantity: Bool,
        attributes: Nullable<[String: Nullable<String>]>,
        billingPeriod: Nullable<Double>,
        billingType: PlanListItemBillingType,
        cancelDiscountIntervals: Nullable<Double>,
        cancelDiscountPercentage: Nullable<Double>,
        checkoutStyling: Nullable<[String: JSONValue]>,
        createdAt: String,
        currency: String,
        customFields: [PlanCustomField],
        description: Nullable<String>,
        expirationDays: Nullable<Double>,
        formattedPrice: String,
        id: String,
        image: Nullable<[String: JSONValue]>,
        initialPrice: Double,
        initialPriceDue: Money,
        internalNotes: Nullable<String>,
        invoice: Nullable<[String: JSONValue]>,
        memberCount: Nullable<Double>,
        metadata: Nullable<[String: JSONValue]>,
        offerCancelDiscount: Nullable<Bool>,
        paymentMethodConfiguration: Nullable<[String: JSONValue]>,
        product: Nullable<[String: JSONValue]>,
        purchaseUrl: String,
        releaseMethod: PlanListItemReleaseMethod,
        renewalPrice: Double,
        sku: Nullable<String>,
        splitPayRequiredPayments: Nullable<Double>,
        stock: Nullable<Double>,
        strikeThroughInitialPrice: Nullable<Double>,
        strikeThroughRenewalPrice: Nullable<Double>,
        threeDsLevel: Nullable<PlanListItemThreeDsLevel>,
        title: Nullable<String>,
        trialPeriodDays: Nullable<Double>,
        unlimitedStock: Bool,
        updatedAt: String,
        visibility: PlanListItemVisibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.adaptivePricingEnabled = adaptivePricingEnabled
        self.allowMultipleQuantity = allowMultipleQuantity
        self.attributes = attributes
        self.billingPeriod = billingPeriod
        self.billingType = billingType
        self.cancelDiscountIntervals = cancelDiscountIntervals
        self.cancelDiscountPercentage = cancelDiscountPercentage
        self.checkoutStyling = checkoutStyling
        self.createdAt = createdAt
        self.currency = currency
        self.customFields = customFields
        self.description = description
        self.expirationDays = expirationDays
        self.formattedPrice = formattedPrice
        self.id = id
        self.image = image
        self.initialPrice = initialPrice
        self.initialPriceDue = initialPriceDue
        self.internalNotes = internalNotes
        self.invoice = invoice
        self.memberCount = memberCount
        self.metadata = metadata
        self.offerCancelDiscount = offerCancelDiscount
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.product = product
        self.purchaseUrl = purchaseUrl
        self.releaseMethod = releaseMethod
        self.renewalPrice = renewalPrice
        self.sku = sku
        self.splitPayRequiredPayments = splitPayRequiredPayments
        self.stock = stock
        self.strikeThroughInitialPrice = strikeThroughInitialPrice
        self.strikeThroughRenewalPrice = strikeThroughRenewalPrice
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
        self.allowMultipleQuantity = try container.decode(Bool.self, forKey: .allowMultipleQuantity)
        self.attributes = try container.decode(Nullable<[String: Nullable<String>]>.self, forKey: .attributes)
        self.billingPeriod = try container.decode(Nullable<Double>.self, forKey: .billingPeriod)
        self.billingType = try container.decode(PlanListItemBillingType.self, forKey: .billingType)
        self.cancelDiscountIntervals = try container.decode(Nullable<Double>.self, forKey: .cancelDiscountIntervals)
        self.cancelDiscountPercentage = try container.decode(Nullable<Double>.self, forKey: .cancelDiscountPercentage)
        self.checkoutStyling = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .checkoutStyling)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.customFields = try container.decode([PlanCustomField].self, forKey: .customFields)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.expirationDays = try container.decode(Nullable<Double>.self, forKey: .expirationDays)
        self.formattedPrice = try container.decode(String.self, forKey: .formattedPrice)
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .image)
        self.initialPrice = try container.decode(Double.self, forKey: .initialPrice)
        self.initialPriceDue = try container.decode(Money.self, forKey: .initialPriceDue)
        self.internalNotes = try container.decode(Nullable<String>.self, forKey: .internalNotes)
        self.invoice = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .invoice)
        self.memberCount = try container.decode(Nullable<Double>.self, forKey: .memberCount)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.offerCancelDiscount = try container.decode(Nullable<Bool>.self, forKey: .offerCancelDiscount)
        self.paymentMethodConfiguration = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .paymentMethodConfiguration)
        self.product = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .product)
        self.purchaseUrl = try container.decode(String.self, forKey: .purchaseUrl)
        self.releaseMethod = try container.decode(PlanListItemReleaseMethod.self, forKey: .releaseMethod)
        self.renewalPrice = try container.decode(Double.self, forKey: .renewalPrice)
        self.sku = try container.decode(Nullable<String>.self, forKey: .sku)
        self.splitPayRequiredPayments = try container.decode(Nullable<Double>.self, forKey: .splitPayRequiredPayments)
        self.stock = try container.decode(Nullable<Double>.self, forKey: .stock)
        self.strikeThroughInitialPrice = try container.decode(Nullable<Double>.self, forKey: .strikeThroughInitialPrice)
        self.strikeThroughRenewalPrice = try container.decode(Nullable<Double>.self, forKey: .strikeThroughRenewalPrice)
        self.threeDsLevel = try container.decode(Nullable<PlanListItemThreeDsLevel>.self, forKey: .threeDsLevel)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.trialPeriodDays = try container.decode(Nullable<Double>.self, forKey: .trialPeriodDays)
        self.unlimitedStock = try container.decode(Bool.self, forKey: .unlimitedStock)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.visibility = try container.decode(PlanListItemVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
        try container.encode(self.allowMultipleQuantity, forKey: .allowMultipleQuantity)
        try container.encode(self.attributes, forKey: .attributes)
        try container.encode(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.billingType, forKey: .billingType)
        try container.encode(self.cancelDiscountIntervals, forKey: .cancelDiscountIntervals)
        try container.encode(self.cancelDiscountPercentage, forKey: .cancelDiscountPercentage)
        try container.encode(self.checkoutStyling, forKey: .checkoutStyling)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customFields, forKey: .customFields)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.expirationDays, forKey: .expirationDays)
        try container.encode(self.formattedPrice, forKey: .formattedPrice)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.initialPriceDue, forKey: .initialPriceDue)
        try container.encode(self.internalNotes, forKey: .internalNotes)
        try container.encode(self.invoice, forKey: .invoice)
        try container.encode(self.memberCount, forKey: .memberCount)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.offerCancelDiscount, forKey: .offerCancelDiscount)
        try container.encode(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.purchaseUrl, forKey: .purchaseUrl)
        try container.encode(self.releaseMethod, forKey: .releaseMethod)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.sku, forKey: .sku)
        try container.encode(self.splitPayRequiredPayments, forKey: .splitPayRequiredPayments)
        try container.encode(self.stock, forKey: .stock)
        try container.encode(self.strikeThroughInitialPrice, forKey: .strikeThroughInitialPrice)
        try container.encode(self.strikeThroughRenewalPrice, forKey: .strikeThroughRenewalPrice)
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
        case allowMultipleQuantity = "allow_multiple_quantity"
        case attributes
        case billingPeriod = "billing_period"
        case billingType = "billing_type"
        case cancelDiscountIntervals = "cancel_discount_intervals"
        case cancelDiscountPercentage = "cancel_discount_percentage"
        case checkoutStyling = "checkout_styling"
        case createdAt = "created_at"
        case currency
        case customFields = "custom_fields"
        case description
        case expirationDays = "expiration_days"
        case formattedPrice = "formatted_price"
        case id
        case image
        case initialPrice = "initial_price"
        case initialPriceDue = "initial_price_due"
        case internalNotes = "internal_notes"
        case invoice
        case memberCount = "member_count"
        case metadata
        case offerCancelDiscount = "offer_cancel_discount"
        case paymentMethodConfiguration = "payment_method_configuration"
        case product
        case purchaseUrl = "purchase_url"
        case releaseMethod = "release_method"
        case renewalPrice = "renewal_price"
        case sku
        case splitPayRequiredPayments = "split_pay_required_payments"
        case stock
        case strikeThroughInitialPrice = "strike_through_initial_price"
        case strikeThroughRenewalPrice = "strike_through_renewal_price"
        case threeDsLevel = "three_ds_level"
        case title
        case trialPeriodDays = "trial_period_days"
        case unlimitedStock = "unlimited_stock"
        case updatedAt = "updated_at"
        case visibility
    }
}
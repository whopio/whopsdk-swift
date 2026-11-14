import Foundation

/// Find or create a variant inline by its attributes, using the payment API properties. Requires plan:create.
public struct UpdateInvoicesRequestItemsItemVariant: Codable, Hashable, Sendable {
    /// Whether more than one unit can be purchased in an order. Renewal variants cannot enable it. When `false`, checkouts, carts, and invoices reject a quantity above 1.
    public let allowMultipleQuantity: Nullable<Bool>?
    /// Application fee the platform collects per unit, in the variant currency (5.00 means $5.00 for USD). Must be positive and below the initial price for one-time variants or renewal price for recurring variants. Paid to the parent account alongside other processing fees; collection is capped to remaining proceeds. Applies to subsequent payments on recurring variants. Only valid for subaccounts with a parent account.
    public let applicationFeeAmount: Nullable<Double>?
    /// A recurring variant's billing period in days, from 2 to 365, such as `45`.
    public let billingPeriod: Nullable<Int>?
    /// Billing model for the variant.
    public let billingType: Nullable<UpdateInvoicesRequestItemsItemVariantBillingType>?
    /// Currency code for the variant prices.
    public let currency: UpdateInvoicesRequestItemsItemVariantCurrency
    /// Variant description.
    public let description: Nullable<String>?
    /// Days until access expires.
    public let expirationDays: Nullable<Int>?
    /// Create a new variant instead of reusing a matching variant.
    public let forceCreateNewPlan: Nullable<Bool>?
    /// Additional amount charged on the first purchase, in the variant currency. For recurring variants without a trial, the first charge includes this amount plus renewal_price.
    public let initialPrice: Nullable<Double>?
    /// Internal notes for the account.
    public let internalNotes: Nullable<String>?
    /// Whether the variant's price includes tax: `inclusive` (tax is included in the price), `exclusive` (tax is added on top), or `unspecified`. Omit it or pass `null` to use the account's tax setting. On an account enrolled in the Whop tax service, `inclusive` or `exclusive` replaces the account's setting and `unspecified` keeps it. Otherwise it applies only where the account is the merchant of record: `inclusive` or `exclusive` replaces the account's setting when the account collects tax, and `unspecified` means the variant collects no tax. Where Whop is the merchant of record, the account's setting applies. Variants that differ only in this value are different variants.
    public let overrideTaxType: Nullable<UpdateInvoicesRequestItemsItemVariantOverrideTaxType>?
    /// Find or create a product by external identifier. Mutually exclusive with product_id.
    public let product: Nullable<UpdateInvoicesRequestItemsItemVariantProduct>?
    /// Existing product ID belonging to the account, prefixed `prod_`. Mutually exclusive with `product`.
    public let productId: Nullable<String>?
    /// Recurring price in the variant currency.
    public let renewalPrice: Nullable<Double>?
    /// How many payments a recurring variant collects before it stops billing, from 2 to 115. Only valid for `renewal` variants. `null` bills until the subscription is canceled.
    public let splitPayRequiredPayments: Nullable<Int>?
    /// Variant title.
    public let title: Nullable<String>?
    /// Free trial days before renewal.
    public let trialPeriodDays: Nullable<Int>?
    /// Whether the variant is visible to customers.
    public let visibility: Nullable<UpdateInvoicesRequestItemsItemVariantVisibility>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        allowMultipleQuantity: Nullable<Bool>? = nil,
        applicationFeeAmount: Nullable<Double>? = nil,
        billingPeriod: Nullable<Int>? = nil,
        billingType: Nullable<UpdateInvoicesRequestItemsItemVariantBillingType>? = nil,
        currency: UpdateInvoicesRequestItemsItemVariantCurrency,
        description: Nullable<String>? = nil,
        expirationDays: Nullable<Int>? = nil,
        forceCreateNewPlan: Nullable<Bool>? = nil,
        initialPrice: Nullable<Double>? = nil,
        internalNotes: Nullable<String>? = nil,
        overrideTaxType: Nullable<UpdateInvoicesRequestItemsItemVariantOverrideTaxType>? = nil,
        product: Nullable<UpdateInvoicesRequestItemsItemVariantProduct>? = nil,
        productId: Nullable<String>? = nil,
        renewalPrice: Nullable<Double>? = nil,
        splitPayRequiredPayments: Nullable<Int>? = nil,
        title: Nullable<String>? = nil,
        trialPeriodDays: Nullable<Int>? = nil,
        visibility: Nullable<UpdateInvoicesRequestItemsItemVariantVisibility>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.allowMultipleQuantity = allowMultipleQuantity
        self.applicationFeeAmount = applicationFeeAmount
        self.billingPeriod = billingPeriod
        self.billingType = billingType
        self.currency = currency
        self.description = description
        self.expirationDays = expirationDays
        self.forceCreateNewPlan = forceCreateNewPlan
        self.initialPrice = initialPrice
        self.internalNotes = internalNotes
        self.overrideTaxType = overrideTaxType
        self.product = product
        self.productId = productId
        self.renewalPrice = renewalPrice
        self.splitPayRequiredPayments = splitPayRequiredPayments
        self.title = title
        self.trialPeriodDays = trialPeriodDays
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.allowMultipleQuantity = try container.decodeNullableIfPresent(Bool.self, forKey: .allowMultipleQuantity)
        self.applicationFeeAmount = try container.decodeNullableIfPresent(Double.self, forKey: .applicationFeeAmount)
        self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
        self.billingType = try container.decodeNullableIfPresent(UpdateInvoicesRequestItemsItemVariantBillingType.self, forKey: .billingType)
        self.currency = try container.decode(UpdateInvoicesRequestItemsItemVariantCurrency.self, forKey: .currency)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.expirationDays = try container.decodeNullableIfPresent(Int.self, forKey: .expirationDays)
        self.forceCreateNewPlan = try container.decodeNullableIfPresent(Bool.self, forKey: .forceCreateNewPlan)
        self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
        self.internalNotes = try container.decodeNullableIfPresent(String.self, forKey: .internalNotes)
        self.overrideTaxType = try container.decodeNullableIfPresent(UpdateInvoicesRequestItemsItemVariantOverrideTaxType.self, forKey: .overrideTaxType)
        self.product = try container.decodeNullableIfPresent(UpdateInvoicesRequestItemsItemVariantProduct.self, forKey: .product)
        self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
        self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
        self.splitPayRequiredPayments = try container.decodeNullableIfPresent(Int.self, forKey: .splitPayRequiredPayments)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.trialPeriodDays = try container.decodeNullableIfPresent(Int.self, forKey: .trialPeriodDays)
        self.visibility = try container.decodeNullableIfPresent(UpdateInvoicesRequestItemsItemVariantVisibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.allowMultipleQuantity, forKey: .allowMultipleQuantity)
        try container.encodeNullableIfPresent(self.applicationFeeAmount, forKey: .applicationFeeAmount)
        try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
        try container.encodeNullableIfPresent(self.billingType, forKey: .billingType)
        try container.encode(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.expirationDays, forKey: .expirationDays)
        try container.encodeNullableIfPresent(self.forceCreateNewPlan, forKey: .forceCreateNewPlan)
        try container.encodeNullableIfPresent(self.initialPrice, forKey: .initialPrice)
        try container.encodeNullableIfPresent(self.internalNotes, forKey: .internalNotes)
        try container.encodeNullableIfPresent(self.overrideTaxType, forKey: .overrideTaxType)
        try container.encodeNullableIfPresent(self.product, forKey: .product)
        try container.encodeNullableIfPresent(self.productId, forKey: .productId)
        try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
        try container.encodeNullableIfPresent(self.splitPayRequiredPayments, forKey: .splitPayRequiredPayments)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
        try container.encodeNullableIfPresent(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case allowMultipleQuantity = "allow_multiple_quantity"
        case applicationFeeAmount = "application_fee_amount"
        case billingPeriod = "billing_period"
        case billingType = "billing_type"
        case currency
        case description
        case expirationDays = "expiration_days"
        case forceCreateNewPlan = "force_create_new_plan"
        case initialPrice = "initial_price"
        case internalNotes = "internal_notes"
        case overrideTaxType = "override_tax_type"
        case product
        case productId = "product_id"
        case renewalPrice = "renewal_price"
        case splitPayRequiredPayments = "split_pay_required_payments"
        case title
        case trialPeriodDays = "trial_period_days"
        case visibility
    }
}
import Foundation

extension Requests {
    public struct UpdatePlansRequest: Codable, Hashable, Sendable {
        /// Whether this plan accepts local currency payments via adaptive pricing.
        public let adaptivePricingEnabled: Nullable<Bool>?
        /// Recurring billing interval in days, such as 30 for monthly or 365 for annual.
        public let billingPeriod: Nullable<Int>?
        /// How many renewals the retention discount applies to. Required when `offer_cancel_discount` is true.
        public let cancelDiscountIntervals: Nullable<Int>?
        /// Percentage taken off each discounted renewal. Required when `offer_cancel_discount` is true.
        public let cancelDiscountPercentage: Nullable<Int>?
        /// Checkout styling overrides for this plan.
        public let checkoutStyling: Nullable<[String: JSONValue]>?
        /// The three-letter ISO currency code for the plan's pricing. Defaults to USD.
        public let currency: String?
        /// An array of custom field definitions to collect from customers at checkout. Omitting this field clears existing custom fields.
        public let customFields: Nullable<[UpdatePlansRequestCustomFieldsItem]>?
        /// A text description of the plan displayed to customers on the product page.
        public let description: Nullable<String>?
        /// Access duration in days before the membership expires.
        public let expirationDays: Nullable<Int>?
        /// An image displayed on the product page to represent this plan.
        public let image: Nullable<UpdatePlansRequestImage>?
        /// Initial amount charged in the plan's currency, e.g. 10.43 for $10.43.
        public let initialPrice: Nullable<Double>?
        /// Private notes visible only to the account owner. Not shown to customers.
        public let internalNotes: Nullable<String>?
        /// Custom key-value pairs to store on the plan. Included in webhook payloads for payment and membership events. Max 50 keys, 100 chars per key, 500 chars per string value. The reserved keys `custom_cta` (a checkout call-to-action button label — one of the product custom CTA values, e.g. `subscribe`, `get_offer`) and `custom_cta_url` (a URL the button links to; web or `tel:`) override the product's call to action for this plan and are validated on save.
        public let metadata: Nullable<[String: JSONValue]>?
        /// Whether to offer a retention discount when a customer attempts to cancel.
        public let offerCancelDiscount: Nullable<Bool>?
        /// Override the default tax classification for this specific plan.
        public let overrideTaxType: String?
        /// Explicit payment method configuration for the plan. When not provided, the account's defaults apply.
        public let paymentMethodConfiguration: Nullable<UpdatePlansRequestPaymentMethodConfiguration>?
        /// Sales method for this plan.
        public let releaseMethod: String?
        /// The amount charged each billing period for recurring plans, in the plan's currency.
        public let renewalPrice: Nullable<Double>?
        /// The maximum number of units available for purchase. Ignored when unlimited_stock is true.
        public let stock: Nullable<Int>?
        /// A comparison price displayed with a strikethrough for the initial price.
        public let strikeThroughInitialPrice: Nullable<Double>?
        /// A comparison price displayed with a strikethrough for the renewal price.
        public let strikeThroughRenewalPrice: Nullable<Double>?
        /// 3D Secure behavior for this plan. Send `null` to inherit the account default.
        public let threeDsLevel: Nullable<UpdatePlansRequestThreeDsLevel>?
        /// The display name of the plan shown to customers on the product page.
        public let title: Nullable<String>?
        /// Free trial duration before the first recurring charge.
        public let trialPeriodDays: Nullable<Int>?
        /// Whether the plan has unlimited stock. When true, the stock field is ignored.
        public let unlimitedStock: Nullable<Bool>?
        /// Whether the plan is visible to customers or hidden from public view.
        public let visibility: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adaptivePricingEnabled: Nullable<Bool>? = nil,
            billingPeriod: Nullable<Int>? = nil,
            cancelDiscountIntervals: Nullable<Int>? = nil,
            cancelDiscountPercentage: Nullable<Int>? = nil,
            checkoutStyling: Nullable<[String: JSONValue]>? = nil,
            currency: String? = nil,
            customFields: Nullable<[UpdatePlansRequestCustomFieldsItem]>? = nil,
            description: Nullable<String>? = nil,
            expirationDays: Nullable<Int>? = nil,
            image: Nullable<UpdatePlansRequestImage>? = nil,
            initialPrice: Nullable<Double>? = nil,
            internalNotes: Nullable<String>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            offerCancelDiscount: Nullable<Bool>? = nil,
            overrideTaxType: String? = nil,
            paymentMethodConfiguration: Nullable<UpdatePlansRequestPaymentMethodConfiguration>? = nil,
            releaseMethod: String? = nil,
            renewalPrice: Nullable<Double>? = nil,
            stock: Nullable<Int>? = nil,
            strikeThroughInitialPrice: Nullable<Double>? = nil,
            strikeThroughRenewalPrice: Nullable<Double>? = nil,
            threeDsLevel: Nullable<UpdatePlansRequestThreeDsLevel>? = nil,
            title: Nullable<String>? = nil,
            trialPeriodDays: Nullable<Int>? = nil,
            unlimitedStock: Nullable<Bool>? = nil,
            visibility: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.adaptivePricingEnabled = adaptivePricingEnabled
            self.billingPeriod = billingPeriod
            self.cancelDiscountIntervals = cancelDiscountIntervals
            self.cancelDiscountPercentage = cancelDiscountPercentage
            self.checkoutStyling = checkoutStyling
            self.currency = currency
            self.customFields = customFields
            self.description = description
            self.expirationDays = expirationDays
            self.image = image
            self.initialPrice = initialPrice
            self.internalNotes = internalNotes
            self.metadata = metadata
            self.offerCancelDiscount = offerCancelDiscount
            self.overrideTaxType = overrideTaxType
            self.paymentMethodConfiguration = paymentMethodConfiguration
            self.releaseMethod = releaseMethod
            self.renewalPrice = renewalPrice
            self.stock = stock
            self.strikeThroughInitialPrice = strikeThroughInitialPrice
            self.strikeThroughRenewalPrice = strikeThroughRenewalPrice
            self.threeDsLevel = threeDsLevel
            self.title = title
            self.trialPeriodDays = trialPeriodDays
            self.unlimitedStock = unlimitedStock
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.adaptivePricingEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .adaptivePricingEnabled)
            self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
            self.cancelDiscountIntervals = try container.decodeNullableIfPresent(Int.self, forKey: .cancelDiscountIntervals)
            self.cancelDiscountPercentage = try container.decodeNullableIfPresent(Int.self, forKey: .cancelDiscountPercentage)
            self.checkoutStyling = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .checkoutStyling)
            self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
            self.customFields = try container.decodeNullableIfPresent([UpdatePlansRequestCustomFieldsItem].self, forKey: .customFields)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.expirationDays = try container.decodeNullableIfPresent(Int.self, forKey: .expirationDays)
            self.image = try container.decodeNullableIfPresent(UpdatePlansRequestImage.self, forKey: .image)
            self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
            self.internalNotes = try container.decodeNullableIfPresent(String.self, forKey: .internalNotes)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.offerCancelDiscount = try container.decodeNullableIfPresent(Bool.self, forKey: .offerCancelDiscount)
            self.overrideTaxType = try container.decodeIfPresent(String.self, forKey: .overrideTaxType)
            self.paymentMethodConfiguration = try container.decodeNullableIfPresent(UpdatePlansRequestPaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
            self.releaseMethod = try container.decodeIfPresent(String.self, forKey: .releaseMethod)
            self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
            self.stock = try container.decodeNullableIfPresent(Int.self, forKey: .stock)
            self.strikeThroughInitialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .strikeThroughInitialPrice)
            self.strikeThroughRenewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .strikeThroughRenewalPrice)
            self.threeDsLevel = try container.decodeNullableIfPresent(UpdatePlansRequestThreeDsLevel.self, forKey: .threeDsLevel)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.trialPeriodDays = try container.decodeNullableIfPresent(Int.self, forKey: .trialPeriodDays)
            self.unlimitedStock = try container.decodeNullableIfPresent(Bool.self, forKey: .unlimitedStock)
            self.visibility = try container.decodeIfPresent(String.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
            try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
            try container.encodeNullableIfPresent(self.cancelDiscountIntervals, forKey: .cancelDiscountIntervals)
            try container.encodeNullableIfPresent(self.cancelDiscountPercentage, forKey: .cancelDiscountPercentage)
            try container.encodeNullableIfPresent(self.checkoutStyling, forKey: .checkoutStyling)
            try container.encodeIfPresent(self.currency, forKey: .currency)
            try container.encodeNullableIfPresent(self.customFields, forKey: .customFields)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.expirationDays, forKey: .expirationDays)
            try container.encodeNullableIfPresent(self.image, forKey: .image)
            try container.encodeNullableIfPresent(self.initialPrice, forKey: .initialPrice)
            try container.encodeNullableIfPresent(self.internalNotes, forKey: .internalNotes)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.offerCancelDiscount, forKey: .offerCancelDiscount)
            try container.encodeIfPresent(self.overrideTaxType, forKey: .overrideTaxType)
            try container.encodeNullableIfPresent(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
            try container.encodeIfPresent(self.releaseMethod, forKey: .releaseMethod)
            try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
            try container.encodeNullableIfPresent(self.stock, forKey: .stock)
            try container.encodeNullableIfPresent(self.strikeThroughInitialPrice, forKey: .strikeThroughInitialPrice)
            try container.encodeNullableIfPresent(self.strikeThroughRenewalPrice, forKey: .strikeThroughRenewalPrice)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.trialPeriodDays, forKey: .trialPeriodDays)
            try container.encodeNullableIfPresent(self.unlimitedStock, forKey: .unlimitedStock)
            try container.encodeIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case adaptivePricingEnabled = "adaptive_pricing_enabled"
            case billingPeriod = "billing_period"
            case cancelDiscountIntervals = "cancel_discount_intervals"
            case cancelDiscountPercentage = "cancel_discount_percentage"
            case checkoutStyling = "checkout_styling"
            case currency
            case customFields = "custom_fields"
            case description
            case expirationDays = "expiration_days"
            case image
            case initialPrice = "initial_price"
            case internalNotes = "internal_notes"
            case metadata
            case offerCancelDiscount = "offer_cancel_discount"
            case overrideTaxType = "override_tax_type"
            case paymentMethodConfiguration = "payment_method_configuration"
            case releaseMethod = "release_method"
            case renewalPrice = "renewal_price"
            case stock
            case strikeThroughInitialPrice = "strike_through_initial_price"
            case strikeThroughRenewalPrice = "strike_through_renewal_price"
            case threeDsLevel = "three_ds_level"
            case title
            case trialPeriodDays = "trial_period_days"
            case unlimitedStock = "unlimited_stock"
            case visibility
        }
    }
}
import Foundation

extension Requests {
    public struct CreateVariantsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the account to create this variant for. Required when authenticating as a user; an account API key supplies its own account.
        public let accountId: String?
        /// Whether this variant accepts local currency payments via adaptive pricing.
        public let adaptivePricingEnabled: Nullable<Bool>?
        /// Whether more than one unit can be purchased in an order. Renewal variants cannot enable it. When `false`, checkouts, carts, and invoices reject a quantity above 1.
        public let allowMultipleQuantity: Bool?
        /// Attribute values that make this variant one variant of its product, as a map of attribute name to value, e.g. `{"size": "Large", "color": "Blue"}`. Names are normalized to snake_case identifiers (`Ring Size` becomes `ring_size`) and come back in alphabetical order. Every variant on a product must carry the same attribute names and a distinct set of values. Send `null` to make the variant an ordinary pricing option again.
        public let attributes: Nullable<[String: JSONValue]>?
        /// Recurring billing interval in days, such as 30 for monthly or 365 for annual.
        public let billingPeriod: Nullable<Int>?
        /// Variant billing type, such as `one_time` or `renewal`.
        public let billingType: String?
        /// How long the retention discount lasts: `0` forever, `1` the next payment only, or a number of calendar months from when the customer accepts it. Required when `offer_cancel_discount` is true.
        public let cancelDiscountIntervals: Nullable<Int>?
        /// Percentage taken off each discounted renewal, as a whole number from 1 to 100. Required when `offer_cancel_discount` is true.
        public let cancelDiscountPercentage: Nullable<Int>?
        /// Checkout styling overrides for this variant.
        public let checkoutStyling: Nullable<[String: JSONValue]>?
        /// The three-letter ISO currency code for the variant's pricing. Defaults to USD.
        public let currency: String?
        /// An array of custom field definitions to collect from customers at checkout. Omitting this field clears existing custom fields.
        public let customFields: Nullable<[CreateVariantsRequestCustomFieldsItem]>?
        /// A text description of the variant displayed to customers on the product page.
        public let description: Nullable<String>?
        /// Access duration in days before the membership expires.
        public let expirationDays: Nullable<Int>?
        /// An image displayed on the product page to represent this variant.
        public let image: Nullable<CreateVariantsRequestImage>?
        /// Initial amount charged in the variant's currency, e.g. 10.43 for $10.43. A paid fiat variant charges at least 1.00 in its currency; use 0 for free.
        public let initialPrice: Nullable<Double>?
        /// Private notes visible only to the account owner. Not shown to customers.
        public let internalNotes: Nullable<String>?
        /// Custom key-value pairs to store on the variant. Included in webhook payloads for payment and membership events. Max 50 keys, 100 chars per key, 500 chars per string value. The reserved keys `custom_cta` (a checkout call-to-action button label — one of the product custom CTA values, e.g. `subscribe`, `get_offer`) and `custom_cta_url` (a URL the button links to; web or `tel:`) override the product's call to action for this variant and are validated on save.
        public let metadata: Nullable<[String: JSONValue]>?
        /// Whether to offer a retention discount when a customer attempts to cancel.
        public let offerCancelDiscount: Nullable<Bool>?
        /// Override the default tax classification for this specific variant.
        public let overrideTaxType: String?
        /// Explicit payment method configuration for the variant. When not provided, the account's defaults apply. Send at least one of `enabled` or `disabled`; an omitted one is empty.
        public let paymentMethodConfiguration: Nullable<CreateVariantsRequestPaymentMethodConfiguration>?
        /// The unique identifier of the product to attach this variant to.
        public let productId: String?
        /// Sales method for this variant.
        public let releaseMethod: String?
        /// The amount charged each billing period for recurring variants, in the variant's currency. A paid fiat variant charges at least 1.00 in its currency.
        public let renewalPrice: Nullable<Double>?
        /// Stock keeping unit for this variant. Maximum 100 characters. Free text, not enforced unique.
        public let sku: Nullable<String>?
        /// Installment payments required before the subscription pauses, from 2 to 115. Only valid on `renewal` variants.
        public let splitPayRequiredPayments: Nullable<Int>?
        /// The maximum number of units available for purchase. Ignored when unlimited_stock is true.
        public let stock: Nullable<Int>?
        /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. Send `null` to inherit the account default.
        public let threeDsLevel: Nullable<CreateVariantsRequestThreeDsLevel>?
        /// The display name of the variant shown to customers on the product page. Maximum 30 characters.
        public let title: Nullable<String>?
        /// Free trial duration before the first recurring charge.
        public let trialPeriodDays: Nullable<Int>?
        /// Whether the variant has unlimited stock. When true, the stock field is ignored.
        public let unlimitedStock: Nullable<Bool>?
        /// Whether the variant is visible to customers or hidden from public view.
        public let visibility: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            adaptivePricingEnabled: Nullable<Bool>? = nil,
            allowMultipleQuantity: Bool? = nil,
            attributes: Nullable<[String: JSONValue]>? = nil,
            billingPeriod: Nullable<Int>? = nil,
            billingType: String? = nil,
            cancelDiscountIntervals: Nullable<Int>? = nil,
            cancelDiscountPercentage: Nullable<Int>? = nil,
            checkoutStyling: Nullable<[String: JSONValue]>? = nil,
            currency: String? = nil,
            customFields: Nullable<[CreateVariantsRequestCustomFieldsItem]>? = nil,
            description: Nullable<String>? = nil,
            expirationDays: Nullable<Int>? = nil,
            image: Nullable<CreateVariantsRequestImage>? = nil,
            initialPrice: Nullable<Double>? = nil,
            internalNotes: Nullable<String>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            offerCancelDiscount: Nullable<Bool>? = nil,
            overrideTaxType: String? = nil,
            paymentMethodConfiguration: Nullable<CreateVariantsRequestPaymentMethodConfiguration>? = nil,
            productId: String? = nil,
            releaseMethod: String? = nil,
            renewalPrice: Nullable<Double>? = nil,
            sku: Nullable<String>? = nil,
            splitPayRequiredPayments: Nullable<Int>? = nil,
            stock: Nullable<Int>? = nil,
            threeDsLevel: Nullable<CreateVariantsRequestThreeDsLevel>? = nil,
            title: Nullable<String>? = nil,
            trialPeriodDays: Nullable<Int>? = nil,
            unlimitedStock: Nullable<Bool>? = nil,
            visibility: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.adaptivePricingEnabled = adaptivePricingEnabled
            self.allowMultipleQuantity = allowMultipleQuantity
            self.attributes = attributes
            self.billingPeriod = billingPeriod
            self.billingType = billingType
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
            self.productId = productId
            self.releaseMethod = releaseMethod
            self.renewalPrice = renewalPrice
            self.sku = sku
            self.splitPayRequiredPayments = splitPayRequiredPayments
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
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.adaptivePricingEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .adaptivePricingEnabled)
            self.allowMultipleQuantity = try container.decodeIfPresent(Bool.self, forKey: .allowMultipleQuantity)
            self.attributes = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .attributes)
            self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
            self.billingType = try container.decodeIfPresent(String.self, forKey: .billingType)
            self.cancelDiscountIntervals = try container.decodeNullableIfPresent(Int.self, forKey: .cancelDiscountIntervals)
            self.cancelDiscountPercentage = try container.decodeNullableIfPresent(Int.self, forKey: .cancelDiscountPercentage)
            self.checkoutStyling = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .checkoutStyling)
            self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
            self.customFields = try container.decodeNullableIfPresent([CreateVariantsRequestCustomFieldsItem].self, forKey: .customFields)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.expirationDays = try container.decodeNullableIfPresent(Int.self, forKey: .expirationDays)
            self.image = try container.decodeNullableIfPresent(CreateVariantsRequestImage.self, forKey: .image)
            self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
            self.internalNotes = try container.decodeNullableIfPresent(String.self, forKey: .internalNotes)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.offerCancelDiscount = try container.decodeNullableIfPresent(Bool.self, forKey: .offerCancelDiscount)
            self.overrideTaxType = try container.decodeIfPresent(String.self, forKey: .overrideTaxType)
            self.paymentMethodConfiguration = try container.decodeNullableIfPresent(CreateVariantsRequestPaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
            self.productId = try container.decodeIfPresent(String.self, forKey: .productId)
            self.releaseMethod = try container.decodeIfPresent(String.self, forKey: .releaseMethod)
            self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
            self.sku = try container.decodeNullableIfPresent(String.self, forKey: .sku)
            self.splitPayRequiredPayments = try container.decodeNullableIfPresent(Int.self, forKey: .splitPayRequiredPayments)
            self.stock = try container.decodeNullableIfPresent(Int.self, forKey: .stock)
            self.threeDsLevel = try container.decodeNullableIfPresent(CreateVariantsRequestThreeDsLevel.self, forKey: .threeDsLevel)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.trialPeriodDays = try container.decodeNullableIfPresent(Int.self, forKey: .trialPeriodDays)
            self.unlimitedStock = try container.decodeNullableIfPresent(Bool.self, forKey: .unlimitedStock)
            self.visibility = try container.decodeIfPresent(String.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.adaptivePricingEnabled, forKey: .adaptivePricingEnabled)
            try container.encodeIfPresent(self.allowMultipleQuantity, forKey: .allowMultipleQuantity)
            try container.encodeNullableIfPresent(self.attributes, forKey: .attributes)
            try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
            try container.encodeIfPresent(self.billingType, forKey: .billingType)
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
            try container.encodeIfPresent(self.productId, forKey: .productId)
            try container.encodeIfPresent(self.releaseMethod, forKey: .releaseMethod)
            try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
            try container.encodeNullableIfPresent(self.sku, forKey: .sku)
            try container.encodeNullableIfPresent(self.splitPayRequiredPayments, forKey: .splitPayRequiredPayments)
            try container.encodeNullableIfPresent(self.stock, forKey: .stock)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.trialPeriodDays, forKey: .trialPeriodDays)
            try container.encodeNullableIfPresent(self.unlimitedStock, forKey: .unlimitedStock)
            try container.encodeIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case adaptivePricingEnabled = "adaptive_pricing_enabled"
            case allowMultipleQuantity = "allow_multiple_quantity"
            case attributes
            case billingPeriod = "billing_period"
            case billingType = "billing_type"
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
            case productId = "product_id"
            case releaseMethod = "release_method"
            case renewalPrice = "renewal_price"
            case sku
            case splitPayRequiredPayments = "split_pay_required_payments"
            case stock
            case threeDsLevel = "three_ds_level"
            case title
            case trialPeriodDays = "trial_period_days"
            case unlimitedStock = "unlimited_stock"
            case visibility
        }
    }
}
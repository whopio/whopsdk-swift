import Foundation

extension Requests {
    public struct UpdatePlansRequest: Codable, Hashable, Sendable {
        public let adaptivePricingEnabled: Nullable<Bool>?
        public let allowMultipleQuantity: Bool?
        public let attributes: Nullable<[String: JSONValue]>?
        public let billingPeriod: Nullable<Int>?
        public let cancelDiscountIntervals: Nullable<Int>?
        public let cancelDiscountPercentage: Nullable<Int>?
        public let checkoutStyling: Nullable<[String: JSONValue]>?
        public let currency: String?
        public let customFields: Nullable<[UpdatePlansRequestCustomFieldsItem]>?
        public let description: Nullable<String>?
        public let expirationDays: Nullable<Int>?
        public let image: Nullable<UpdatePlansRequestImage>?
        public let initialPrice: Nullable<Double>?
        public let internalNotes: Nullable<String>?
        public let metadata: Nullable<[String: JSONValue]>?
        public let offerCancelDiscount: Nullable<Bool>?
        public let overrideTaxType: String?
        public let paymentMethodConfiguration: Nullable<UpdatePlansRequestPaymentMethodConfiguration>?
        public let releaseMethod: String?
        public let renewalPrice: Nullable<Double>?
        public let sku: Nullable<String>?
        public let splitPayRequiredPayments: Nullable<Int>?
        public let stock: Nullable<Int>?
        public let strikeThroughInitialPrice: Nullable<Double>?
        public let strikeThroughRenewalPrice: Nullable<Double>?
        public let threeDsLevel: Nullable<UpdatePlansRequestThreeDsLevel>?
        public let title: Nullable<String>?
        public let trialPeriodDays: Nullable<Int>?
        public let unlimitedStock: Nullable<Bool>?
        public let visibility: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adaptivePricingEnabled: Nullable<Bool>? = nil,
            allowMultipleQuantity: Bool? = nil,
            attributes: Nullable<[String: JSONValue]>? = nil,
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
            sku: Nullable<String>? = nil,
            splitPayRequiredPayments: Nullable<Int>? = nil,
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
            self.allowMultipleQuantity = allowMultipleQuantity
            self.attributes = attributes
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
            self.sku = sku
            self.splitPayRequiredPayments = splitPayRequiredPayments
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
            self.allowMultipleQuantity = try container.decodeIfPresent(Bool.self, forKey: .allowMultipleQuantity)
            self.attributes = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .attributes)
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
            self.sku = try container.decodeNullableIfPresent(String.self, forKey: .sku)
            self.splitPayRequiredPayments = try container.decodeNullableIfPresent(Int.self, forKey: .splitPayRequiredPayments)
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
            try container.encodeIfPresent(self.allowMultipleQuantity, forKey: .allowMultipleQuantity)
            try container.encodeNullableIfPresent(self.attributes, forKey: .attributes)
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
            try container.encodeNullableIfPresent(self.sku, forKey: .sku)
            try container.encodeNullableIfPresent(self.splitPayRequiredPayments, forKey: .splitPayRequiredPayments)
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
            case allowMultipleQuantity = "allow_multiple_quantity"
            case attributes
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
            case sku
            case splitPayRequiredPayments = "split_pay_required_payments"
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
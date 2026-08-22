import Foundation

/// Pass this object to create a new plan for this payment
public struct CreatePaymentsRequestOnePlan: Codable, Hashable, Sendable {
    /// The application fee amount collected by the platform from this connected account. Provided as a number in dollars (e.g., 5.00 for $5.00). Must be less than the total payment amount. Only valid for connected accounts with a parent company.
    public let applicationFeeAmount: Nullable<Double>?
    /// The interval in days at which the plan charges (renewal plans). For example, 30 for monthly billing.
    public let billingPeriod: Nullable<Int>?
    /// The respective currency identifier for the plan.
    public let currency: Currencies
    /// The description of the plan.
    public let description: Nullable<String>?
    /// The number of days until the membership expires and revokes access (expiration plans). For example, 365 for one year.
    public let expirationDays: Nullable<Int>?
    /// Whether to force the creation of a new plan even if one with the same attributes already exists.
    public let forceCreateNewPlan: Nullable<Bool>?
    /// An additional amount charged upon first purchase. Provided as a number in the specified currency. Eg: 10.43 for $10.43 USD.
    public let initialPrice: Nullable<Double>?
    /// A personal description or notes section for the business.
    public let internalNotes: Nullable<String>?
    /// Indicates if the plan is a one time payment or recurring.
    public let planType: Nullable<PlanTypes>?
    /// Pass this object to create a new product for this plan. We will use the product external identifier to find or create an existing product.
    public let product: Nullable<CreatePaymentsRequestOnePlanProduct>?
    /// The product the plan is related to. Either this or product is required.
    public let productId: Nullable<String>?
    /// The amount the customer is charged every billing period. Provided as a number in the specified currency. Eg: 10.43 for $10.43 USD.
    public let renewalPrice: Nullable<Double>?
    /// The title of the plan. This will be visible on the product page to customers.
    public let title: Nullable<String>?
    /// The number of free trial days added before a renewal plan.
    public let trialPeriodDays: Nullable<Int>?
    /// Shows or hides the plan from public/business view.
    public let visibility: Nullable<Visibility>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        applicationFeeAmount: Nullable<Double>? = nil,
        billingPeriod: Nullable<Int>? = nil,
        currency: Currencies,
        description: Nullable<String>? = nil,
        expirationDays: Nullable<Int>? = nil,
        forceCreateNewPlan: Nullable<Bool>? = nil,
        initialPrice: Nullable<Double>? = nil,
        internalNotes: Nullable<String>? = nil,
        planType: Nullable<PlanTypes>? = nil,
        product: Nullable<CreatePaymentsRequestOnePlanProduct>? = nil,
        productId: Nullable<String>? = nil,
        renewalPrice: Nullable<Double>? = nil,
        title: Nullable<String>? = nil,
        trialPeriodDays: Nullable<Int>? = nil,
        visibility: Nullable<Visibility>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.applicationFeeAmount = applicationFeeAmount
        self.billingPeriod = billingPeriod
        self.currency = currency
        self.description = description
        self.expirationDays = expirationDays
        self.forceCreateNewPlan = forceCreateNewPlan
        self.initialPrice = initialPrice
        self.internalNotes = internalNotes
        self.planType = planType
        self.product = product
        self.productId = productId
        self.renewalPrice = renewalPrice
        self.title = title
        self.trialPeriodDays = trialPeriodDays
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationFeeAmount = try container.decodeNullableIfPresent(Double.self, forKey: .applicationFeeAmount)
        self.billingPeriod = try container.decodeNullableIfPresent(Int.self, forKey: .billingPeriod)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.expirationDays = try container.decodeNullableIfPresent(Int.self, forKey: .expirationDays)
        self.forceCreateNewPlan = try container.decodeNullableIfPresent(Bool.self, forKey: .forceCreateNewPlan)
        self.initialPrice = try container.decodeNullableIfPresent(Double.self, forKey: .initialPrice)
        self.internalNotes = try container.decodeNullableIfPresent(String.self, forKey: .internalNotes)
        self.planType = try container.decodeNullableIfPresent(PlanTypes.self, forKey: .planType)
        self.product = try container.decodeNullableIfPresent(CreatePaymentsRequestOnePlanProduct.self, forKey: .product)
        self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
        self.renewalPrice = try container.decodeNullableIfPresent(Double.self, forKey: .renewalPrice)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.trialPeriodDays = try container.decodeNullableIfPresent(Int.self, forKey: .trialPeriodDays)
        self.visibility = try container.decodeNullableIfPresent(Visibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.applicationFeeAmount, forKey: .applicationFeeAmount)
        try container.encodeNullableIfPresent(self.billingPeriod, forKey: .billingPeriod)
        try container.encode(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.expirationDays, forKey: .expirationDays)
        try container.encodeNullableIfPresent(self.forceCreateNewPlan, forKey: .forceCreateNewPlan)
        try container.encodeNullableIfPresent(self.initialPrice, forKey: .initialPrice)
        try container.encodeNullableIfPresent(self.internalNotes, forKey: .internalNotes)
        try container.encodeNullableIfPresent(self.planType, forKey: .planType)
        try container.encodeNullableIfPresent(self.product, forKey: .product)
        try container.encodeNullableIfPresent(self.productId, forKey: .productId)
        try container.encodeNullableIfPresent(self.renewalPrice, forKey: .renewalPrice)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
        try container.encodeNullableIfPresent(self.trialPeriodDays, forKey: .trialPeriodDays)
        try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case applicationFeeAmount = "application_fee_amount"
        case billingPeriod = "billing_period"
        case currency
        case description
        case expirationDays = "expiration_days"
        case forceCreateNewPlan = "force_create_new_plan"
        case initialPrice = "initial_price"
        case internalNotes = "internal_notes"
        case planType = "plan_type"
        case product
        case productId = "product_id"
        case renewalPrice = "renewal_price"
        case title
        case trialPeriodDays = "trial_period_days"
        case visibility
    }
}
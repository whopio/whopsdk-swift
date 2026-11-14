import Foundation

/// A membership represents an active relationship between a user and a product. It tracks the user's access, billing status, and renewal schedule.
public struct MembershipLegacy: Codable, Hashable, Sendable {
    /// Whether this membership is set to cancel at the end of the current billing cycle. Only applies to memberships with a recurring plan.
    public let cancelAtPeriodEnd: Bool
    /// The category selected for why the member canceled (e.g. too_expensive, switching, missing_features).
    public let cancelOption: Nullable<CancelOptions>
    /// Whether the customer is canceling, left, or was won back. Null if the membership has no cancellation reason or its cancellation state is indeterminate.
    public let cancelationStatus: Nullable<CancelationStatus>
    /// The time the customer initiated cancellation of this membership. As a Unix timestamp. Null if the membership has not been canceled.
    public let canceledAt: Nullable<Date>
    /// Free-text explanation provided by the customer when canceling. Null if the customer did not provide a reason.
    public let cancellationReason: Nullable<String>
    /// The ID of the checkout session/configuration that produced this membership, if any. Use this to map memberships back to the checkout configuration that created them.
    public let checkoutConfigurationId: Nullable<String>
    /// The company this membership belongs to.
    public let company: MembershipLegacyCompany
    /// The datetime the membership was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this membership's billing. Null if the membership is free.
    public let currency: Nullable<Currencies>
    /// The customer's responses to custom checkout questions configured on the product at the time of purchase.
    public let customFieldResponses: [MembershipLegacyCustomFieldResponsesItem]
    /// The member's accounts on outside platforms, such as Discord and Telegram. Empty when the member has none linked. Null in webhooks.
    public let externalAccounts: Nullable<[MembershipLegacyExternalAccountsItem]>
    /// The account's own cancel reason the member picked, as they saw it. `null` when the member picked a default category or gave no reason.
    public let feedbackOption: Nullable<MembershipLegacyFeedbackOption>
    /// The recurring renewal price for this membership, formatted with currency symbol and billing interval. Null if the membership is not recurring.
    public let formattedRenewalPrice: Nullable<String>
    /// The unique identifier for the membership.
    public let id: String
    /// The amount the customer paid when first purchasing this membership, formatted with currency symbol.
    public let initialPricePaid: String
    /// The time the user first joined the company associated with this membership. As a Unix timestamp. Null if the member record does not exist.
    public let joinedAt: Nullable<Date>
    /// The software license key associated with this membership. Only present if the product includes a Whop Software Licensing experience. Null otherwise.
    public let licenseKey: Nullable<String>
    /// The URL where the customer can view and manage this membership, including cancellation and plan changes. Null if no member record exists.
    public let manageUrl: Nullable<String>
    /// The member record linking the user to the company for this membership. Null if the member record has not been created yet.
    public let member: Nullable<MembershipLegacyMember>
    /// Custom key-value pairs for the membership (commonly used for software licensing, e.g., HWID). Max 50 keys, 100 chars per key, 500 chars per string value.
    public let metadata: Nullable<[String: JSONValue]>
    /// Whether recurring payment collection for this membership is temporarily paused by the company.
    public let paymentCollectionPaused: Bool
    /// The plan the customer purchased to create this membership.
    public let plan: MembershipLegacyPlan
    /// The product this membership grants access to.
    public let product: MembershipLegacyProduct
    /// The promotional code currently applied to this membership's billing. Null if no promo code is active.
    public let promoCode: Nullable<MembershipLegacyPromoCode>
    /// The end of the current billing period for this recurring membership. As a Unix timestamp. Null if the membership is not recurring.
    public let renewalPeriodEnd: Nullable<Date>
    /// The start of the current billing period for this recurring membership. As a Unix timestamp. Null if the membership is not recurring.
    public let renewalPeriodStart: Nullable<Date>
    /// The current lifecycle status of the membership (e.g., active, trialing, past_due, canceled, expired, completed).
    public let status: MembershipStatus
    /// The datetime the membership was last updated.
    public let updatedAt: Date
    /// The user who owns this membership. Null if the user account has been deleted.
    public let user: Nullable<MembershipLegacyUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cancelAtPeriodEnd: Bool,
        cancelOption: Nullable<CancelOptions>,
        cancelationStatus: Nullable<CancelationStatus>,
        canceledAt: Nullable<Date>,
        cancellationReason: Nullable<String>,
        checkoutConfigurationId: Nullable<String>,
        company: MembershipLegacyCompany,
        createdAt: Date,
        currency: Nullable<Currencies>,
        customFieldResponses: [MembershipLegacyCustomFieldResponsesItem],
        externalAccounts: Nullable<[MembershipLegacyExternalAccountsItem]>,
        feedbackOption: Nullable<MembershipLegacyFeedbackOption>,
        formattedRenewalPrice: Nullable<String>,
        id: String,
        initialPricePaid: String,
        joinedAt: Nullable<Date>,
        licenseKey: Nullable<String>,
        manageUrl: Nullable<String>,
        member: Nullable<MembershipLegacyMember>,
        metadata: Nullable<[String: JSONValue]>,
        paymentCollectionPaused: Bool,
        plan: MembershipLegacyPlan,
        product: MembershipLegacyProduct,
        promoCode: Nullable<MembershipLegacyPromoCode>,
        renewalPeriodEnd: Nullable<Date>,
        renewalPeriodStart: Nullable<Date>,
        status: MembershipStatus,
        updatedAt: Date,
        user: Nullable<MembershipLegacyUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cancelAtPeriodEnd = cancelAtPeriodEnd
        self.cancelOption = cancelOption
        self.cancelationStatus = cancelationStatus
        self.canceledAt = canceledAt
        self.cancellationReason = cancellationReason
        self.checkoutConfigurationId = checkoutConfigurationId
        self.company = company
        self.createdAt = createdAt
        self.currency = currency
        self.customFieldResponses = customFieldResponses
        self.externalAccounts = externalAccounts
        self.feedbackOption = feedbackOption
        self.formattedRenewalPrice = formattedRenewalPrice
        self.id = id
        self.initialPricePaid = initialPricePaid
        self.joinedAt = joinedAt
        self.licenseKey = licenseKey
        self.manageUrl = manageUrl
        self.member = member
        self.metadata = metadata
        self.paymentCollectionPaused = paymentCollectionPaused
        self.plan = plan
        self.product = product
        self.promoCode = promoCode
        self.renewalPeriodEnd = renewalPeriodEnd
        self.renewalPeriodStart = renewalPeriodStart
        self.status = status
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cancelAtPeriodEnd = try container.decode(Bool.self, forKey: .cancelAtPeriodEnd)
        self.cancelOption = try container.decode(Nullable<CancelOptions>.self, forKey: .cancelOption)
        self.cancelationStatus = try container.decode(Nullable<CancelationStatus>.self, forKey: .cancelationStatus)
        self.canceledAt = try container.decode(Nullable<Date>.self, forKey: .canceledAt)
        self.cancellationReason = try container.decode(Nullable<String>.self, forKey: .cancellationReason)
        self.checkoutConfigurationId = try container.decode(Nullable<String>.self, forKey: .checkoutConfigurationId)
        self.company = try container.decode(MembershipLegacyCompany.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<Currencies>.self, forKey: .currency)
        self.customFieldResponses = try container.decode([MembershipLegacyCustomFieldResponsesItem].self, forKey: .customFieldResponses)
        self.externalAccounts = try container.decode(Nullable<[MembershipLegacyExternalAccountsItem]>.self, forKey: .externalAccounts)
        self.feedbackOption = try container.decode(Nullable<MembershipLegacyFeedbackOption>.self, forKey: .feedbackOption)
        self.formattedRenewalPrice = try container.decode(Nullable<String>.self, forKey: .formattedRenewalPrice)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPricePaid = try container.decode(String.self, forKey: .initialPricePaid)
        self.joinedAt = try container.decode(Nullable<Date>.self, forKey: .joinedAt)
        self.licenseKey = try container.decode(Nullable<String>.self, forKey: .licenseKey)
        self.manageUrl = try container.decode(Nullable<String>.self, forKey: .manageUrl)
        self.member = try container.decode(Nullable<MembershipLegacyMember>.self, forKey: .member)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.paymentCollectionPaused = try container.decode(Bool.self, forKey: .paymentCollectionPaused)
        self.plan = try container.decode(MembershipLegacyPlan.self, forKey: .plan)
        self.product = try container.decode(MembershipLegacyProduct.self, forKey: .product)
        self.promoCode = try container.decode(Nullable<MembershipLegacyPromoCode>.self, forKey: .promoCode)
        self.renewalPeriodEnd = try container.decode(Nullable<Date>.self, forKey: .renewalPeriodEnd)
        self.renewalPeriodStart = try container.decode(Nullable<Date>.self, forKey: .renewalPeriodStart)
        self.status = try container.decode(MembershipStatus.self, forKey: .status)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(Nullable<MembershipLegacyUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
        try container.encode(self.cancelOption, forKey: .cancelOption)
        try container.encode(self.cancelationStatus, forKey: .cancelationStatus)
        try container.encode(self.canceledAt, forKey: .canceledAt)
        try container.encode(self.cancellationReason, forKey: .cancellationReason)
        try container.encode(self.checkoutConfigurationId, forKey: .checkoutConfigurationId)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customFieldResponses, forKey: .customFieldResponses)
        try container.encode(self.externalAccounts, forKey: .externalAccounts)
        try container.encode(self.feedbackOption, forKey: .feedbackOption)
        try container.encode(self.formattedRenewalPrice, forKey: .formattedRenewalPrice)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPricePaid, forKey: .initialPricePaid)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.licenseKey, forKey: .licenseKey)
        try container.encode(self.manageUrl, forKey: .manageUrl)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.paymentCollectionPaused, forKey: .paymentCollectionPaused)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.promoCode, forKey: .promoCode)
        try container.encode(self.renewalPeriodEnd, forKey: .renewalPeriodEnd)
        try container.encode(self.renewalPeriodStart, forKey: .renewalPeriodStart)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cancelAtPeriodEnd = "cancel_at_period_end"
        case cancelOption = "cancel_option"
        case cancelationStatus = "cancelation_status"
        case canceledAt = "canceled_at"
        case cancellationReason = "cancellation_reason"
        case checkoutConfigurationId = "checkout_configuration_id"
        case company
        case createdAt = "created_at"
        case currency
        case customFieldResponses = "custom_field_responses"
        case externalAccounts = "external_accounts"
        case feedbackOption = "feedback_option"
        case formattedRenewalPrice = "formatted_renewal_price"
        case id
        case initialPricePaid = "initial_price_paid"
        case joinedAt = "joined_at"
        case licenseKey = "license_key"
        case manageUrl = "manage_url"
        case member
        case metadata
        case paymentCollectionPaused = "payment_collection_paused"
        case plan
        case product
        case promoCode = "promo_code"
        case renewalPeriodEnd = "renewal_period_end"
        case renewalPeriodStart = "renewal_period_start"
        case status
        case updatedAt = "updated_at"
        case user
    }
}
import Foundation

public struct Membership: Codable, Hashable, Sendable {
    /// The account (seller) this membership belongs to.
    public let account: StorefrontAccount
    /// The membership's affiliate commission. `null` without an affiliate, without `affiliate:basic:read` on the account, and always in webhooks.
    public let affiliate: Nullable<MembershipAffiliate>
    /// Number of days between recurring charges. `null` for non-renewing memberships or memberships with multiple renewal schedules.
    public let billingPeriodDays: Nullable<Int>
    /// Whether the membership is set to cancel when the current billing period ends. Only meaningful for recurring variants.
    public let cancelAtPeriodEnd: Bool
    /// The category the member picked for why they canceled. `null` when no category was picked.
    public let cancelOption: Nullable<MembershipCancelOption>
    /// When cancellation was requested, or when the membership was canceled if no request time is recorded, as an ISO 8601 timestamp. `null` when neither is recorded.
    public let canceledAt: Nullable<String>
    /// Free-text explanation provided when canceling. `null` when no reason was provided.
    public let cancellationReason: Nullable<String>
    /// How renewals are collected. `charge_automatically` charges the saved payment method each period; `send_invoice` emails the buyer an invoice each period. `null` when not set.
    public let collectionMethod: Nullable<MembershipCollectionMethod>
    /// When the membership was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the current billing period renews, or when a non-renewing membership expires, as an ISO 8601 timestamp. `null` for one-time purchases with no expiration.
    public let currentPeriodEnd: Nullable<String>
    /// When the current billing period started, as an ISO 8601 timestamp. `null` when no billing period is recorded.
    public let currentPeriodStart: Nullable<String>
    /// When access ends for a membership with a fixed expiration, as an ISO 8601 timestamp. `null` when the membership has no expiration, such as a renewing membership.
    public let expiresAt: Nullable<String>
    public let externalAccounts: Nullable<[MembershipExternalAccount]>
    /// The account's own cancel reason the member picked, as they saw it. `null` when the member picked a default category or gave no reason.
    public let feedbackOption: Nullable<MembershipFeedbackOption>
    /// Membership ID, prefixed `mem_`.
    public let id: String
    /// The variant's current up-front price, in the variant's currency. A list price, not necessarily what the buyer paid. `amount` is `"0.00"` when the first charge is free.
    public let initialPrice: Money
    /// The software license key for this membership. Only present when the product includes a software licensing experience.
    public let licenseKey: Nullable<String>
    /// URL where the buyer can sign in to manage billing. `null` without a member record or unless the caller is the buyer or has `member:manage` on the account.
    public let manageUrl: Nullable<String>
    /// The caller's member row on the account. Present only when the membership belongs to the caller; `null` on seller-side reads.
    public let member: Nullable<MembershipMember>
    /// The buyer's member record on the account, prefixed `mber_`. `null` when the membership has no member record, such as an unclaimed membership.
    public let memberId: Nullable<String>
    /// Custom key-value pairs stored on the membership, commonly used for software licensing.
    public let metadata: [String: JSONValue]
    /// The membership's latest lifecycle event, such as `renewing_on` or `canceled_on`. Pair it with `most_recent_action_at`. `null` when none is recorded.
    public let mostRecentAction: Nullable<MembershipMostRecentAction>
    /// When `most_recent_action` happened or is scheduled to happen, as an ISO 8601 timestamp. A future time for upcoming events such as `renewing_on`. `null` when no action is recorded.
    public let mostRecentActionAt: Nullable<String>
    /// The buyer's phone number recorded for this membership, or `null`. The number collected (or verified) at checkout when the seller's phone collection is on; falls back to the buyer's account number when they have shared one with this seller.
    public let phoneNumber: Nullable<String>
    /// The product this membership grants access to.
    public let product: MembershipProduct
    /// The product this membership grants access to, prefixed `prod_`.
    public let productId: String
    /// The promo code discounting this membership, prefixed `promo_`. `null` when none is applied. Set at checkout or by Apply Promo Code to Membership.
    public let promoCodeId: Nullable<String>
    /// The variant's renewal price, in the variant's currency, after any promo code that still applies. A membership billed in the buyer's local currency is charged this price converted at the exchange rate on each billing date. `null` for non-renewing memberships.
    public let renewalPrice: Nullable<Money>
    /// Paid installments counted so far on a split pay membership. `null` when the membership is not on split pay, or before its first installment is counted.
    public let splitPayCurrentPayments: Nullable<Int>
    /// Installment payments required before the membership stops billing. `null` when the membership is not on split pay.
    public let splitPayRequiredPayments: Nullable<Int>
    /// Billing state of the membership. `active`/`trialing` memberships grant access; `past_due` is the grace period after a failed payment; `completed` one-time purchases keep access; `canceled`/`expired` do not.
    public let status: MembershipStatus
    /// When the membership was last changed, as an ISO 8601 timestamp. Reflects the most recent change to the membership itself, so you can reconcile against webhook retries, replays, and backfills.
    public let updatedAt: String
    /// The buyer, prefixed `user_`. `null` when the buyer is another business or the membership is unclaimed.
    public let userId: Nullable<String>
    /// The variant the buyer purchased, prefixed `plan_`.
    public let variantId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: StorefrontAccount,
        affiliate: Nullable<MembershipAffiliate>,
        billingPeriodDays: Nullable<Int>,
        cancelAtPeriodEnd: Bool,
        cancelOption: Nullable<MembershipCancelOption>,
        canceledAt: Nullable<String>,
        cancellationReason: Nullable<String>,
        collectionMethod: Nullable<MembershipCollectionMethod>,
        createdAt: String,
        currentPeriodEnd: Nullable<String>,
        currentPeriodStart: Nullable<String>,
        expiresAt: Nullable<String>,
        externalAccounts: Nullable<[MembershipExternalAccount]>,
        feedbackOption: Nullable<MembershipFeedbackOption>,
        id: String,
        initialPrice: Money,
        licenseKey: Nullable<String>,
        manageUrl: Nullable<String>,
        member: Nullable<MembershipMember>,
        memberId: Nullable<String>,
        metadata: [String: JSONValue],
        mostRecentAction: Nullable<MembershipMostRecentAction>,
        mostRecentActionAt: Nullable<String>,
        phoneNumber: Nullable<String>,
        product: MembershipProduct,
        productId: String,
        promoCodeId: Nullable<String>,
        renewalPrice: Nullable<Money>,
        splitPayCurrentPayments: Nullable<Int>,
        splitPayRequiredPayments: Nullable<Int>,
        status: MembershipStatus,
        updatedAt: String,
        userId: Nullable<String>,
        variantId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.affiliate = affiliate
        self.billingPeriodDays = billingPeriodDays
        self.cancelAtPeriodEnd = cancelAtPeriodEnd
        self.cancelOption = cancelOption
        self.canceledAt = canceledAt
        self.cancellationReason = cancellationReason
        self.collectionMethod = collectionMethod
        self.createdAt = createdAt
        self.currentPeriodEnd = currentPeriodEnd
        self.currentPeriodStart = currentPeriodStart
        self.expiresAt = expiresAt
        self.externalAccounts = externalAccounts
        self.feedbackOption = feedbackOption
        self.id = id
        self.initialPrice = initialPrice
        self.licenseKey = licenseKey
        self.manageUrl = manageUrl
        self.member = member
        self.memberId = memberId
        self.metadata = metadata
        self.mostRecentAction = mostRecentAction
        self.mostRecentActionAt = mostRecentActionAt
        self.phoneNumber = phoneNumber
        self.product = product
        self.productId = productId
        self.promoCodeId = promoCodeId
        self.renewalPrice = renewalPrice
        self.splitPayCurrentPayments = splitPayCurrentPayments
        self.splitPayRequiredPayments = splitPayRequiredPayments
        self.status = status
        self.updatedAt = updatedAt
        self.userId = userId
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(StorefrontAccount.self, forKey: .account)
        self.affiliate = try container.decode(Nullable<MembershipAffiliate>.self, forKey: .affiliate)
        self.billingPeriodDays = try container.decode(Nullable<Int>.self, forKey: .billingPeriodDays)
        self.cancelAtPeriodEnd = try container.decode(Bool.self, forKey: .cancelAtPeriodEnd)
        self.cancelOption = try container.decode(Nullable<MembershipCancelOption>.self, forKey: .cancelOption)
        self.canceledAt = try container.decode(Nullable<String>.self, forKey: .canceledAt)
        self.cancellationReason = try container.decode(Nullable<String>.self, forKey: .cancellationReason)
        self.collectionMethod = try container.decode(Nullable<MembershipCollectionMethod>.self, forKey: .collectionMethod)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currentPeriodEnd = try container.decode(Nullable<String>.self, forKey: .currentPeriodEnd)
        self.currentPeriodStart = try container.decode(Nullable<String>.self, forKey: .currentPeriodStart)
        self.expiresAt = try container.decode(Nullable<String>.self, forKey: .expiresAt)
        self.externalAccounts = try container.decode(Nullable<[MembershipExternalAccount]>.self, forKey: .externalAccounts)
        self.feedbackOption = try container.decode(Nullable<MembershipFeedbackOption>.self, forKey: .feedbackOption)
        self.id = try container.decode(String.self, forKey: .id)
        self.initialPrice = try container.decode(Money.self, forKey: .initialPrice)
        self.licenseKey = try container.decode(Nullable<String>.self, forKey: .licenseKey)
        self.manageUrl = try container.decode(Nullable<String>.self, forKey: .manageUrl)
        self.member = try container.decode(Nullable<MembershipMember>.self, forKey: .member)
        self.memberId = try container.decode(Nullable<String>.self, forKey: .memberId)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.mostRecentAction = try container.decode(Nullable<MembershipMostRecentAction>.self, forKey: .mostRecentAction)
        self.mostRecentActionAt = try container.decode(Nullable<String>.self, forKey: .mostRecentActionAt)
        self.phoneNumber = try container.decode(Nullable<String>.self, forKey: .phoneNumber)
        self.product = try container.decode(MembershipProduct.self, forKey: .product)
        self.productId = try container.decode(String.self, forKey: .productId)
        self.promoCodeId = try container.decode(Nullable<String>.self, forKey: .promoCodeId)
        self.renewalPrice = try container.decode(Nullable<Money>.self, forKey: .renewalPrice)
        self.splitPayCurrentPayments = try container.decode(Nullable<Int>.self, forKey: .splitPayCurrentPayments)
        self.splitPayRequiredPayments = try container.decode(Nullable<Int>.self, forKey: .splitPayRequiredPayments)
        self.status = try container.decode(MembershipStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.variantId = try container.decode(String.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.affiliate, forKey: .affiliate)
        try container.encode(self.billingPeriodDays, forKey: .billingPeriodDays)
        try container.encode(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
        try container.encode(self.cancelOption, forKey: .cancelOption)
        try container.encode(self.canceledAt, forKey: .canceledAt)
        try container.encode(self.cancellationReason, forKey: .cancellationReason)
        try container.encode(self.collectionMethod, forKey: .collectionMethod)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currentPeriodEnd, forKey: .currentPeriodEnd)
        try container.encode(self.currentPeriodStart, forKey: .currentPeriodStart)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.externalAccounts, forKey: .externalAccounts)
        try container.encode(self.feedbackOption, forKey: .feedbackOption)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.initialPrice, forKey: .initialPrice)
        try container.encode(self.licenseKey, forKey: .licenseKey)
        try container.encode(self.manageUrl, forKey: .manageUrl)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.mostRecentAction, forKey: .mostRecentAction)
        try container.encode(self.mostRecentActionAt, forKey: .mostRecentActionAt)
        try container.encode(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.promoCodeId, forKey: .promoCodeId)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.splitPayCurrentPayments, forKey: .splitPayCurrentPayments)
        try container.encode(self.splitPayRequiredPayments, forKey: .splitPayRequiredPayments)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case affiliate
        case billingPeriodDays = "billing_period_days"
        case cancelAtPeriodEnd = "cancel_at_period_end"
        case cancelOption = "cancel_option"
        case canceledAt = "canceled_at"
        case cancellationReason = "cancellation_reason"
        case collectionMethod = "collection_method"
        case createdAt = "created_at"
        case currentPeriodEnd = "current_period_end"
        case currentPeriodStart = "current_period_start"
        case expiresAt = "expires_at"
        case externalAccounts = "external_accounts"
        case feedbackOption = "feedback_option"
        case id
        case initialPrice = "initial_price"
        case licenseKey = "license_key"
        case manageUrl = "manage_url"
        case member
        case memberId = "member_id"
        case metadata
        case mostRecentAction = "most_recent_action"
        case mostRecentActionAt = "most_recent_action_at"
        case phoneNumber = "phone_number"
        case product
        case productId = "product_id"
        case promoCodeId = "promo_code_id"
        case renewalPrice = "renewal_price"
        case splitPayCurrentPayments = "split_pay_current_payments"
        case splitPayRequiredPayments = "split_pay_required_payments"
        case status
        case updatedAt = "updated_at"
        case userId = "user_id"
        case variantId = "variant_id"
    }
}
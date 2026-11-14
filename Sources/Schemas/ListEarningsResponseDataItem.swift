import Foundation

public struct ListEarningsResponseDataItem: Codable, Hashable, Sendable {
    /// Referred account.
    public let account: Nullable<ListEarningsResponseDataItemAccount>
    /// Why the earning was canceled or reversed, if applicable.
    public let cancelationReason: Nullable<String>
    /// What the referrer earns, in USD. Null until the earning settles.
    public let commissionAmountUsd: Nullable<String>
    /// Whether an upfront commission advance replaces this commission, including covered earnings that are still awaiting settlement.
    public let coveredByCommissionAdvance: Bool
    public let createdAt: Date
    /// Income and cost lines behind this earning's commission. Null for earnings settled before this data was recorded.
    public let financialActivity: Nullable<[ListEarningsResponseDataItemFinancialActivityItem]>
    public let id: Nullable<String>
    /// Which income source the commission is on: product-sales gross profit, Whop Ads spend billed to the business, platform balance transfer fees, Whop Card interchange, withdrawal gross profit, or a fixed onboarding or referral link reward paid to the partner when a referred business qualifies.
    public let incomeSource: ListEarningsResponseDataItemIncomeSource
    public let object: ListEarningsResponseDataItemObject
    public let payoutAt: Nullable<Date>
    /// The referrer's share of Whop's gross profit, as a fraction (0.3 = 30%). Null until the earning settles.
    public let payoutPercentage: Nullable<Float>
    public let product: Nullable<ListEarningsResponseDataItemProduct>
    /// Estimated commission while awaiting settlement. Zero when a funded commission advance covers the earning. Null when no estimate is available or the earning has settled.
    public let projectedCommissionAmountUsd: Nullable<Money>
    /// The resource that generated the earning. For sales and ad spend earnings, it is the customer payment receipt. For transfer earnings, it is the balance transfer. For withdrawal earnings, it is the withdrawal. For card interchange earnings, it is the card transaction. For fixed reward earnings, it is the qualifying reward. For business referral earnings, it is the referred partner business's own commission.
    public let resource: Nullable<ListEarningsResponseDataItemResource>
    /// Whether this earning is a second-tier (grandparent) commission.
    public let secondTier: Bool
    /// Current status of the earning.
    public let status: ListEarningsResponseDataItemStatus
    /// The underlying transaction amount the commission's income comes from, in USD.
    public let transactionAmountUsd: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<ListEarningsResponseDataItemAccount>,
        cancelationReason: Nullable<String>,
        commissionAmountUsd: Nullable<String>,
        coveredByCommissionAdvance: Bool,
        createdAt: Date,
        financialActivity: Nullable<[ListEarningsResponseDataItemFinancialActivityItem]>,
        id: Nullable<String>,
        incomeSource: ListEarningsResponseDataItemIncomeSource,
        object: ListEarningsResponseDataItemObject,
        payoutAt: Nullable<Date>,
        payoutPercentage: Nullable<Float>,
        product: Nullable<ListEarningsResponseDataItemProduct>,
        projectedCommissionAmountUsd: Nullable<Money>,
        resource: Nullable<ListEarningsResponseDataItemResource>,
        secondTier: Bool,
        status: ListEarningsResponseDataItemStatus,
        transactionAmountUsd: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.cancelationReason = cancelationReason
        self.commissionAmountUsd = commissionAmountUsd
        self.coveredByCommissionAdvance = coveredByCommissionAdvance
        self.createdAt = createdAt
        self.financialActivity = financialActivity
        self.id = id
        self.incomeSource = incomeSource
        self.object = object
        self.payoutAt = payoutAt
        self.payoutPercentage = payoutPercentage
        self.product = product
        self.projectedCommissionAmountUsd = projectedCommissionAmountUsd
        self.resource = resource
        self.secondTier = secondTier
        self.status = status
        self.transactionAmountUsd = transactionAmountUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<ListEarningsResponseDataItemAccount>.self, forKey: .account)
        self.cancelationReason = try container.decode(Nullable<String>.self, forKey: .cancelationReason)
        self.commissionAmountUsd = try container.decode(Nullable<String>.self, forKey: .commissionAmountUsd)
        self.coveredByCommissionAdvance = try container.decode(Bool.self, forKey: .coveredByCommissionAdvance)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.financialActivity = try container.decode(Nullable<[ListEarningsResponseDataItemFinancialActivityItem]>.self, forKey: .financialActivity)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.incomeSource = try container.decode(ListEarningsResponseDataItemIncomeSource.self, forKey: .incomeSource)
        self.object = try container.decode(ListEarningsResponseDataItemObject.self, forKey: .object)
        self.payoutAt = try container.decode(Nullable<Date>.self, forKey: .payoutAt)
        self.payoutPercentage = try container.decode(Nullable<Float>.self, forKey: .payoutPercentage)
        self.product = try container.decode(Nullable<ListEarningsResponseDataItemProduct>.self, forKey: .product)
        self.projectedCommissionAmountUsd = try container.decode(Nullable<Money>.self, forKey: .projectedCommissionAmountUsd)
        self.resource = try container.decode(Nullable<ListEarningsResponseDataItemResource>.self, forKey: .resource)
        self.secondTier = try container.decode(Bool.self, forKey: .secondTier)
        self.status = try container.decode(ListEarningsResponseDataItemStatus.self, forKey: .status)
        self.transactionAmountUsd = try container.decode(String.self, forKey: .transactionAmountUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.cancelationReason, forKey: .cancelationReason)
        try container.encode(self.commissionAmountUsd, forKey: .commissionAmountUsd)
        try container.encode(self.coveredByCommissionAdvance, forKey: .coveredByCommissionAdvance)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.financialActivity, forKey: .financialActivity)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.incomeSource, forKey: .incomeSource)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.payoutAt, forKey: .payoutAt)
        try container.encode(self.payoutPercentage, forKey: .payoutPercentage)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.projectedCommissionAmountUsd, forKey: .projectedCommissionAmountUsd)
        try container.encode(self.resource, forKey: .resource)
        try container.encode(self.secondTier, forKey: .secondTier)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.transactionAmountUsd, forKey: .transactionAmountUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case cancelationReason = "cancelation_reason"
        case commissionAmountUsd = "commission_amount_usd"
        case coveredByCommissionAdvance = "covered_by_commission_advance"
        case createdAt = "created_at"
        case financialActivity = "financial_activity"
        case id
        case incomeSource = "income_source"
        case object
        case payoutAt = "payout_at"
        case payoutPercentage = "payout_percentage"
        case product
        case projectedCommissionAmountUsd = "projected_commission_amount_usd"
        case resource
        case secondTier = "second_tier"
        case status
        case transactionAmountUsd = "transaction_amount_usd"
    }
}
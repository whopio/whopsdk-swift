import Foundation

public struct ResolutionCenterCase: Codable, Hashable, Sendable {
    /// The account the case was filed against.
    public let account: Nullable<AccountSummary>
    /// The amount in question, in whole units of `currency`.
    public let amount: Double
    public let availableActions: [ResolutionCenterCaseAvailableActionsItem]
    /// The customer who opened the case.
    public let buyer: ResolutionBuyer
    /// When the case was opened, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code of the amount.
    public let currency: Nullable<String>
    /// Whether the customer has appealed a decision on this case.
    public let customerAppealed: Bool
    /// Whether Whop is involved — either reviewing the case, or waiting on the side named by `status` for something it asked for while reviewing.
    public let escalated: Bool
    /// Resolution center case ID, prefixed `reso_`.
    public let id: String
    public let lineItems: [ReceiptLineItem]
    /// Who prevailed on the claim. `null` until the case closes. Read `refund` for whether any money actually moved.
    public let outcome: Nullable<ResolutionCenterCaseOutcome>
    /// The payment the case was opened against.
    public let payment: ResolutionPayment
    /// The product the payment was for, prefixed `prod_`.
    public let productId: Nullable<String>
    /// What the customer says went wrong. Shares the `/disputes` vocabulary, so a case that later becomes a chargeback reports the same complaint.
    public let reason: ResolutionCenterCaseReason
    /// Whether money moved and off whose balance: `none`, `merchant`, or `platform` (Whop refunded the customer and the merchant kept the funds). Independent of `outcome` — a case the merchant won can still carry a platform refund. `null` while the case is open, and on older closed cases that predate this being recorded.
    public let refund: Nullable<ResolutionCenterCaseRefund>
    /// When the next response is due, as an ISO 8601 timestamp.
    public let responseDueAt: Nullable<String>
    /// Who the case is waiting on. `awaiting_merchant` and `awaiting_customer` name the side that owes a response, `under_review` means Whop is deciding, and `closed` means it is settled — read `outcome` for how.
    public let status: ResolutionCenterCaseStatus
    /// When the case was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The variant the payment was made on, prefixed `plan_`.
    public let variantId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<AccountSummary>,
        amount: Double,
        availableActions: [ResolutionCenterCaseAvailableActionsItem],
        buyer: ResolutionBuyer,
        createdAt: String,
        currency: Nullable<String>,
        customerAppealed: Bool,
        escalated: Bool,
        id: String,
        lineItems: [ReceiptLineItem],
        outcome: Nullable<ResolutionCenterCaseOutcome>,
        payment: ResolutionPayment,
        productId: Nullable<String>,
        reason: ResolutionCenterCaseReason,
        refund: Nullable<ResolutionCenterCaseRefund>,
        responseDueAt: Nullable<String>,
        status: ResolutionCenterCaseStatus,
        updatedAt: String,
        variantId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.amount = amount
        self.availableActions = availableActions
        self.buyer = buyer
        self.createdAt = createdAt
        self.currency = currency
        self.customerAppealed = customerAppealed
        self.escalated = escalated
        self.id = id
        self.lineItems = lineItems
        self.outcome = outcome
        self.payment = payment
        self.productId = productId
        self.reason = reason
        self.refund = refund
        self.responseDueAt = responseDueAt
        self.status = status
        self.updatedAt = updatedAt
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<AccountSummary>.self, forKey: .account)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.availableActions = try container.decode([ResolutionCenterCaseAvailableActionsItem].self, forKey: .availableActions)
        self.buyer = try container.decode(ResolutionBuyer.self, forKey: .buyer)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<String>.self, forKey: .currency)
        self.customerAppealed = try container.decode(Bool.self, forKey: .customerAppealed)
        self.escalated = try container.decode(Bool.self, forKey: .escalated)
        self.id = try container.decode(String.self, forKey: .id)
        self.lineItems = try container.decode([ReceiptLineItem].self, forKey: .lineItems)
        self.outcome = try container.decode(Nullable<ResolutionCenterCaseOutcome>.self, forKey: .outcome)
        self.payment = try container.decode(ResolutionPayment.self, forKey: .payment)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.reason = try container.decode(ResolutionCenterCaseReason.self, forKey: .reason)
        self.refund = try container.decode(Nullable<ResolutionCenterCaseRefund>.self, forKey: .refund)
        self.responseDueAt = try container.decode(Nullable<String>.self, forKey: .responseDueAt)
        self.status = try container.decode(ResolutionCenterCaseStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.availableActions, forKey: .availableActions)
        try container.encode(self.buyer, forKey: .buyer)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customerAppealed, forKey: .customerAppealed)
        try container.encode(self.escalated, forKey: .escalated)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.outcome, forKey: .outcome)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.refund, forKey: .refund)
        try container.encode(self.responseDueAt, forKey: .responseDueAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case amount
        case availableActions = "available_actions"
        case buyer
        case createdAt = "created_at"
        case currency
        case customerAppealed = "customer_appealed"
        case escalated
        case id
        case lineItems = "line_items"
        case outcome
        case payment
        case productId = "product_id"
        case reason
        case refund
        case responseDueAt = "response_due_at"
        case status
        case updatedAt = "updated_at"
        case variantId = "variant_id"
    }
}
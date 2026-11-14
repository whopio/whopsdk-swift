import Foundation

public struct Dispute: Codable, Hashable, Sendable {
    /// Whether the dispute can be conceded to the customer with `POST /disputes/{id}/accept`. True only for a chargeback still awaiting a response, before `evidence_due_at`, whose payment processor supports accepting disputes. Inquiries are never acceptable.
    public let acceptable: Bool
    /// The account the dispute was filed against, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// The disputed amount, in whole units of `currency`.
    public let amount: Double
    /// The customer who filed the dispute.
    public let buyer: DisputeBuyer
    /// When the dispute was opened, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code of the disputed amount.
    public let currency: String
    /// The evidence packet sent to the processor to contest the dispute.
    public let evidence: DisputeEvidence
    /// The deadline to submit evidence, as an ISO 8601 timestamp. `null` when the network already auto-resolved the dispute (Visa RDR) with no evidence round, or when the processor hasn't reported a deadline for this dispute.
    public let evidenceDueAt: Nullable<String>
    /// Whether `evidence` can still be changed and submitted.
    public let evidenceEditable: Bool
    /// Why evidence can no longer be edited. `null` while `evidence_editable` is true.
    public let evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>
    /// When the evidence was submitted to the processor, as an ISO 8601 timestamp.
    public let evidenceSubmittedAt: Nullable<String>
    /// The dispute fee charged to the account, in the currency it was collected in. `null` when `fee_charged` is false.
    public let fee: Nullable<Money>
    /// Whether Whop charged the account a dispute fee for this one. `false` when the payment was fully refunded before the dispute was opened, for a Visa RDR resolution, and for an inquiry.
    public let feeCharged: Bool
    /// Dispute ID, prefixed `dspt_`.
    public let id: String
    /// Whether this is a pre-dispute inquiry rather than a formal chargeback. Inquiries follow the same lifecycle but move no funds unless one escalates.
    public let inquiry: Bool
    public let issuerComments: [DisputeIssuerComment]
    public let lineItems: [ReceiptLineItem]
    /// The payment being disputed.
    public let payment: DisputePayment
    /// The product the disputed payment was for, prefixed `prod_`.
    public let productId: Nullable<String>
    /// Why the customer says they are disputing, normalized across processors and card networks. `other` covers a processor reason Whop has not categorized yet.
    public let reason: DisputeReason
    /// The raw card-network or processor reason code, such as `10.4`. Informational only — `reason` is not derived from it.
    public let reasonCode: Nullable<String>
    /// `needs_response` awaits evidence (after a processor refused a filing, `submission_failure_reason` says why); `generating_response` has evidence with the processor, not yet accepted; `under_review` is with the processor; `won`/`lost` are the rulings; `prevented` settles like `lost`. `warning_` statuses are the inquiry tiers. Past `evidence_due_at` an open one reports `under_review`.
    public let status: DisputeStatus
    /// Why the payment processor refused the last filing, in plain English, while the dispute is back in `needs_response`. Fix what it names and submit again. Only on retrieve: `dispute.updated` reports the move back to `needs_response`, then read this here.
    public let submissionFailureReason: Nullable<String>
    /// When the dispute was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The variant the disputed payment was made on, prefixed `plan_`.
    public let variantId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        acceptable: Bool,
        accountId: Nullable<String>,
        amount: Double,
        buyer: DisputeBuyer,
        createdAt: String,
        currency: String,
        evidence: DisputeEvidence,
        evidenceDueAt: Nullable<String>,
        evidenceEditable: Bool,
        evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>,
        evidenceSubmittedAt: Nullable<String>,
        fee: Nullable<Money>,
        feeCharged: Bool,
        id: String,
        inquiry: Bool,
        issuerComments: [DisputeIssuerComment],
        lineItems: [ReceiptLineItem],
        payment: DisputePayment,
        productId: Nullable<String>,
        reason: DisputeReason,
        reasonCode: Nullable<String>,
        status: DisputeStatus,
        submissionFailureReason: Nullable<String>,
        updatedAt: String,
        variantId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.acceptable = acceptable
        self.accountId = accountId
        self.amount = amount
        self.buyer = buyer
        self.createdAt = createdAt
        self.currency = currency
        self.evidence = evidence
        self.evidenceDueAt = evidenceDueAt
        self.evidenceEditable = evidenceEditable
        self.evidenceLockedReason = evidenceLockedReason
        self.evidenceSubmittedAt = evidenceSubmittedAt
        self.fee = fee
        self.feeCharged = feeCharged
        self.id = id
        self.inquiry = inquiry
        self.issuerComments = issuerComments
        self.lineItems = lineItems
        self.payment = payment
        self.productId = productId
        self.reason = reason
        self.reasonCode = reasonCode
        self.status = status
        self.submissionFailureReason = submissionFailureReason
        self.updatedAt = updatedAt
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.acceptable = try container.decode(Bool.self, forKey: .acceptable)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.buyer = try container.decode(DisputeBuyer.self, forKey: .buyer)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.evidence = try container.decode(DisputeEvidence.self, forKey: .evidence)
        self.evidenceDueAt = try container.decode(Nullable<String>.self, forKey: .evidenceDueAt)
        self.evidenceEditable = try container.decode(Bool.self, forKey: .evidenceEditable)
        self.evidenceLockedReason = try container.decode(Nullable<DisputeEvidenceLockedReason>.self, forKey: .evidenceLockedReason)
        self.evidenceSubmittedAt = try container.decode(Nullable<String>.self, forKey: .evidenceSubmittedAt)
        self.fee = try container.decode(Nullable<Money>.self, forKey: .fee)
        self.feeCharged = try container.decode(Bool.self, forKey: .feeCharged)
        self.id = try container.decode(String.self, forKey: .id)
        self.inquiry = try container.decode(Bool.self, forKey: .inquiry)
        self.issuerComments = try container.decode([DisputeIssuerComment].self, forKey: .issuerComments)
        self.lineItems = try container.decode([ReceiptLineItem].self, forKey: .lineItems)
        self.payment = try container.decode(DisputePayment.self, forKey: .payment)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.reason = try container.decode(DisputeReason.self, forKey: .reason)
        self.reasonCode = try container.decode(Nullable<String>.self, forKey: .reasonCode)
        self.status = try container.decode(DisputeStatus.self, forKey: .status)
        self.submissionFailureReason = try container.decode(Nullable<String>.self, forKey: .submissionFailureReason)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.acceptable, forKey: .acceptable)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.buyer, forKey: .buyer)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.evidence, forKey: .evidence)
        try container.encode(self.evidenceDueAt, forKey: .evidenceDueAt)
        try container.encode(self.evidenceEditable, forKey: .evidenceEditable)
        try container.encode(self.evidenceLockedReason, forKey: .evidenceLockedReason)
        try container.encode(self.evidenceSubmittedAt, forKey: .evidenceSubmittedAt)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.feeCharged, forKey: .feeCharged)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inquiry, forKey: .inquiry)
        try container.encode(self.issuerComments, forKey: .issuerComments)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.reasonCode, forKey: .reasonCode)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.submissionFailureReason, forKey: .submissionFailureReason)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case acceptable
        case accountId = "account_id"
        case amount
        case buyer
        case createdAt = "created_at"
        case currency
        case evidence
        case evidenceDueAt = "evidence_due_at"
        case evidenceEditable = "evidence_editable"
        case evidenceLockedReason = "evidence_locked_reason"
        case evidenceSubmittedAt = "evidence_submitted_at"
        case fee
        case feeCharged = "fee_charged"
        case id
        case inquiry
        case issuerComments = "issuer_comments"
        case lineItems = "line_items"
        case payment
        case productId = "product_id"
        case reason
        case reasonCode = "reason_code"
        case status
        case submissionFailureReason = "submission_failure_reason"
        case updatedAt = "updated_at"
        case variantId = "variant_id"
    }
}
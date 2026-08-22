import Foundation

public struct Dispute: Codable, Hashable, Sendable {
    /// The account the dispute was filed against, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// The disputed amount, in whole units of `currency`.
    public let amount: Double
    /// The customer who filed the dispute.
    public let buyer: Nullable<DisputeBuyer>
    /// When the dispute was opened, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO currency code of the disputed amount.
    public let currency: String
    /// The evidence packet sent to the processor to contest the dispute.
    public let evidence: DisputeEvidence
    /// The deadline to submit evidence, as an ISO 8601 timestamp. Whop reserves the last 24 hours before the processor's own cutoff to forward the submission.
    public let evidenceDueAt: Nullable<String>
    /// Whether `evidence` can still be changed and submitted.
    public let evidenceEditable: Bool
    /// Why evidence can no longer be edited. `null` while `evidence_editable` is true.
    public let evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>
    /// When the evidence was submitted to the processor, as an ISO 8601 timestamp.
    public let evidenceSubmittedAt: Nullable<String>
    /// The AI-generated representment document filed with the processor on the seller's behalf, once ready. Null until generation completes, and for disputes not using Whop Dispute Fighter.
    public let generatedResponseAttachment: Nullable<DisputeAttachment>
    /// Dispute ID, prefixed `dspt_`.
    public let id: String
    /// Whether this is a pre-dispute inquiry rather than a formal chargeback. Inquiries follow the same lifecycle but move no funds unless one escalates.
    public let inquiry: Bool
    public let issuerComments: [DisputeIssuerComment]
    /// The payment being disputed.
    public let payment: Nullable<DisputePayment>
    /// The plan the disputed payment was made on, prefixed `plan_`.
    public let planId: Nullable<String>
    /// The product the disputed payment was for, prefixed `prod_`.
    public let productId: Nullable<String>
    /// Whether Visa Rapid Dispute Resolution settled this automatically. These refund the customer without an evidence round.
    public let rapidDisputeResolution: Bool
    /// Why the customer says they are disputing, normalized across card networks. `other` covers a code Whop has not categorized yet — read `reason_code` for the raw value.
    public let reason: DisputeReason
    /// The raw card-network or processor reason code, such as `10.4`.
    public let reasonCode: Nullable<String>
    /// Where the dispute stands. `needs_response` is awaiting evidence, `under_review` is with the processor, `won` returned the funds to the seller, `lost` returned them to the customer, and `closed` ended without a ruling. A dispute past its `evidence_due_at` reports `under_review` — the window to respond has closed.
    public let status: DisputeStatus
    /// When the dispute was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        amount: Double,
        buyer: Nullable<DisputeBuyer>,
        createdAt: String,
        currency: String,
        evidence: DisputeEvidence,
        evidenceDueAt: Nullable<String>,
        evidenceEditable: Bool,
        evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>,
        evidenceSubmittedAt: Nullable<String>,
        generatedResponseAttachment: Nullable<DisputeAttachment>,
        id: String,
        inquiry: Bool,
        issuerComments: [DisputeIssuerComment],
        payment: Nullable<DisputePayment>,
        planId: Nullable<String>,
        productId: Nullable<String>,
        rapidDisputeResolution: Bool,
        reason: DisputeReason,
        reasonCode: Nullable<String>,
        status: DisputeStatus,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
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
        self.generatedResponseAttachment = generatedResponseAttachment
        self.id = id
        self.inquiry = inquiry
        self.issuerComments = issuerComments
        self.payment = payment
        self.planId = planId
        self.productId = productId
        self.rapidDisputeResolution = rapidDisputeResolution
        self.reason = reason
        self.reasonCode = reasonCode
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.buyer = try container.decode(Nullable<DisputeBuyer>.self, forKey: .buyer)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.evidence = try container.decode(DisputeEvidence.self, forKey: .evidence)
        self.evidenceDueAt = try container.decode(Nullable<String>.self, forKey: .evidenceDueAt)
        self.evidenceEditable = try container.decode(Bool.self, forKey: .evidenceEditable)
        self.evidenceLockedReason = try container.decode(Nullable<DisputeEvidenceLockedReason>.self, forKey: .evidenceLockedReason)
        self.evidenceSubmittedAt = try container.decode(Nullable<String>.self, forKey: .evidenceSubmittedAt)
        self.generatedResponseAttachment = try container.decode(Nullable<DisputeAttachment>.self, forKey: .generatedResponseAttachment)
        self.id = try container.decode(String.self, forKey: .id)
        self.inquiry = try container.decode(Bool.self, forKey: .inquiry)
        self.issuerComments = try container.decode([DisputeIssuerComment].self, forKey: .issuerComments)
        self.payment = try container.decode(Nullable<DisputePayment>.self, forKey: .payment)
        self.planId = try container.decode(Nullable<String>.self, forKey: .planId)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.rapidDisputeResolution = try container.decode(Bool.self, forKey: .rapidDisputeResolution)
        self.reason = try container.decode(DisputeReason.self, forKey: .reason)
        self.reasonCode = try container.decode(Nullable<String>.self, forKey: .reasonCode)
        self.status = try container.decode(DisputeStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
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
        try container.encode(self.generatedResponseAttachment, forKey: .generatedResponseAttachment)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.inquiry, forKey: .inquiry)
        try container.encode(self.issuerComments, forKey: .issuerComments)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.planId, forKey: .planId)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.rapidDisputeResolution, forKey: .rapidDisputeResolution)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.reasonCode, forKey: .reasonCode)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
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
        case generatedResponseAttachment = "generated_response_attachment"
        case id
        case inquiry
        case issuerComments = "issuer_comments"
        case payment
        case planId = "plan_id"
        case productId = "product_id"
        case rapidDisputeResolution = "rapid_dispute_resolution"
        case reason
        case reasonCode = "reason_code"
        case status
        case updatedAt = "updated_at"
    }
}
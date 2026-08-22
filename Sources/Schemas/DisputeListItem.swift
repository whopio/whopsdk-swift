import Foundation

/// A dispute is a chargeback or payment challenge filed against a company, including evidence and response status.
public struct DisputeListItem: Codable, Hashable, Sendable {
    /// The disputed amount in the specified currency, formatted as a decimal.
    public let amount: Double
    /// The company that the dispute was filed against.
    public let company: Nullable<DisputeListItemCompany>
    /// The datetime the dispute was created.
    public let createdAt: Nullable<Date>
    /// The three-letter ISO currency code for the disputed amount.
    public let currency: Currencies
    /// Whether the dispute evidence can still be edited and submitted.
    public let editable: Nullable<Bool>
    /// The unique identifier for the dispute.
    public let id: String
    /// The deadline by which dispute evidence must be submitted. Null if no response deadline is set.
    public let needsResponseBy: Nullable<Date>
    /// The original payment that was disputed.
    public let payment: Nullable<DisputeListItemPayment>
    /// The plan associated with the disputed payment. Null if the dispute is not linked to a specific plan.
    public let plan: Nullable<DisputeListItemPlan>
    /// The product associated with the disputed payment. Null if the dispute is not linked to a specific product.
    public let product: Nullable<DisputeListItemProduct>
    /// A human-readable reason for the dispute.
    public let reason: Nullable<String>
    /// The card network reason code for the dispute. Null when the payment processor did not provide one.
    public let reasonCode: Nullable<String>
    /// The current status of the dispute lifecycle, such as needs_response, under_review, won, or lost.
    public let status: DisputeStatuses
    /// Whether the dispute was automatically resolved through Visa Rapid Dispute Resolution (RDR).
    public let visaRdr: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        company: Nullable<DisputeListItemCompany>,
        createdAt: Nullable<Date>,
        currency: Currencies,
        editable: Nullable<Bool>,
        id: String,
        needsResponseBy: Nullable<Date>,
        payment: Nullable<DisputeListItemPayment>,
        plan: Nullable<DisputeListItemPlan>,
        product: Nullable<DisputeListItemProduct>,
        reason: Nullable<String>,
        reasonCode: Nullable<String>,
        status: DisputeStatuses,
        visaRdr: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.company = company
        self.createdAt = createdAt
        self.currency = currency
        self.editable = editable
        self.id = id
        self.needsResponseBy = needsResponseBy
        self.payment = payment
        self.plan = plan
        self.product = product
        self.reason = reason
        self.reasonCode = reasonCode
        self.status = status
        self.visaRdr = visaRdr
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.company = try container.decode(Nullable<DisputeListItemCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.editable = try container.decode(Nullable<Bool>.self, forKey: .editable)
        self.id = try container.decode(String.self, forKey: .id)
        self.needsResponseBy = try container.decode(Nullable<Date>.self, forKey: .needsResponseBy)
        self.payment = try container.decode(Nullable<DisputeListItemPayment>.self, forKey: .payment)
        self.plan = try container.decode(Nullable<DisputeListItemPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<DisputeListItemProduct>.self, forKey: .product)
        self.reason = try container.decode(Nullable<String>.self, forKey: .reason)
        self.reasonCode = try container.decode(Nullable<String>.self, forKey: .reasonCode)
        self.status = try container.decode(DisputeStatuses.self, forKey: .status)
        self.visaRdr = try container.decode(Bool.self, forKey: .visaRdr)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.editable, forKey: .editable)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.needsResponseBy, forKey: .needsResponseBy)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.reasonCode, forKey: .reasonCode)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.visaRdr, forKey: .visaRdr)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case company
        case createdAt = "created_at"
        case currency
        case editable
        case id
        case needsResponseBy = "needs_response_by"
        case payment
        case plan
        case product
        case reason
        case reasonCode = "reason_code"
        case status
        case visaRdr = "visa_rdr"
    }
}
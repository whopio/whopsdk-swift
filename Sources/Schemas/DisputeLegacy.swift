import Foundation

/// A dispute is a chargeback or payment challenge filed against a company, including evidence and response status.
public struct DisputeLegacy: Codable, Hashable, Sendable {
    /// A log of IP-based access activity for the customer on Whop, submitted as evidence in the dispute.
    public let accessActivityLog: Nullable<String>
    /// The disputed amount in the specified currency, formatted as a decimal.
    public let amount: Double
    /// The customer's billing address from their payment details, submitted as evidence in the dispute.
    public let billingAddress: Nullable<String>
    /// The cancellation policy document uploaded as dispute evidence. Null if no cancellation policy has been provided.
    public let cancellationPolicyAttachment: Nullable<DisputeLegacyCancellationPolicyAttachment>
    /// A text disclosure describing the company's cancellation policy, submitted as dispute evidence.
    public let cancellationPolicyDisclosure: Nullable<String>
    /// The company that the dispute was filed against.
    public let company: Nullable<DisputeLegacyCompany>
    /// The datetime the dispute was created.
    public let createdAt: Nullable<Date>
    /// The three-letter ISO currency code for the disputed amount.
    public let currency: Currencies
    /// Evidence of customer communication or product usage, uploaded as a dispute attachment. Null if not provided.
    public let customerCommunicationAttachment: Nullable<DisputeLegacyCustomerCommunicationAttachment>
    /// The customer's email address from their payment details, included in the evidence packet sent to the payment processor. Editable before submission.
    public let customerEmailAddress: Nullable<String>
    /// The customer's full name from their payment details, included in the evidence packet sent to the payment processor. Editable before submission.
    public let customerName: Nullable<String>
    /// Whether the dispute evidence can still be edited and submitted.
    public let editable: Nullable<Bool>
    /// The unique identifier for the dispute.
    public let id: String
    /// The deadline by which dispute evidence must be submitted. Null if no response deadline is set.
    public let needsResponseBy: Nullable<Date>
    /// Additional freeform notes submitted by the company as part of the dispute evidence.
    public let notes: Nullable<String>
    /// The original payment that was disputed.
    public let payment: Nullable<DisputeLegacyPayment>
    /// The plan associated with the disputed payment. Null if the dispute is not linked to a specific plan.
    public let plan: Nullable<DisputeLegacyPlan>
    /// The product associated with the disputed payment. Null if the dispute is not linked to a specific product.
    public let product: Nullable<DisputeLegacyProduct>
    /// A description of the product or service provided, submitted as dispute evidence.
    public let productDescription: Nullable<String>
    /// A human-readable reason for the dispute.
    public let reason: Nullable<String>
    /// The card network reason code for the dispute. Null when the payment processor did not provide one.
    public let reasonCode: Nullable<String>
    /// The refund policy document uploaded as dispute evidence. Null if no refund policy has been provided.
    public let refundPolicyAttachment: Nullable<DisputeLegacyRefundPolicyAttachment>
    /// A text disclosure describing the company's refund policy, submitted as dispute evidence.
    public let refundPolicyDisclosure: Nullable<String>
    /// An explanation from the company for why a refund was refused, submitted as dispute evidence.
    public let refundRefusalExplanation: Nullable<String>
    /// The date when the product or service was delivered to the customer, submitted as dispute evidence.
    public let serviceDate: Nullable<String>
    /// The current status of the dispute lifecycle, such as needs_response, under_review, won, or lost.
    public let status: DisputeStatuses
    /// An additional attachment that does not fit into the standard evidence categories. Null if not provided.
    public let uncategorizedAttachment: Nullable<DisputeLegacyUncategorizedAttachment>
    /// Whether the dispute was automatically resolved through Visa Rapid Dispute Resolution (RDR).
    public let visaRdr: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessActivityLog: Nullable<String>,
        amount: Double,
        billingAddress: Nullable<String>,
        cancellationPolicyAttachment: Nullable<DisputeLegacyCancellationPolicyAttachment>,
        cancellationPolicyDisclosure: Nullable<String>,
        company: Nullable<DisputeLegacyCompany>,
        createdAt: Nullable<Date>,
        currency: Currencies,
        customerCommunicationAttachment: Nullable<DisputeLegacyCustomerCommunicationAttachment>,
        customerEmailAddress: Nullable<String>,
        customerName: Nullable<String>,
        editable: Nullable<Bool>,
        id: String,
        needsResponseBy: Nullable<Date>,
        notes: Nullable<String>,
        payment: Nullable<DisputeLegacyPayment>,
        plan: Nullable<DisputeLegacyPlan>,
        product: Nullable<DisputeLegacyProduct>,
        productDescription: Nullable<String>,
        reason: Nullable<String>,
        reasonCode: Nullable<String>,
        refundPolicyAttachment: Nullable<DisputeLegacyRefundPolicyAttachment>,
        refundPolicyDisclosure: Nullable<String>,
        refundRefusalExplanation: Nullable<String>,
        serviceDate: Nullable<String>,
        status: DisputeStatuses,
        uncategorizedAttachment: Nullable<DisputeLegacyUncategorizedAttachment>,
        visaRdr: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessActivityLog = accessActivityLog
        self.amount = amount
        self.billingAddress = billingAddress
        self.cancellationPolicyAttachment = cancellationPolicyAttachment
        self.cancellationPolicyDisclosure = cancellationPolicyDisclosure
        self.company = company
        self.createdAt = createdAt
        self.currency = currency
        self.customerCommunicationAttachment = customerCommunicationAttachment
        self.customerEmailAddress = customerEmailAddress
        self.customerName = customerName
        self.editable = editable
        self.id = id
        self.needsResponseBy = needsResponseBy
        self.notes = notes
        self.payment = payment
        self.plan = plan
        self.product = product
        self.productDescription = productDescription
        self.reason = reason
        self.reasonCode = reasonCode
        self.refundPolicyAttachment = refundPolicyAttachment
        self.refundPolicyDisclosure = refundPolicyDisclosure
        self.refundRefusalExplanation = refundRefusalExplanation
        self.serviceDate = serviceDate
        self.status = status
        self.uncategorizedAttachment = uncategorizedAttachment
        self.visaRdr = visaRdr
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessActivityLog = try container.decode(Nullable<String>.self, forKey: .accessActivityLog)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.billingAddress = try container.decode(Nullable<String>.self, forKey: .billingAddress)
        self.cancellationPolicyAttachment = try container.decode(Nullable<DisputeLegacyCancellationPolicyAttachment>.self, forKey: .cancellationPolicyAttachment)
        self.cancellationPolicyDisclosure = try container.decode(Nullable<String>.self, forKey: .cancellationPolicyDisclosure)
        self.company = try container.decode(Nullable<DisputeLegacyCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.customerCommunicationAttachment = try container.decode(Nullable<DisputeLegacyCustomerCommunicationAttachment>.self, forKey: .customerCommunicationAttachment)
        self.customerEmailAddress = try container.decode(Nullable<String>.self, forKey: .customerEmailAddress)
        self.customerName = try container.decode(Nullable<String>.self, forKey: .customerName)
        self.editable = try container.decode(Nullable<Bool>.self, forKey: .editable)
        self.id = try container.decode(String.self, forKey: .id)
        self.needsResponseBy = try container.decode(Nullable<Date>.self, forKey: .needsResponseBy)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.payment = try container.decode(Nullable<DisputeLegacyPayment>.self, forKey: .payment)
        self.plan = try container.decode(Nullable<DisputeLegacyPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<DisputeLegacyProduct>.self, forKey: .product)
        self.productDescription = try container.decode(Nullable<String>.self, forKey: .productDescription)
        self.reason = try container.decode(Nullable<String>.self, forKey: .reason)
        self.reasonCode = try container.decode(Nullable<String>.self, forKey: .reasonCode)
        self.refundPolicyAttachment = try container.decode(Nullable<DisputeLegacyRefundPolicyAttachment>.self, forKey: .refundPolicyAttachment)
        self.refundPolicyDisclosure = try container.decode(Nullable<String>.self, forKey: .refundPolicyDisclosure)
        self.refundRefusalExplanation = try container.decode(Nullable<String>.self, forKey: .refundRefusalExplanation)
        self.serviceDate = try container.decode(Nullable<String>.self, forKey: .serviceDate)
        self.status = try container.decode(DisputeStatuses.self, forKey: .status)
        self.uncategorizedAttachment = try container.decode(Nullable<DisputeLegacyUncategorizedAttachment>.self, forKey: .uncategorizedAttachment)
        self.visaRdr = try container.decode(Bool.self, forKey: .visaRdr)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessActivityLog, forKey: .accessActivityLog)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.billingAddress, forKey: .billingAddress)
        try container.encode(self.cancellationPolicyAttachment, forKey: .cancellationPolicyAttachment)
        try container.encode(self.cancellationPolicyDisclosure, forKey: .cancellationPolicyDisclosure)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customerCommunicationAttachment, forKey: .customerCommunicationAttachment)
        try container.encode(self.customerEmailAddress, forKey: .customerEmailAddress)
        try container.encode(self.customerName, forKey: .customerName)
        try container.encode(self.editable, forKey: .editable)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.needsResponseBy, forKey: .needsResponseBy)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.productDescription, forKey: .productDescription)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.reasonCode, forKey: .reasonCode)
        try container.encode(self.refundPolicyAttachment, forKey: .refundPolicyAttachment)
        try container.encode(self.refundPolicyDisclosure, forKey: .refundPolicyDisclosure)
        try container.encode(self.refundRefusalExplanation, forKey: .refundRefusalExplanation)
        try container.encode(self.serviceDate, forKey: .serviceDate)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.uncategorizedAttachment, forKey: .uncategorizedAttachment)
        try container.encode(self.visaRdr, forKey: .visaRdr)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessActivityLog = "access_activity_log"
        case amount
        case billingAddress = "billing_address"
        case cancellationPolicyAttachment = "cancellation_policy_attachment"
        case cancellationPolicyDisclosure = "cancellation_policy_disclosure"
        case company
        case createdAt = "created_at"
        case currency
        case customerCommunicationAttachment = "customer_communication_attachment"
        case customerEmailAddress = "customer_email_address"
        case customerName = "customer_name"
        case editable
        case id
        case needsResponseBy = "needs_response_by"
        case notes
        case payment
        case plan
        case product
        case productDescription = "product_description"
        case reason
        case reasonCode = "reason_code"
        case refundPolicyAttachment = "refund_policy_attachment"
        case refundPolicyDisclosure = "refund_policy_disclosure"
        case refundRefusalExplanation = "refund_refusal_explanation"
        case serviceDate = "service_date"
        case status
        case uncategorizedAttachment = "uncategorized_attachment"
        case visaRdr = "visa_rdr"
    }
}
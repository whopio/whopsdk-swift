import Foundation

public struct DisputeEvidence: Codable, Hashable, Sendable {
    /// Log of the customer's access to the product, such as sign-in or download activity.
    public let accessActivityLog: Nullable<String>
    /// The billing address the customer provided at checkout.
    public let billingAddress: Nullable<String>
    /// The cancellation policy document. Falls back to Whop's platform policy when the seller has not uploaded their own.
    public let cancellationPolicyAttachment: Nullable<DisputeAttachment>
    /// How the cancellation policy was shown to the customer before purchase.
    public let cancellationPolicyDisclosure: Nullable<String>
    /// Correspondence with the customer, or proof they used the product.
    public let customerCommunicationAttachment: Nullable<DisputeAttachment>
    /// The email address the customer used at checkout.
    public let customerEmailAddress: Nullable<String>
    /// The customer's name as given at checkout.
    public let customerName: Nullable<String>
    public let documents: [DisputeEvidenceDocument]
    /// Any additional context for the processor reviewing the dispute.
    public let notes: Nullable<String>
    /// What the customer purchased, in the seller's own words.
    public let productDescription: Nullable<String>
    /// The refund policy document. Falls back to Whop's platform policy when the seller has not uploaded their own.
    public let refundPolicyAttachment: Nullable<DisputeAttachment>
    /// How the refund policy was shown to the customer before purchase.
    public let refundPolicyDisclosure: Nullable<String>
    /// Why a refund was refused, when one was requested and denied.
    public let refundRefusalExplanation: Nullable<String>
    /// When the product or service was delivered.
    public let serviceDate: Nullable<String>
    /// Supporting evidence that does not fit the other categories.
    public let uncategorizedAttachment: Nullable<DisputeAttachment>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessActivityLog: Nullable<String>,
        billingAddress: Nullable<String>,
        cancellationPolicyAttachment: Nullable<DisputeAttachment>,
        cancellationPolicyDisclosure: Nullable<String>,
        customerCommunicationAttachment: Nullable<DisputeAttachment>,
        customerEmailAddress: Nullable<String>,
        customerName: Nullable<String>,
        documents: [DisputeEvidenceDocument],
        notes: Nullable<String>,
        productDescription: Nullable<String>,
        refundPolicyAttachment: Nullable<DisputeAttachment>,
        refundPolicyDisclosure: Nullable<String>,
        refundRefusalExplanation: Nullable<String>,
        serviceDate: Nullable<String>,
        uncategorizedAttachment: Nullable<DisputeAttachment>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessActivityLog = accessActivityLog
        self.billingAddress = billingAddress
        self.cancellationPolicyAttachment = cancellationPolicyAttachment
        self.cancellationPolicyDisclosure = cancellationPolicyDisclosure
        self.customerCommunicationAttachment = customerCommunicationAttachment
        self.customerEmailAddress = customerEmailAddress
        self.customerName = customerName
        self.documents = documents
        self.notes = notes
        self.productDescription = productDescription
        self.refundPolicyAttachment = refundPolicyAttachment
        self.refundPolicyDisclosure = refundPolicyDisclosure
        self.refundRefusalExplanation = refundRefusalExplanation
        self.serviceDate = serviceDate
        self.uncategorizedAttachment = uncategorizedAttachment
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessActivityLog = try container.decode(Nullable<String>.self, forKey: .accessActivityLog)
        self.billingAddress = try container.decode(Nullable<String>.self, forKey: .billingAddress)
        self.cancellationPolicyAttachment = try container.decode(Nullable<DisputeAttachment>.self, forKey: .cancellationPolicyAttachment)
        self.cancellationPolicyDisclosure = try container.decode(Nullable<String>.self, forKey: .cancellationPolicyDisclosure)
        self.customerCommunicationAttachment = try container.decode(Nullable<DisputeAttachment>.self, forKey: .customerCommunicationAttachment)
        self.customerEmailAddress = try container.decode(Nullable<String>.self, forKey: .customerEmailAddress)
        self.customerName = try container.decode(Nullable<String>.self, forKey: .customerName)
        self.documents = try container.decode([DisputeEvidenceDocument].self, forKey: .documents)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.productDescription = try container.decode(Nullable<String>.self, forKey: .productDescription)
        self.refundPolicyAttachment = try container.decode(Nullable<DisputeAttachment>.self, forKey: .refundPolicyAttachment)
        self.refundPolicyDisclosure = try container.decode(Nullable<String>.self, forKey: .refundPolicyDisclosure)
        self.refundRefusalExplanation = try container.decode(Nullable<String>.self, forKey: .refundRefusalExplanation)
        self.serviceDate = try container.decode(Nullable<String>.self, forKey: .serviceDate)
        self.uncategorizedAttachment = try container.decode(Nullable<DisputeAttachment>.self, forKey: .uncategorizedAttachment)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessActivityLog, forKey: .accessActivityLog)
        try container.encode(self.billingAddress, forKey: .billingAddress)
        try container.encode(self.cancellationPolicyAttachment, forKey: .cancellationPolicyAttachment)
        try container.encode(self.cancellationPolicyDisclosure, forKey: .cancellationPolicyDisclosure)
        try container.encode(self.customerCommunicationAttachment, forKey: .customerCommunicationAttachment)
        try container.encode(self.customerEmailAddress, forKey: .customerEmailAddress)
        try container.encode(self.customerName, forKey: .customerName)
        try container.encode(self.documents, forKey: .documents)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.productDescription, forKey: .productDescription)
        try container.encode(self.refundPolicyAttachment, forKey: .refundPolicyAttachment)
        try container.encode(self.refundPolicyDisclosure, forKey: .refundPolicyDisclosure)
        try container.encode(self.refundRefusalExplanation, forKey: .refundRefusalExplanation)
        try container.encode(self.serviceDate, forKey: .serviceDate)
        try container.encode(self.uncategorizedAttachment, forKey: .uncategorizedAttachment)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessActivityLog = "access_activity_log"
        case billingAddress = "billing_address"
        case cancellationPolicyAttachment = "cancellation_policy_attachment"
        case cancellationPolicyDisclosure = "cancellation_policy_disclosure"
        case customerCommunicationAttachment = "customer_communication_attachment"
        case customerEmailAddress = "customer_email_address"
        case customerName = "customer_name"
        case documents
        case notes
        case productDescription = "product_description"
        case refundPolicyAttachment = "refund_policy_attachment"
        case refundPolicyDisclosure = "refund_policy_disclosure"
        case refundRefusalExplanation = "refund_refusal_explanation"
        case serviceDate = "service_date"
        case uncategorizedAttachment = "uncategorized_attachment"
    }
}
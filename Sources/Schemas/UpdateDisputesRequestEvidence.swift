import Foundation

/// The evidence packet to send to the processor. Only the fields you provide are changed.
public struct UpdateDisputesRequestEvidence: Codable, Hashable, Sendable {
    /// Log of the customer's access to the product, such as sign-in or download activity.
    public let accessActivityLog: Nullable<String>?
    /// The billing address the customer provided at checkout.
    public let billingAddress: Nullable<String>?
    /// The cancellation policy document. Defaults to the account's cancellation policy, then its terms of service, when not set.
    public let cancellationPolicyAttachment: Nullable<UpdateDisputesRequestEvidenceCancellationPolicyAttachment>?
    /// How the cancellation policy was shown to the customer before purchase.
    public let cancellationPolicyDisclosure: Nullable<String>?
    /// Correspondence with the customer, or proof they used the product.
    public let customerCommunicationAttachment: Nullable<UpdateDisputesRequestEvidenceCustomerCommunicationAttachment>?
    /// The email address the customer used at checkout.
    public let customerEmailAddress: Nullable<String>?
    /// The customer's name as given at checkout.
    public let customerName: Nullable<String>?
    /// The full set of evidence documents the dispute should carry, beyond the four fixed evidence slots. Replaces all previously uploaded documents; an empty list removes them all. Send up to 10, 10MB each and 25MB in total. Accepted content types: application/pdf, application/json, image/jpeg, image/png, image/webp — any other type is rejected. Upload files through `POST /files` and reference them by `id`, or send the files as multipart file parts to upload and attach in one call. Policy documents (`return_policy`, `shipping_policy`, `cancellation_policy`, `terms_of_service`) default from the account's own documents; uploading one here replaces the account copy for this dispute, and a `cancellation_policy` or `return_policy` upload also takes precedence over the matching fixed evidence slot.
    public let documents: [UpdateDisputesRequestEvidenceDocumentsItem]?
    /// Any additional context for the processor reviewing the dispute.
    public let notes: Nullable<String>?
    /// What the customer purchased, in the seller's own words.
    public let productDescription: Nullable<String>?
    /// The refund policy document. Defaults to the account's return policy when not set.
    public let refundPolicyAttachment: Nullable<UpdateDisputesRequestEvidenceRefundPolicyAttachment>?
    /// How the refund policy was shown to the customer before purchase.
    public let refundPolicyDisclosure: Nullable<String>?
    /// Why a refund was refused, when one was requested and denied.
    public let refundRefusalExplanation: Nullable<String>?
    /// When the product or service was delivered.
    public let serviceDate: Nullable<String>?
    /// Supporting evidence that does not fit the other categories.
    public let uncategorizedAttachment: Nullable<UpdateDisputesRequestEvidenceUncategorizedAttachment>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessActivityLog: Nullable<String>? = nil,
        billingAddress: Nullable<String>? = nil,
        cancellationPolicyAttachment: Nullable<UpdateDisputesRequestEvidenceCancellationPolicyAttachment>? = nil,
        cancellationPolicyDisclosure: Nullable<String>? = nil,
        customerCommunicationAttachment: Nullable<UpdateDisputesRequestEvidenceCustomerCommunicationAttachment>? = nil,
        customerEmailAddress: Nullable<String>? = nil,
        customerName: Nullable<String>? = nil,
        documents: [UpdateDisputesRequestEvidenceDocumentsItem]? = nil,
        notes: Nullable<String>? = nil,
        productDescription: Nullable<String>? = nil,
        refundPolicyAttachment: Nullable<UpdateDisputesRequestEvidenceRefundPolicyAttachment>? = nil,
        refundPolicyDisclosure: Nullable<String>? = nil,
        refundRefusalExplanation: Nullable<String>? = nil,
        serviceDate: Nullable<String>? = nil,
        uncategorizedAttachment: Nullable<UpdateDisputesRequestEvidenceUncategorizedAttachment>? = nil,
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
        self.accessActivityLog = try container.decodeNullableIfPresent(String.self, forKey: .accessActivityLog)
        self.billingAddress = try container.decodeNullableIfPresent(String.self, forKey: .billingAddress)
        self.cancellationPolicyAttachment = try container.decodeNullableIfPresent(UpdateDisputesRequestEvidenceCancellationPolicyAttachment.self, forKey: .cancellationPolicyAttachment)
        self.cancellationPolicyDisclosure = try container.decodeNullableIfPresent(String.self, forKey: .cancellationPolicyDisclosure)
        self.customerCommunicationAttachment = try container.decodeNullableIfPresent(UpdateDisputesRequestEvidenceCustomerCommunicationAttachment.self, forKey: .customerCommunicationAttachment)
        self.customerEmailAddress = try container.decodeNullableIfPresent(String.self, forKey: .customerEmailAddress)
        self.customerName = try container.decodeNullableIfPresent(String.self, forKey: .customerName)
        self.documents = try container.decodeIfPresent([UpdateDisputesRequestEvidenceDocumentsItem].self, forKey: .documents)
        self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
        self.productDescription = try container.decodeNullableIfPresent(String.self, forKey: .productDescription)
        self.refundPolicyAttachment = try container.decodeNullableIfPresent(UpdateDisputesRequestEvidenceRefundPolicyAttachment.self, forKey: .refundPolicyAttachment)
        self.refundPolicyDisclosure = try container.decodeNullableIfPresent(String.self, forKey: .refundPolicyDisclosure)
        self.refundRefusalExplanation = try container.decodeNullableIfPresent(String.self, forKey: .refundRefusalExplanation)
        self.serviceDate = try container.decodeNullableIfPresent(String.self, forKey: .serviceDate)
        self.uncategorizedAttachment = try container.decodeNullableIfPresent(UpdateDisputesRequestEvidenceUncategorizedAttachment.self, forKey: .uncategorizedAttachment)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accessActivityLog, forKey: .accessActivityLog)
        try container.encodeNullableIfPresent(self.billingAddress, forKey: .billingAddress)
        try container.encodeNullableIfPresent(self.cancellationPolicyAttachment, forKey: .cancellationPolicyAttachment)
        try container.encodeNullableIfPresent(self.cancellationPolicyDisclosure, forKey: .cancellationPolicyDisclosure)
        try container.encodeNullableIfPresent(self.customerCommunicationAttachment, forKey: .customerCommunicationAttachment)
        try container.encodeNullableIfPresent(self.customerEmailAddress, forKey: .customerEmailAddress)
        try container.encodeNullableIfPresent(self.customerName, forKey: .customerName)
        try container.encodeIfPresent(self.documents, forKey: .documents)
        try container.encodeNullableIfPresent(self.notes, forKey: .notes)
        try container.encodeNullableIfPresent(self.productDescription, forKey: .productDescription)
        try container.encodeNullableIfPresent(self.refundPolicyAttachment, forKey: .refundPolicyAttachment)
        try container.encodeNullableIfPresent(self.refundPolicyDisclosure, forKey: .refundPolicyDisclosure)
        try container.encodeNullableIfPresent(self.refundRefusalExplanation, forKey: .refundRefusalExplanation)
        try container.encodeNullableIfPresent(self.serviceDate, forKey: .serviceDate)
        try container.encodeNullableIfPresent(self.uncategorizedAttachment, forKey: .uncategorizedAttachment)
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
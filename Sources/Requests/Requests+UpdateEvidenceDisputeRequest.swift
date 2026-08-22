import Foundation

extension Requests {
    public struct UpdateEvidenceDisputeRequest: Codable, Hashable, Sendable {
        /// An IP access activity log showing the customer used the service.
        public let accessActivityLog: Nullable<String>?
        /// The billing address associated with the customer's payment method.
        public let billingAddress: Nullable<String>?
        /// A file upload containing the company's cancellation policy document.
        public let cancellationPolicyAttachment: Nullable<UpdateEvidenceDisputeRequestCancellationPolicyAttachment>?
        /// The company's cancellation policy text to submit as evidence.
        public let cancellationPolicyDisclosure: Nullable<String>?
        /// A file upload containing evidence of customer communication. Must be a JPEG, PNG, GIF, or PDF.
        public let customerCommunicationAttachment: Nullable<UpdateEvidenceDisputeRequestCustomerCommunicationAttachment>?
        /// The email address of the customer associated with the disputed payment.
        public let customerEmailAddress: Nullable<String>?
        /// The full name of the customer associated with the disputed payment.
        public let customerName: Nullable<String>?
        /// Additional notes or context to submit as part of the dispute evidence.
        public let notes: Nullable<String>?
        /// A description of the product or service that was provided to the customer.
        public let productDescription: Nullable<String>?
        /// A file upload containing the company's refund policy document.
        public let refundPolicyAttachment: Nullable<UpdateEvidenceDisputeRequestRefundPolicyAttachment>?
        /// The company's refund policy text to submit as evidence.
        public let refundPolicyDisclosure: Nullable<String>?
        /// An explanation of why the refund request was refused.
        public let refundRefusalExplanation: Nullable<String>?
        /// The date when the product or service was delivered to the customer.
        public let serviceDate: Nullable<String>?
        /// A file upload for evidence that does not fit into the other categories.
        public let uncategorizedAttachment: Nullable<UpdateEvidenceDisputeRequestUncategorizedAttachment>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accessActivityLog: Nullable<String>? = nil,
            billingAddress: Nullable<String>? = nil,
            cancellationPolicyAttachment: Nullable<UpdateEvidenceDisputeRequestCancellationPolicyAttachment>? = nil,
            cancellationPolicyDisclosure: Nullable<String>? = nil,
            customerCommunicationAttachment: Nullable<UpdateEvidenceDisputeRequestCustomerCommunicationAttachment>? = nil,
            customerEmailAddress: Nullable<String>? = nil,
            customerName: Nullable<String>? = nil,
            notes: Nullable<String>? = nil,
            productDescription: Nullable<String>? = nil,
            refundPolicyAttachment: Nullable<UpdateEvidenceDisputeRequestRefundPolicyAttachment>? = nil,
            refundPolicyDisclosure: Nullable<String>? = nil,
            refundRefusalExplanation: Nullable<String>? = nil,
            serviceDate: Nullable<String>? = nil,
            uncategorizedAttachment: Nullable<UpdateEvidenceDisputeRequestUncategorizedAttachment>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accessActivityLog = accessActivityLog
            self.billingAddress = billingAddress
            self.cancellationPolicyAttachment = cancellationPolicyAttachment
            self.cancellationPolicyDisclosure = cancellationPolicyDisclosure
            self.customerCommunicationAttachment = customerCommunicationAttachment
            self.customerEmailAddress = customerEmailAddress
            self.customerName = customerName
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
            self.cancellationPolicyAttachment = try container.decodeNullableIfPresent(UpdateEvidenceDisputeRequestCancellationPolicyAttachment.self, forKey: .cancellationPolicyAttachment)
            self.cancellationPolicyDisclosure = try container.decodeNullableIfPresent(String.self, forKey: .cancellationPolicyDisclosure)
            self.customerCommunicationAttachment = try container.decodeNullableIfPresent(UpdateEvidenceDisputeRequestCustomerCommunicationAttachment.self, forKey: .customerCommunicationAttachment)
            self.customerEmailAddress = try container.decodeNullableIfPresent(String.self, forKey: .customerEmailAddress)
            self.customerName = try container.decodeNullableIfPresent(String.self, forKey: .customerName)
            self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
            self.productDescription = try container.decodeNullableIfPresent(String.self, forKey: .productDescription)
            self.refundPolicyAttachment = try container.decodeNullableIfPresent(UpdateEvidenceDisputeRequestRefundPolicyAttachment.self, forKey: .refundPolicyAttachment)
            self.refundPolicyDisclosure = try container.decodeNullableIfPresent(String.self, forKey: .refundPolicyDisclosure)
            self.refundRefusalExplanation = try container.decodeNullableIfPresent(String.self, forKey: .refundRefusalExplanation)
            self.serviceDate = try container.decodeNullableIfPresent(String.self, forKey: .serviceDate)
            self.uncategorizedAttachment = try container.decodeNullableIfPresent(UpdateEvidenceDisputeRequestUncategorizedAttachment.self, forKey: .uncategorizedAttachment)
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
            case notes
            case productDescription = "product_description"
            case refundPolicyAttachment = "refund_policy_attachment"
            case refundPolicyDisclosure = "refund_policy_disclosure"
            case refundRefusalExplanation = "refund_refusal_explanation"
            case serviceDate = "service_date"
            case uncategorizedAttachment = "uncategorized_attachment"
        }
    }
}
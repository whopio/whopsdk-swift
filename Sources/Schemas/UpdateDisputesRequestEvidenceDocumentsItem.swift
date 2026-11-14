import Foundation

public struct UpdateDisputesRequestEvidenceDocumentsItem: Codable, Hashable, Sendable {
    /// The ID returned by a direct upload.
    public let directUploadId: String?
    /// What this document proves. `return_policy`, `cancellation_policy` and `terms_of_service` are the seller's policy documents. A policy document replaces the account's copy for this dispute. `return_policy`, `cancellation_policy` and `customer_communication` also replace the matching fixed evidence slot. `shipping_policy` is the seller's shipping terms. `customer_communication` is correspondence with the buyer, such as a support thread or chat log. `product_image` is a photo of the product or service the buyer received. `physical_fulfillment` is proof that a physical order shipped and arrived. `digital_fulfillment` is proof that the buyer accessed a digital product. `customer_order_history` is the buyer's past orders with this seller. `prior_transactions` is the buyer's payment history across the platform, for a fraud defense. `customer_session` is checkout data, such as IP address, device fingerprint, AVS and CVV results, and the 3D Secure result. `subscription` is membership lifecycle evidence, such as renewals, cancellation and reminders sent. `complete_evidence` is the seller's whole response as one PDF of at most 19 pages, and it must be the only document. Whop sends a `complete_evidence` document to the processor in place of every other evidence field, attachment and document.
    public let documentType: UpdateDisputesRequestEvidenceDocumentsItemDocumentType
    /// The file itself. Send it as a file part to upload and attach in one call, or use `id`/`direct_upload_id` for a file that is already stored.
    public let file: String?
    /// The ID of a file already stored on Whop, prefixed `file_`.
    public let id: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        directUploadId: String? = nil,
        documentType: UpdateDisputesRequestEvidenceDocumentsItemDocumentType,
        file: String? = nil,
        id: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.directUploadId = directUploadId
        self.documentType = documentType
        self.file = file
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.directUploadId = try container.decodeIfPresent(String.self, forKey: .directUploadId)
        self.documentType = try container.decode(UpdateDisputesRequestEvidenceDocumentsItemDocumentType.self, forKey: .documentType)
        self.file = try container.decodeIfPresent(String.self, forKey: .file)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.directUploadId, forKey: .directUploadId)
        try container.encode(self.documentType, forKey: .documentType)
        try container.encodeIfPresent(self.file, forKey: .file)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case directUploadId = "direct_upload_id"
        case documentType = "document_type"
        case file
        case id
    }
}
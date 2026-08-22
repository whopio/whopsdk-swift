import Foundation

public struct UpdateVerificationsResponseRequiredDocumentsItem: Codable, Hashable, Sendable {
    /// Document slot key, such as `id_card_front`, `id_card_back`, or `selfie`.
    public let document: String?
    /// Why the previous submission was rejected, when the provider requested new documents or declined the verification.
    public let rejectionReason: Nullable<String>?
    /// `pending_upload` until the document has been relayed for review; `submitted` afterwards.
    public let status: UpdateVerificationsResponseRequiredDocumentsItemStatus?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        document: String? = nil,
        rejectionReason: Nullable<String>? = nil,
        status: UpdateVerificationsResponseRequiredDocumentsItemStatus? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.document = document
        self.rejectionReason = rejectionReason
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.document = try container.decodeIfPresent(String.self, forKey: .document)
        self.rejectionReason = try container.decodeNullableIfPresent(String.self, forKey: .rejectionReason)
        self.status = try container.decodeIfPresent(UpdateVerificationsResponseRequiredDocumentsItemStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.document, forKey: .document)
        try container.encodeNullableIfPresent(self.rejectionReason, forKey: .rejectionReason)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case document
        case rejectionReason = "rejection_reason"
        case status
    }
}
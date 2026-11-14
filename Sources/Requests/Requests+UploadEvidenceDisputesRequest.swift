import Foundation

extension Requests {
    public struct UploadEvidenceDisputesRequest: Codable, Hashable, Sendable {
        /// The full set of evidence documents the dispute should carry, beyond the four fixed evidence slots. Replaces all previously uploaded documents; an empty list removes them all. Send up to 10, 10MB each and 25MB in total. Accepted content types: application/pdf, application/json, image/jpeg, image/png, image/webp — any other type is rejected. Upload files through `POST /files` and reference them by `id`, or send the files as multipart file parts to upload and attach in one call. Policy documents (`return_policy`, `shipping_policy`, `cancellation_policy`, `terms_of_service`) default from the account's own documents; uploading one here replaces the account copy for this dispute, and a `cancellation_policy` or `return_policy` upload also takes precedence over the matching fixed evidence slot.
        public let documents: [UploadEvidenceDisputesRequestDocumentsItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            documents: [UploadEvidenceDisputesRequestDocumentsItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.documents = documents
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.documents = try container.decode([UploadEvidenceDisputesRequestDocumentsItem].self, forKey: .documents)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.documents, forKey: .documents)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case documents
        }
    }
}
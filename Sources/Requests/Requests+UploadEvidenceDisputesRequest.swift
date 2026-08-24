import Foundation

extension Requests {
    public struct UploadEvidenceDisputesRequest: Codable, Hashable, Sendable {
        /// The full set of evidence documents the dispute should carry. Replaces all previously uploaded documents.
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
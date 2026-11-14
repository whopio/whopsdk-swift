import Foundation

extension Requests {
    public struct CompleteFilesRequest: Codable, Hashable, Sendable {
        /// Every uploaded part, in order.
        public let multipartParts: [CompleteFilesRequestMultipartPartsItem]
        /// The ID of the multipart upload, returned by Create File.
        public let multipartUploadId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            multipartParts: [CompleteFilesRequestMultipartPartsItem],
            multipartUploadId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.multipartParts = multipartParts
            self.multipartUploadId = multipartUploadId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.multipartParts = try container.decode([CompleteFilesRequestMultipartPartsItem].self, forKey: .multipartParts)
            self.multipartUploadId = try container.decode(String.self, forKey: .multipartUploadId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.multipartParts, forKey: .multipartParts)
            try container.encode(self.multipartUploadId, forKey: .multipartUploadId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case multipartParts = "multipart_parts"
            case multipartUploadId = "multipart_upload_id"
        }
    }
}
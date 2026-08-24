import Foundation

extension Requests {
    public struct DenyResolutionCenterCasesRequest: Codable, Hashable, Sendable {
        /// Up to 3 evidence files, by existing file `id` or `direct_upload_id`.
        public let attachments: [DenyResolutionCenterCasesRequestAttachmentsItem]?
        /// Why the claim is being denied. Shown to the customer.
        public let message: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: [DenyResolutionCenterCasesRequestAttachmentsItem]? = nil,
            message: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.message = message
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeIfPresent([DenyResolutionCenterCasesRequestAttachmentsItem].self, forKey: .attachments)
            self.message = try container.decode(String.self, forKey: .message)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.attachments, forKey: .attachments)
            try container.encode(self.message, forKey: .message)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case message
        }
    }
}
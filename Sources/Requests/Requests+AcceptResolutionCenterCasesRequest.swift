import Foundation

extension Requests {
    public struct AcceptResolutionCenterCasesRequest: Codable, Hashable, Sendable {
        /// Up to 3 evidence files, by existing file `id` or `direct_upload_id`.
        public let attachments: [AcceptResolutionCenterCasesRequestAttachmentsItem]?
        /// An optional note to the customer, recorded on the case timeline.
        public let message: String?
        /// Whether to also terminate the customer's membership.
        public let terminateMembership: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: [AcceptResolutionCenterCasesRequestAttachmentsItem]? = nil,
            message: String? = nil,
            terminateMembership: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.message = message
            self.terminateMembership = terminateMembership
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeIfPresent([AcceptResolutionCenterCasesRequestAttachmentsItem].self, forKey: .attachments)
            self.message = try container.decodeIfPresent(String.self, forKey: .message)
            self.terminateMembership = try container.decodeIfPresent(Bool.self, forKey: .terminateMembership)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.attachments, forKey: .attachments)
            try container.encodeIfPresent(self.message, forKey: .message)
            try container.encodeIfPresent(self.terminateMembership, forKey: .terminateMembership)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case message
            case terminateMembership = "terminate_membership"
        }
    }
}
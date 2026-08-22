import Foundation

extension Requests {
    public struct CreateResolutionCenterCasesRequest: Codable, Hashable, Sendable {
        public let attachments: [CreateResolutionCenterCasesRequestAttachmentsItem]?
        /// The customer's explanation.
        public let message: String
        /// What went wrong. Uses the same vocabulary as `/disputes`.
        public let reason: CreateResolutionCenterCasesRequestReason
        /// The payment to open the case against (`pay_` tag).
        public let receiptId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attachments: [CreateResolutionCenterCasesRequestAttachmentsItem]? = nil,
            message: String,
            reason: CreateResolutionCenterCasesRequestReason,
            receiptId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attachments = attachments
            self.message = message
            self.reason = reason
            self.receiptId = receiptId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attachments = try container.decodeIfPresent([CreateResolutionCenterCasesRequestAttachmentsItem].self, forKey: .attachments)
            self.message = try container.decode(String.self, forKey: .message)
            self.reason = try container.decode(CreateResolutionCenterCasesRequestReason.self, forKey: .reason)
            self.receiptId = try container.decode(String.self, forKey: .receiptId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.attachments, forKey: .attachments)
            try container.encode(self.message, forKey: .message)
            try container.encode(self.reason, forKey: .reason)
            try container.encode(self.receiptId, forKey: .receiptId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attachments
            case message
            case reason
            case receiptId = "receipt_id"
        }
    }
}
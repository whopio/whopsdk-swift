import Foundation

extension Requests {
    public struct CancelMembershipsRequest: Codable, Hashable, Sendable {
        /// `true` stops auto-renewal and keeps access until the current billing period ends. Omit or `false` revokes access immediately.
        public let cancelAtPeriodEnd: Bool?
        /// The ID of the feedback option the customer picked as their reason for canceling, from the account's `feedback_options` preference. The membership records the option's label as the customer saw it and its category as `cancel_option`.
        public let feedbackOptionId: String?
        /// Free-form note recording why the membership was canceled.
        public let reason: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cancelAtPeriodEnd: Bool? = nil,
            feedbackOptionId: String? = nil,
            reason: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cancelAtPeriodEnd = cancelAtPeriodEnd
            self.feedbackOptionId = feedbackOptionId
            self.reason = reason
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cancelAtPeriodEnd = try container.decodeIfPresent(Bool.self, forKey: .cancelAtPeriodEnd)
            self.feedbackOptionId = try container.decodeIfPresent(String.self, forKey: .feedbackOptionId)
            self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
            try container.encodeIfPresent(self.feedbackOptionId, forKey: .feedbackOptionId)
            try container.encodeIfPresent(self.reason, forKey: .reason)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case cancelAtPeriodEnd = "cancel_at_period_end"
            case feedbackOptionId = "feedback_option_id"
            case reason
        }
    }
}
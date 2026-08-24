import Foundation

extension Requests {
    public struct CancelMembershipsRequest: Codable, Hashable, Sendable {
        /// `true` stops auto-renewal and keeps access until the current billing period ends. Omit or `false` revokes access immediately.
        public let cancelAtPeriodEnd: Bool?
        /// Free-form note recording why the membership was canceled.
        public let reason: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cancelAtPeriodEnd: Bool? = nil,
            reason: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cancelAtPeriodEnd = cancelAtPeriodEnd
            self.reason = reason
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cancelAtPeriodEnd = try container.decodeIfPresent(Bool.self, forKey: .cancelAtPeriodEnd)
            self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
            try container.encodeIfPresent(self.reason, forKey: .reason)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case cancelAtPeriodEnd = "cancel_at_period_end"
            case reason
        }
    }
}
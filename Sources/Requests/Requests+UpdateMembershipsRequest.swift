import Foundation

extension Requests {
    public struct UpdateMembershipsRequest: Codable, Hashable, Sendable {
        /// `true` cancels at the end of the current billing period (the customer keeps access until then); `false` reverses a pending cancellation.
        public let cancelAtPeriodEnd: Bool?
        /// Key-value pairs to merge into the membership's metadata. Pass an empty object to clear it.
        public let metadata: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cancelAtPeriodEnd: Bool? = nil,
            metadata: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cancelAtPeriodEnd = cancelAtPeriodEnd
            self.metadata = metadata
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cancelAtPeriodEnd = try container.decodeIfPresent(Bool.self, forKey: .cancelAtPeriodEnd)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case cancelAtPeriodEnd = "cancel_at_period_end"
            case metadata
        }
    }
}
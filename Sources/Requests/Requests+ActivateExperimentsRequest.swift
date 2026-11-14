import Foundation

extension Requests {
    public struct ActivateExperimentsRequest: Codable, Hashable, Sendable {
        /// Reporting window length in days. Omit to use the default. This does not automatically end the experiment.
        public let durationDays: Nullable<Int>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            durationDays: Nullable<Int>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.durationDays = durationDays
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.durationDays = try container.decodeNullableIfPresent(Int.self, forKey: .durationDays)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.durationDays, forKey: .durationDays)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case durationDays = "duration_days"
        }
    }
}
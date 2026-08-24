import Foundation

extension Requests {
    public struct UpdateDisputesRequest: Codable, Hashable, Sendable {
        /// The evidence packet to send to the processor. Only the fields you provide are changed.
        public let evidence: UpdateDisputesRequestEvidence?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            evidence: UpdateDisputesRequestEvidence? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.evidence = evidence
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.evidence = try container.decodeIfPresent(UpdateDisputesRequestEvidence.self, forKey: .evidence)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.evidence, forKey: .evidence)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case evidence
        }
    }
}
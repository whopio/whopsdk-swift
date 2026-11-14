import Foundation

extension Requests {
    public struct EndExperimentsRequest: Codable, Hashable, Sendable {
        /// What you learned and why you chose this outcome. Required.
        public let findings: String
        /// The treatment that won. Setting it rolls that arm out: every later evaluation returns it to every caller, ignoring targeting and allocation, and exposures stop being recorded. Omit it when control won — an ended experiment with no winning arm evaluates to `control` for everyone, so ending again without one also reverts a rollout recorded by mistake. Not accepted on feature flags, which evaluate to disabled once ended.
        public let winningArm: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            findings: String,
            winningArm: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.findings = findings
            self.winningArm = winningArm
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.findings = try container.decode(String.self, forKey: .findings)
            self.winningArm = try container.decodeNullableIfPresent(String.self, forKey: .winningArm)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.findings, forKey: .findings)
            try container.encodeNullableIfPresent(self.winningArm, forKey: .winningArm)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case findings
            case winningArm = "winning_arm"
        }
    }
}
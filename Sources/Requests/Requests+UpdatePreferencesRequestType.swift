import Foundation

extension Requests {
    public struct UpdatePreferencesRequestType: Codable, Hashable, Sendable {
        /// Whether the user has dismissed the first-time bounty worker onboarding. Set to `false` to show it again.
        public let bountyWorkerOnboardingDismissed: Bool?
        /// Whether investigation mode is enabled for the user. Only meaningful for staff users with investigation access.
        public let investigationEnabled: Bool?
        /// Records the user's acceptance of Whop's terms and policies. Only `true` is accepted — the server stamps `terms_accepted_at` and acceptance cannot be withdrawn here.
        public let termsAccepted: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            bountyWorkerOnboardingDismissed: Bool? = nil,
            investigationEnabled: Bool? = nil,
            termsAccepted: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.bountyWorkerOnboardingDismissed = bountyWorkerOnboardingDismissed
            self.investigationEnabled = investigationEnabled
            self.termsAccepted = termsAccepted
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.bountyWorkerOnboardingDismissed = try container.decodeIfPresent(Bool.self, forKey: .bountyWorkerOnboardingDismissed)
            self.investigationEnabled = try container.decodeIfPresent(Bool.self, forKey: .investigationEnabled)
            self.termsAccepted = try container.decodeIfPresent(Bool.self, forKey: .termsAccepted)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.bountyWorkerOnboardingDismissed, forKey: .bountyWorkerOnboardingDismissed)
            try container.encodeIfPresent(self.investigationEnabled, forKey: .investigationEnabled)
            try container.encodeIfPresent(self.termsAccepted, forKey: .termsAccepted)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case bountyWorkerOnboardingDismissed = "bounty_worker_onboarding_dismissed"
            case investigationEnabled = "investigation_enabled"
            case termsAccepted = "terms_accepted"
        }
    }
}
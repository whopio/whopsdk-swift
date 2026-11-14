import Foundation

public struct UserPreferences: Codable, Hashable, Sendable {
    /// Whether the user has dismissed the first-time bounty worker onboarding. Set to `false` to show it again.
    public let bountyWorkerOnboardingDismissed: Bool
    /// Whether incoming funds, including pending balance, are automatically moved to the user's personal cards balance. `false` when the user has no cards balance.
    public let cardsAutoTopUp: Bool
    /// Whether the user has accepted Whop's terms and policies. `false` until recorded via `PATCH` with `terms_accepted: true`.
    public let termsAccepted: Bool
    /// When the user most recently accepted Whop's terms and policies, as an ISO 8601 timestamp. `null` until accepted.
    public let termsAcceptedAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bountyWorkerOnboardingDismissed: Bool,
        cardsAutoTopUp: Bool,
        termsAccepted: Bool,
        termsAcceptedAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bountyWorkerOnboardingDismissed = bountyWorkerOnboardingDismissed
        self.cardsAutoTopUp = cardsAutoTopUp
        self.termsAccepted = termsAccepted
        self.termsAcceptedAt = termsAcceptedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bountyWorkerOnboardingDismissed = try container.decode(Bool.self, forKey: .bountyWorkerOnboardingDismissed)
        self.cardsAutoTopUp = try container.decode(Bool.self, forKey: .cardsAutoTopUp)
        self.termsAccepted = try container.decode(Bool.self, forKey: .termsAccepted)
        self.termsAcceptedAt = try container.decode(Nullable<String>.self, forKey: .termsAcceptedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bountyWorkerOnboardingDismissed, forKey: .bountyWorkerOnboardingDismissed)
        try container.encode(self.cardsAutoTopUp, forKey: .cardsAutoTopUp)
        try container.encode(self.termsAccepted, forKey: .termsAccepted)
        try container.encode(self.termsAcceptedAt, forKey: .termsAcceptedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bountyWorkerOnboardingDismissed = "bounty_worker_onboarding_dismissed"
        case cardsAutoTopUp = "cards_auto_top_up"
        case termsAccepted = "terms_accepted"
        case termsAcceptedAt = "terms_accepted_at"
    }
}
import Foundation

public struct FinancingProvider: Codable, Hashable, Sendable {
    /// The merchant action that turns this provider on when `status` is `needs_action`; `null` otherwise.
    public let action: Nullable<FinancingProviderAction>
    public let currencies: [FinancingProviderCurrency]
    /// The dispute rates behind a `dispute_rate_near_limit` or `dispute_rate_exceeded` reason; `null` for every other reason.
    public let details: Nullable<FinancingProviderDetails>
    /// The financing provider.
    public let provider: FinancingProviderProvider
    /// When the provider received or decided on this account, as an ISO 8601 timestamp. Set only for providers that review merchants themselves (Splitit); `null` otherwise.
    public let providerReviewedAt: Nullable<String>
    /// Why the provider has this status, when known. On `active` it is `dispute_rate_near_limit` when the provider is close to being turned off. On `inactive` it names what keeps it off, including `not_included` when the account's approval doesn't cover it, `turned_off` when it was switched off after setup, `setup_failed`, and `declined` when the provider turned the account down without a reason Whop recognizes. More reasons may be added.
    public let reason: Nullable<FinancingProviderReason>
    /// Where the provider stands for this account: `eligible` (included if the account applies), `needs_action` (waiting on the merchant, see `action`), `in_review` (waiting on Whop's review, or on the provider's own when `reason` is `provider_review`), `active` (offered at checkout), or `inactive` (not offered, see `reason`).
    public let status: FinancingProviderStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: Nullable<FinancingProviderAction>,
        currencies: [FinancingProviderCurrency],
        details: Nullable<FinancingProviderDetails>,
        provider: FinancingProviderProvider,
        providerReviewedAt: Nullable<String>,
        reason: Nullable<FinancingProviderReason>,
        status: FinancingProviderStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.currencies = currencies
        self.details = details
        self.provider = provider
        self.providerReviewedAt = providerReviewedAt
        self.reason = reason
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(Nullable<FinancingProviderAction>.self, forKey: .action)
        self.currencies = try container.decode([FinancingProviderCurrency].self, forKey: .currencies)
        self.details = try container.decode(Nullable<FinancingProviderDetails>.self, forKey: .details)
        self.provider = try container.decode(FinancingProviderProvider.self, forKey: .provider)
        self.providerReviewedAt = try container.decode(Nullable<String>.self, forKey: .providerReviewedAt)
        self.reason = try container.decode(Nullable<FinancingProviderReason>.self, forKey: .reason)
        self.status = try container.decode(FinancingProviderStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.currencies, forKey: .currencies)
        try container.encode(self.details, forKey: .details)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.providerReviewedAt, forKey: .providerReviewedAt)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case currencies
        case details
        case provider
        case providerReviewedAt = "provider_reviewed_at"
        case reason
        case status
    }
}
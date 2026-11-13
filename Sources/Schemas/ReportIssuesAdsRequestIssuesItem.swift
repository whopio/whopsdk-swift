import Foundation

public struct ReportIssuesAdsRequestIssuesItem: Codable, Hashable, Sendable {
    /// The policy a `content_rejected` ad broke, which the account reads in its message. Send it only with `content_rejected`.
    public let policy: ReportIssuesAdsRequestIssuesItemPolicy?
    /// Why the object can't deliver yet. `content_rejected`, `landing_page_rejected`, and `creative_unsupported` go on ads, `targeting_rejected` on ad groups, and `in_review` on either.
    public let reason: ReportIssuesAdsRequestIssuesItemReason
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        policy: ReportIssuesAdsRequestIssuesItemPolicy? = nil,
        reason: ReportIssuesAdsRequestIssuesItemReason,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.policy = policy
        self.reason = reason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.policy = try container.decodeIfPresent(ReportIssuesAdsRequestIssuesItemPolicy.self, forKey: .policy)
        self.reason = try container.decode(ReportIssuesAdsRequestIssuesItemReason.self, forKey: .reason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.policy, forKey: .policy)
        try container.encode(self.reason, forKey: .reason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case policy
        case reason
    }
}
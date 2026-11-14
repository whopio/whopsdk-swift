import Foundation

public struct LeaderboardPartnersResponse: Codable, Hashable, Sendable {
    /// The top 10 referrers by total earnings, best first.
    public let leaders: [LeaderboardPartnersResponseLeadersItem]
    /// The caller's own standing; null when the caller has no referral earnings.
    public let me: Nullable<LeaderboardPartnersResponseMe>
    /// The referrers ranked within five places of the caller, including the caller, best first. Empty when the caller has no referral earnings or is anonymous.
    public let nearby: [LeaderboardPartnersResponseNearbyItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        leaders: [LeaderboardPartnersResponseLeadersItem],
        me: Nullable<LeaderboardPartnersResponseMe>,
        nearby: [LeaderboardPartnersResponseNearbyItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.leaders = leaders
        self.me = me
        self.nearby = nearby
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leaders = try container.decode([LeaderboardPartnersResponseLeadersItem].self, forKey: .leaders)
        self.me = try container.decode(Nullable<LeaderboardPartnersResponseMe>.self, forKey: .me)
        self.nearby = try container.decode([LeaderboardPartnersResponseNearbyItem].self, forKey: .nearby)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.leaders, forKey: .leaders)
        try container.encode(self.me, forKey: .me)
        try container.encode(self.nearby, forKey: .nearby)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case leaders
        case me
        case nearby
    }
}
import Foundation

public struct AdContentReview: Codable, Hashable, Sendable {
    public let networks: [AdContentReviewNetwork]
    /// `reviewed` once Whop content review finishes, `in_review` while it runs, `not_reviewed` when it never ran.
    public let status: AdContentReviewStatus
    public let tags: [AdContentReviewTag]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        networks: [AdContentReviewNetwork],
        status: AdContentReviewStatus,
        tags: [AdContentReviewTag],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.networks = networks
        self.status = status
        self.tags = tags
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.networks = try container.decode([AdContentReviewNetwork].self, forKey: .networks)
        self.status = try container.decode(AdContentReviewStatus.self, forKey: .status)
        self.tags = try container.decode([AdContentReviewTag].self, forKey: .tags)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.networks, forKey: .networks)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.tags, forKey: .tags)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case networks
        case status
        case tags
    }
}
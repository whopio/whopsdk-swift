import Foundation

/// How many of the matching disputes are in each status. Every status is present, including those with a count of zero.
public struct SummaryDisputesResponseGroupsStatus: Codable, Hashable, Sendable {
    public let closed: Int
    public let lost: Int
    public let needsResponse: Int
    public let underReview: Int
    public let won: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        closed: Int,
        lost: Int,
        needsResponse: Int,
        underReview: Int,
        won: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.closed = closed
        self.lost = lost
        self.needsResponse = needsResponse
        self.underReview = underReview
        self.won = won
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.closed = try container.decode(Int.self, forKey: .closed)
        self.lost = try container.decode(Int.self, forKey: .lost)
        self.needsResponse = try container.decode(Int.self, forKey: .needsResponse)
        self.underReview = try container.decode(Int.self, forKey: .underReview)
        self.won = try container.decode(Int.self, forKey: .won)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.closed, forKey: .closed)
        try container.encode(self.lost, forKey: .lost)
        try container.encode(self.needsResponse, forKey: .needsResponse)
        try container.encode(self.underReview, forKey: .underReview)
        try container.encode(self.won, forKey: .won)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case closed
        case lost
        case needsResponse = "needs_response"
        case underReview = "under_review"
        case won
    }
}
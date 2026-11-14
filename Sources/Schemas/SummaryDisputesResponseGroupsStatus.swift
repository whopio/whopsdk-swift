import Foundation

/// How many of the matching disputes are in each status. Every status is present, including those with a count of zero.
public struct SummaryDisputesResponseGroupsStatus: Codable, Hashable, Sendable {
    public let generatingResponse: Int
    public let lost: Int
    public let needsResponse: Int
    public let prevented: Int
    public let underReview: Int
    public let warningClosed: Int
    public let warningNeedsResponse: Int
    public let warningUnderReview: Int
    public let won: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        generatingResponse: Int,
        lost: Int,
        needsResponse: Int,
        prevented: Int,
        underReview: Int,
        warningClosed: Int,
        warningNeedsResponse: Int,
        warningUnderReview: Int,
        won: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.generatingResponse = generatingResponse
        self.lost = lost
        self.needsResponse = needsResponse
        self.prevented = prevented
        self.underReview = underReview
        self.warningClosed = warningClosed
        self.warningNeedsResponse = warningNeedsResponse
        self.warningUnderReview = warningUnderReview
        self.won = won
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.generatingResponse = try container.decode(Int.self, forKey: .generatingResponse)
        self.lost = try container.decode(Int.self, forKey: .lost)
        self.needsResponse = try container.decode(Int.self, forKey: .needsResponse)
        self.prevented = try container.decode(Int.self, forKey: .prevented)
        self.underReview = try container.decode(Int.self, forKey: .underReview)
        self.warningClosed = try container.decode(Int.self, forKey: .warningClosed)
        self.warningNeedsResponse = try container.decode(Int.self, forKey: .warningNeedsResponse)
        self.warningUnderReview = try container.decode(Int.self, forKey: .warningUnderReview)
        self.won = try container.decode(Int.self, forKey: .won)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.generatingResponse, forKey: .generatingResponse)
        try container.encode(self.lost, forKey: .lost)
        try container.encode(self.needsResponse, forKey: .needsResponse)
        try container.encode(self.prevented, forKey: .prevented)
        try container.encode(self.underReview, forKey: .underReview)
        try container.encode(self.warningClosed, forKey: .warningClosed)
        try container.encode(self.warningNeedsResponse, forKey: .warningNeedsResponse)
        try container.encode(self.warningUnderReview, forKey: .warningUnderReview)
        try container.encode(self.won, forKey: .won)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case generatingResponse = "generating_response"
        case lost
        case needsResponse = "needs_response"
        case prevented
        case underReview = "under_review"
        case warningClosed = "warning_closed"
        case warningNeedsResponse = "warning_needs_response"
        case warningUnderReview = "warning_under_review"
        case won
    }
}
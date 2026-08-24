import Foundation

/// A privately accessible bounty.
public struct WorkforceBounty: Codable, Hashable, Sendable {
    /// The underlying bounty implementation type.
    public let bountyType: BountyTypes
    /// The datetime the bounty was created.
    public let createdAt: Date
    /// The currency used for the bounty funds.
    public let currency: Currencies
    /// The description of the bounty.
    public let description: String
    /// The unique identifier for the bounty.
    public let id: String
    /// The current lifecycle status of the bounty.
    public let status: Statuses
    /// The title of the bounty.
    public let title: String
    /// The total amount currently funded in the bounty pool for payout.
    public let totalAvailable: Double
    /// The total amount paid out for this bounty.
    public let totalPaid: Double
    /// The datetime the bounty was last updated.
    public let updatedAt: Date
    /// The number of watcher votes required before the submission can resolve.
    public let voteThreshold: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bountyType: BountyTypes,
        createdAt: Date,
        currency: Currencies,
        description: String,
        id: String,
        status: Statuses,
        title: String,
        totalAvailable: Double,
        totalPaid: Double,
        updatedAt: Date,
        voteThreshold: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bountyType = bountyType
        self.createdAt = createdAt
        self.currency = currency
        self.description = description
        self.id = id
        self.status = status
        self.title = title
        self.totalAvailable = totalAvailable
        self.totalPaid = totalPaid
        self.updatedAt = updatedAt
        self.voteThreshold = voteThreshold
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bountyType = try container.decode(BountyTypes.self, forKey: .bountyType)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.description = try container.decode(String.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.status = try container.decode(Statuses.self, forKey: .status)
        self.title = try container.decode(String.self, forKey: .title)
        self.totalAvailable = try container.decode(Double.self, forKey: .totalAvailable)
        self.totalPaid = try container.decode(Double.self, forKey: .totalPaid)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.voteThreshold = try container.decode(Int.self, forKey: .voteThreshold)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bountyType, forKey: .bountyType)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.totalAvailable, forKey: .totalAvailable)
        try container.encode(self.totalPaid, forKey: .totalPaid)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.voteThreshold, forKey: .voteThreshold)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bountyType = "bounty_type"
        case createdAt = "created_at"
        case currency
        case description
        case id
        case status
        case title
        case totalAvailable = "total_available"
        case totalPaid = "total_paid"
        case updatedAt = "updated_at"
        case voteThreshold = "vote_threshold"
    }
}
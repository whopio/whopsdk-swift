import Foundation

public struct FinancingApplication: Codable, Hashable, Sendable {
    /// The ID of the merchant account applying for payment financing, starting with biz_.
    public let accountId: String
    /// When the application was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Public review feedback when more information is requested or the application is denied. Internal notes are never included.
    public let feedback: Nullable<String>?
    /// The financing application ID, starting with inrq_.
    public let id: String
    public let requirements: [FinancingRequirement]?
    /// The application's review state. Approval does not by itself indicate that financing payment methods are enabled on the account.
    public let status: FinancingApplicationStatus
    /// Current terms to present before submitting. Present on individual application responses.
    public let terms: FinancingTerms?
    /// When the application was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        createdAt: String,
        feedback: Nullable<String>? = nil,
        id: String,
        requirements: [FinancingRequirement]? = nil,
        status: FinancingApplicationStatus,
        terms: FinancingTerms? = nil,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.feedback = feedback
        self.id = id
        self.requirements = requirements
        self.status = status
        self.terms = terms
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.feedback = try container.decodeNullableIfPresent(String.self, forKey: .feedback)
        self.id = try container.decode(String.self, forKey: .id)
        self.requirements = try container.decodeIfPresent([FinancingRequirement].self, forKey: .requirements)
        self.status = try container.decode(FinancingApplicationStatus.self, forKey: .status)
        self.terms = try container.decodeIfPresent(FinancingTerms.self, forKey: .terms)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.feedback, forKey: .feedback)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.terms, forKey: .terms)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case feedback
        case id
        case requirements
        case status
        case terms
        case updatedAt = "updated_at"
    }
}
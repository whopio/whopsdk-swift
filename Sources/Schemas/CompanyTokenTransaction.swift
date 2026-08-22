import Foundation

/// A token transaction records a credit or debit to a member's token balance within a company, including transfers between members.
public struct CompanyTokenTransaction: Codable, Hashable, Sendable {
    /// The token amount for this transaction. Always a positive value regardless of transaction type.
    public let amount: Double
    /// The company whose token balance this transaction affects.
    public let company: CompanyTokenTransactionCompany
    /// The datetime the company token transaction was created.
    public let createdAt: Date
    /// Free-text description explaining the reason for this token transaction. Null if no description was provided.
    public let description: Nullable<String>
    /// The unique identifier for the company token transaction.
    public let id: String
    /// A unique key used to prevent duplicate transactions when retrying API requests. Null if no idempotency key was provided.
    public let idempotencyKey: Nullable<String>
    /// The ID of the corresponding transaction on the other side of a transfer. Null if this is not a transfer transaction.
    public let linkedTransactionId: Nullable<String>
    /// The member whose token balance was affected by this transaction.
    public let member: CompanyTokenTransactionMember
    /// The direction of this token transaction (add, subtract, or transfer).
    public let transactionType: CompanyTokenTransactionTypes
    /// The user whose token balance was affected by this transaction.
    public let user: CompanyTokenTransactionUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        company: CompanyTokenTransactionCompany,
        createdAt: Date,
        description: Nullable<String>,
        id: String,
        idempotencyKey: Nullable<String>,
        linkedTransactionId: Nullable<String>,
        member: CompanyTokenTransactionMember,
        transactionType: CompanyTokenTransactionTypes,
        user: CompanyTokenTransactionUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.company = company
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.idempotencyKey = idempotencyKey
        self.linkedTransactionId = linkedTransactionId
        self.member = member
        self.transactionType = transactionType
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.company = try container.decode(CompanyTokenTransactionCompany.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.idempotencyKey = try container.decode(Nullable<String>.self, forKey: .idempotencyKey)
        self.linkedTransactionId = try container.decode(Nullable<String>.self, forKey: .linkedTransactionId)
        self.member = try container.decode(CompanyTokenTransactionMember.self, forKey: .member)
        self.transactionType = try container.decode(CompanyTokenTransactionTypes.self, forKey: .transactionType)
        self.user = try container.decode(CompanyTokenTransactionUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.idempotencyKey, forKey: .idempotencyKey)
        try container.encode(self.linkedTransactionId, forKey: .linkedTransactionId)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.transactionType, forKey: .transactionType)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case company
        case createdAt = "created_at"
        case description
        case id
        case idempotencyKey = "idempotency_key"
        case linkedTransactionId = "linked_transaction_id"
        case member
        case transactionType = "transaction_type"
        case user
    }
}
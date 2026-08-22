import Foundation

/// A configured payout destination where a user receives earned funds, such as a bank account or digital wallet.
public struct PayoutMethod: Codable, Hashable, Sendable {
    /// A masked identifier for the payout destination, such as the last four digits of a bank account or an email address. Null if no reference is available.
    public let accountReference: Nullable<String>
    /// The company associated with this payout destination. Null if not linked to a specific company.
    public let company: Nullable<PayoutMethodCompany>
    /// The datetime the payout token was created.
    public let createdAt: Date
    /// The three-letter ISO currency code that payouts are delivered in for this destination.
    public let currency: String
    /// The payout destination configuration linked to this token. Null if not yet configured.
    public let destination: Nullable<PayoutMethodDestination>
    /// The unique identifier for the payout token.
    public let id: String
    /// The name of the bank or financial institution receiving payouts. Null if not applicable or not provided.
    public let institutionName: Nullable<String>
    /// Whether this is the default payout destination for the associated payout account.
    public let isDefault: Bool
    /// A user-defined label to help identify this payout destination. Not sent to the provider. Null if no nickname has been set.
    public let nickname: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountReference: Nullable<String>,
        company: Nullable<PayoutMethodCompany>,
        createdAt: Date,
        currency: String,
        destination: Nullable<PayoutMethodDestination>,
        id: String,
        institutionName: Nullable<String>,
        isDefault: Bool,
        nickname: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountReference = accountReference
        self.company = company
        self.createdAt = createdAt
        self.currency = currency
        self.destination = destination
        self.id = id
        self.institutionName = institutionName
        self.isDefault = isDefault
        self.nickname = nickname
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountReference = try container.decode(Nullable<String>.self, forKey: .accountReference)
        self.company = try container.decode(Nullable<PayoutMethodCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.destination = try container.decode(Nullable<PayoutMethodDestination>.self, forKey: .destination)
        self.id = try container.decode(String.self, forKey: .id)
        self.institutionName = try container.decode(Nullable<String>.self, forKey: .institutionName)
        self.isDefault = try container.decode(Bool.self, forKey: .isDefault)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountReference, forKey: .accountReference)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.destination, forKey: .destination)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.institutionName, forKey: .institutionName)
        try container.encode(self.isDefault, forKey: .isDefault)
        try container.encode(self.nickname, forKey: .nickname)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountReference = "account_reference"
        case company
        case createdAt = "created_at"
        case currency
        case destination
        case id
        case institutionName = "institution_name"
        case isDefault = "is_default"
        case nickname
    }
}
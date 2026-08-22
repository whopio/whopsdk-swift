import Foundation

public struct LedgerActivityResourceAccountReference: Codable, Hashable, Sendable {
    /// Masked account reference.
    public let accountReference: Nullable<String>
    /// Destination currency code.
    public let destinationCurrencyCode: Nullable<String>
    /// Payout method ID.
    public let id: String
    /// Payout institution name.
    public let institutionName: Nullable<String>
    /// Payout method nickname.
    public let nickname: Nullable<String>
    public let object: LedgerActivityResourceAccountReferenceObject
    /// Payout provider.
    public let provider: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountReference: Nullable<String>,
        destinationCurrencyCode: Nullable<String>,
        id: String,
        institutionName: Nullable<String>,
        nickname: Nullable<String>,
        object: LedgerActivityResourceAccountReferenceObject,
        provider: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountReference = accountReference
        self.destinationCurrencyCode = destinationCurrencyCode
        self.id = id
        self.institutionName = institutionName
        self.nickname = nickname
        self.object = object
        self.provider = provider
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountReference = try container.decode(Nullable<String>.self, forKey: .accountReference)
        self.destinationCurrencyCode = try container.decode(Nullable<String>.self, forKey: .destinationCurrencyCode)
        self.id = try container.decode(String.self, forKey: .id)
        self.institutionName = try container.decode(Nullable<String>.self, forKey: .institutionName)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.object = try container.decode(LedgerActivityResourceAccountReferenceObject.self, forKey: .object)
        self.provider = try container.decode(Nullable<String>.self, forKey: .provider)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountReference, forKey: .accountReference)
        try container.encode(self.destinationCurrencyCode, forKey: .destinationCurrencyCode)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.institutionName, forKey: .institutionName)
        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.provider, forKey: .provider)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountReference = "account_reference"
        case destinationCurrencyCode = "destination_currency_code"
        case id
        case institutionName = "institution_name"
        case nickname
        case object
        case provider
    }
}
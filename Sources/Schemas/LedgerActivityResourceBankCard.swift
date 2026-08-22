import Foundation

public struct LedgerActivityResourceBankCard: Codable, Hashable, Sendable {
    /// Card brand.
    public let brand: Nullable<String>
    /// Card expiration month.
    public let expMonth: Nullable<Int>
    /// Card expiration year.
    public let expYear: Nullable<Int>
    /// Last four digits of the card.
    public let last4: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        brand: Nullable<String>,
        expMonth: Nullable<Int>,
        expYear: Nullable<Int>,
        last4: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.brand = brand
        self.expMonth = expMonth
        self.expYear = expYear
        self.last4 = last4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decode(Nullable<String>.self, forKey: .brand)
        self.expMonth = try container.decode(Nullable<Int>.self, forKey: .expMonth)
        self.expYear = try container.decode(Nullable<Int>.self, forKey: .expYear)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.expMonth, forKey: .expMonth)
        try container.encode(self.expYear, forKey: .expYear)
        try container.encode(self.last4, forKey: .last4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case brand
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case last4
    }
}
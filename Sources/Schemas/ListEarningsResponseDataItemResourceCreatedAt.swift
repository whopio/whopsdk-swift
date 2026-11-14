import Foundation

public struct ListEarningsResponseDataItemResourceCreatedAt: Codable, Hashable, Sendable {
    public let createdAt: Date
    /// The referred partner business's own commission the share was paid on, prefixed `afpy_`.
    public let id: String
    /// Which income source that commission is on.
    public let incomeSource: ListEarningsResponseDataItemResourceCreatedAtIncomeSource
    public let object: ListEarningsResponseDataItemResourceCreatedAtObject
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        id: String,
        incomeSource: ListEarningsResponseDataItemResourceCreatedAtIncomeSource,
        object: ListEarningsResponseDataItemResourceCreatedAtObject,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.incomeSource = incomeSource
        self.object = object
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.incomeSource = try container.decode(ListEarningsResponseDataItemResourceCreatedAtIncomeSource.self, forKey: .incomeSource)
        self.object = try container.decode(ListEarningsResponseDataItemResourceCreatedAtObject.self, forKey: .object)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.incomeSource, forKey: .incomeSource)
        try container.encode(self.object, forKey: .object)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case incomeSource = "income_source"
        case object
    }
}
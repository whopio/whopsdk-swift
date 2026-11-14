import Foundation

public struct UpdateFinancingApplicationsRequestAnswersItem: Codable, Hashable, Sendable {
    /// Complete replacement set of file IDs for this requirement, prefixed `file_`. Upload documents through the Files API first: new files must belong to the caller, be ready and private, and satisfy the requirement's formats and 20 MB limit. An empty array removes all files.
    public let fileIds: [String]?
    /// Price answer, such as `max_product_price`. `null` clears the price.
    public let money: Nullable<UpdateFinancingApplicationsRequestAnswersItemMoney>?
    /// ID of a merchant requirement returned on this application.
    public let requirementId: String
    /// Text answers. Use `money` instead for `max_product_price`. An empty array clears the answer.
    public let values: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fileIds: [String]? = nil,
        money: Nullable<UpdateFinancingApplicationsRequestAnswersItemMoney>? = nil,
        requirementId: String,
        values: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fileIds = fileIds
        self.money = money
        self.requirementId = requirementId
        self.values = values
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fileIds = try container.decodeIfPresent([String].self, forKey: .fileIds)
        self.money = try container.decodeNullableIfPresent(UpdateFinancingApplicationsRequestAnswersItemMoney.self, forKey: .money)
        self.requirementId = try container.decode(String.self, forKey: .requirementId)
        self.values = try container.decodeIfPresent([String].self, forKey: .values)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fileIds, forKey: .fileIds)
        try container.encodeNullableIfPresent(self.money, forKey: .money)
        try container.encode(self.requirementId, forKey: .requirementId)
        try container.encodeIfPresent(self.values, forKey: .values)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fileIds = "file_ids"
        case money
        case requirementId = "requirement_id"
        case values
    }
}
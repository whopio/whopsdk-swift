import Foundation

public struct RetrieveBreakdownResponseActivityFilters: Codable, Hashable, Sendable {
    public let direction: RetrieveBreakdownResponseActivityFiltersDirection
    public let lineTypes: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        direction: RetrieveBreakdownResponseActivityFiltersDirection,
        lineTypes: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.direction = direction
        self.lineTypes = lineTypes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.direction = try container.decode(RetrieveBreakdownResponseActivityFiltersDirection.self, forKey: .direction)
        self.lineTypes = try container.decode([String].self, forKey: .lineTypes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.direction, forKey: .direction)
        try container.encode(self.lineTypes, forKey: .lineTypes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case direction
        case lineTypes = "line_types"
    }
}
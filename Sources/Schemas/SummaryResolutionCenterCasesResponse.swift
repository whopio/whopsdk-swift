import Foundation

public struct SummaryResolutionCenterCasesResponse: Codable, Hashable, Sendable {
    /// One entry per requested breakdown, keyed by the field it groups on. A field you did not ask for is absent.
    public let groups: SummaryResolutionCenterCasesResponseGroups
    /// How many cases match the filters.
    public let total: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        groups: SummaryResolutionCenterCasesResponseGroups,
        total: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.groups = groups
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.groups = try container.decode(SummaryResolutionCenterCasesResponseGroups.self, forKey: .groups)
        self.total = try container.decode(Int.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.groups, forKey: .groups)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case groups
        case total
    }
}
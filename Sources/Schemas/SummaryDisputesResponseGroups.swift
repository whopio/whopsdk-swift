import Foundation

/// One entry per requested breakdown, keyed by the field it groups on. A field you did not ask for is absent.
public struct SummaryDisputesResponseGroups: Codable, Hashable, Sendable {
    /// How many of the matching disputes are in each currency, keyed by three-letter ISO code. Only currencies with at least one dispute are present.
    public let currency: [String: Int]?
    /// How many of the matching disputes are in each status. Every status is present, including those with a count of zero.
    public let status: SummaryDisputesResponseGroupsStatus?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: [String: Int]? = nil,
        status: SummaryDisputesResponseGroupsStatus? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decodeIfPresent([String: Int].self, forKey: .currency)
        self.status = try container.decodeIfPresent(SummaryDisputesResponseGroupsStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case status
    }
}
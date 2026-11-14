import Foundation

/// One entry per requested breakdown, keyed by the field it groups on. A field you did not ask for is absent.
public struct SummaryPaymentsResponseGroups: Codable, Hashable, Sendable {
    /// How many of the matching payments are in each currency, keyed by three-letter code. Only currencies with at least one payment are present.
    public let currency: [String: Int]?
    /// How many of the matching payments are in each substatus. Every substatus is present, including those with a count of zero.
    public let substatus: SummaryPaymentsResponseGroupsSubstatus?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: [String: Int]? = nil,
        substatus: SummaryPaymentsResponseGroupsSubstatus? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.substatus = substatus
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decodeIfPresent([String: Int].self, forKey: .currency)
        self.substatus = try container.decodeIfPresent(SummaryPaymentsResponseGroupsSubstatus.self, forKey: .substatus)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.substatus, forKey: .substatus)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case substatus
    }
}
import Foundation

public struct ListMethodsResponse: Codable, Hashable, Sendable {
    public let data: [ListMethodsResponseDataItem]
    /// The live per-speed payout caps for the account in the requested currency — the numbers a payout request is validated against at submit time, so clients can cap an amount input at a value the request will accept. Only present when include_limits is true.
    public let limits: ListMethodsResponseLimits?
    public let pageInfo: ListMethodsResponsePageInfo
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [ListMethodsResponseDataItem],
        limits: ListMethodsResponseLimits? = nil,
        pageInfo: ListMethodsResponsePageInfo,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.limits = limits
        self.pageInfo = pageInfo
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([ListMethodsResponseDataItem].self, forKey: .data)
        self.limits = try container.decodeIfPresent(ListMethodsResponseLimits.self, forKey: .limits)
        self.pageInfo = try container.decode(ListMethodsResponsePageInfo.self, forKey: .pageInfo)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encodeIfPresent(self.limits, forKey: .limits)
        try container.encode(self.pageInfo, forKey: .pageInfo)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case limits
        case pageInfo = "page_info"
    }
}
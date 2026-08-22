import Foundation

/// The connection type for WebhookLog.
public struct DeliveriesWebhookResponse: Codable, Hashable, Sendable {
    /// A list of nodes.
    public let data: [DeliveriesWebhookResponseDataItem]
    /// Information to aid in pagination.
    public let pageInfo: DeliveriesWebhookResponsePageInfo
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [DeliveriesWebhookResponseDataItem],
        pageInfo: DeliveriesWebhookResponsePageInfo,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.pageInfo = pageInfo
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([DeliveriesWebhookResponseDataItem].self, forKey: .data)
        self.pageInfo = try container.decode(DeliveriesWebhookResponsePageInfo.self, forKey: .pageInfo)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.pageInfo, forKey: .pageInfo)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case pageInfo = "page_info"
    }
}
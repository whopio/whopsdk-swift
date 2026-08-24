import Foundation

/// A webhook log entry containing the request and response details
public struct DeliveriesWebhookResponseDataItem: Codable, Hashable, Sendable {
    /// The request body sent to the webhook endpoint
    public let requestBody: [String: JSONValue]
    /// The ID of the resource that triggered the webhook
    public let resourceId: String
    /// The response body received from the webhook endpoint
    public let responseBody: [String: JSONValue]
    /// The HTTP response code received from the webhook endpoint
    public let responseCode: Int
    /// The timestamp when the webhook was sent
    public let sentAt: Date
    /// The total time taken to send the webhook request in seconds
    public let totalTime: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        requestBody: [String: JSONValue],
        resourceId: String,
        responseBody: [String: JSONValue],
        responseCode: Int,
        sentAt: Date,
        totalTime: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.requestBody = requestBody
        self.resourceId = resourceId
        self.responseBody = responseBody
        self.responseCode = responseCode
        self.sentAt = sentAt
        self.totalTime = totalTime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requestBody = try container.decode([String: JSONValue].self, forKey: .requestBody)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.responseBody = try container.decode([String: JSONValue].self, forKey: .responseBody)
        self.responseCode = try container.decode(Int.self, forKey: .responseCode)
        self.sentAt = try container.decode(Date.self, forKey: .sentAt)
        self.totalTime = try container.decode(Double.self, forKey: .totalTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.requestBody, forKey: .requestBody)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.responseBody, forKey: .responseBody)
        try container.encode(self.responseCode, forKey: .responseCode)
        try container.encode(self.sentAt, forKey: .sentAt)
        try container.encode(self.totalTime, forKey: .totalTime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case requestBody = "request_body"
        case resourceId = "resource_id"
        case responseBody = "response_body"
        case responseCode = "response_code"
        case sentAt = "sent_at"
        case totalTime = "total_time"
    }
}
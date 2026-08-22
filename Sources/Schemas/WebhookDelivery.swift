import Foundation

public struct WebhookDelivery: Codable, Hashable, Sendable {
    /// The event type this delivery carried, for example `payment.succeeded`.
    public let event: Nullable<String>
    /// Unique identifier for this delivery attempt. Pass it to the replay endpoint to re-send this exact payload.
    public let id: String
    /// The id of the delivery attempt this one replayed. `null` for an original delivery.
    public let replayedFrom: Nullable<String>
    /// The JSON event payload sent to the webhook endpoint.
    public let requestBody: [String: JSONValue]
    /// ID of the resource that triggered the webhook.
    public let resourceId: String
    /// The endpoint's JSON response. A non-JSON response is stored as `{ error, raw_body }` with the first 100 bytes.
    public let responseBody: Nullable<[String: JSONValue]>
    /// HTTP response code received from the webhook endpoint.
    public let responseCode: Double
    /// When the webhook was sent, as an ISO 8601 timestamp.
    public let sentAt: String
    /// Whether the endpoint acknowledged this attempt with a 2xx response.
    public let success: Bool
    /// Total time taken to send the webhook request, in seconds.
    public let totalTime: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        event: Nullable<String>,
        id: String,
        replayedFrom: Nullable<String>,
        requestBody: [String: JSONValue],
        resourceId: String,
        responseBody: Nullable<[String: JSONValue]>,
        responseCode: Double,
        sentAt: String,
        success: Bool,
        totalTime: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.event = event
        self.id = id
        self.replayedFrom = replayedFrom
        self.requestBody = requestBody
        self.resourceId = resourceId
        self.responseBody = responseBody
        self.responseCode = responseCode
        self.sentAt = sentAt
        self.success = success
        self.totalTime = totalTime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.event = try container.decode(Nullable<String>.self, forKey: .event)
        self.id = try container.decode(String.self, forKey: .id)
        self.replayedFrom = try container.decode(Nullable<String>.self, forKey: .replayedFrom)
        self.requestBody = try container.decode([String: JSONValue].self, forKey: .requestBody)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.responseBody = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .responseBody)
        self.responseCode = try container.decode(Double.self, forKey: .responseCode)
        self.sentAt = try container.decode(String.self, forKey: .sentAt)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.totalTime = try container.decode(Double.self, forKey: .totalTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.event, forKey: .event)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.replayedFrom, forKey: .replayedFrom)
        try container.encode(self.requestBody, forKey: .requestBody)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.responseBody, forKey: .responseBody)
        try container.encode(self.responseCode, forKey: .responseCode)
        try container.encode(self.sentAt, forKey: .sentAt)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.totalTime, forKey: .totalTime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case event
        case id
        case replayedFrom = "replayed_from"
        case requestBody = "request_body"
        case resourceId = "resource_id"
        case responseBody = "response_body"
        case responseCode = "response_code"
        case sentAt = "sent_at"
        case success
        case totalTime = "total_time"
    }
}
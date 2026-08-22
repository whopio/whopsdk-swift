import Foundation

public struct ReplayDeliveryWebhooksResponse: Codable, Hashable, Sendable {
    /// The body your endpoint returned for the replayed request, as raw text. Empty when the endpoint could not be reached.
    public let body: String
    /// The HTTP response code your endpoint returned for the replayed request, or 0 when it could not be reached (timeout, DNS, or connection failure).
    public let status: Int
    /// Whether your endpoint acknowledged the replay with a 2xx response.
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: String,
        status: Int,
        success: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.body = body
        self.status = status
        self.success = success
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.body = try container.decode(String.self, forKey: .body)
        self.status = try container.decode(Int.self, forKey: .status)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.body, forKey: .body)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.success, forKey: .success)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case body
        case status
        case success
    }
}
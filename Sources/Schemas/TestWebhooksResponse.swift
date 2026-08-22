import Foundation

public struct TestWebhooksResponse: Codable, Hashable, Sendable {
    public let body: JSONValue
    /// The HTTP response code of this request.
    public let status: Int
    /// Whether or not the webhook test was successful.
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: JSONValue,
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
        self.body = try container.decode(JSONValue.self, forKey: .body)
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
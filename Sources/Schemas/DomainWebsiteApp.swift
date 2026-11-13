import Foundation

public struct DomainWebsiteApp: Codable, Hashable, Sendable {
    /// The production base URL where the app is hosted. `null` if no base URL is configured or the domain isn't yours.
    public let baseUrl: Nullable<String>
    /// App ID, prefixed `app_`.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        baseUrl: Nullable<String>,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.baseUrl = baseUrl
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseUrl = try container.decode(Nullable<String>.self, forKey: .baseUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.baseUrl, forKey: .baseUrl)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case baseUrl = "base_url"
        case id
    }
}
import Foundation

public struct DomainRegistrar: Codable, Hashable, Sendable {
    /// The registrar's IANA registrar ID, or `null` when the record omits it.
    public let ianaId: Nullable<String>
    /// Registrar name, such as `GoDaddy.com, LLC`.
    public let name: String
    /// The registrar's website, or `null` when the record omits it.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ianaId: Nullable<String>,
        name: String,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ianaId = ianaId
        self.name = name
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ianaId = try container.decode(Nullable<String>.self, forKey: .ianaId)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ianaId, forKey: .ianaId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ianaId = "iana_id"
        case name
        case url
    }
}
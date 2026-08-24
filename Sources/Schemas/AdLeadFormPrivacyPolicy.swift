import Foundation

public struct AdLeadFormPrivacyPolicy: Codable, Hashable, Sendable {
    /// Link text shown for the policy. `null` uses the platform default.
    public let linkText: Nullable<String>
    /// URL of your privacy policy.
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        linkText: Nullable<String>,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.linkText = linkText
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.linkText = try container.decode(Nullable<String>.self, forKey: .linkText)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.linkText, forKey: .linkText)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case linkText = "link_text"
        case url
    }
}
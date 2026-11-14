import Foundation

public struct FinancingTerms: Codable, Hashable, Sendable {
    /// The exact plain-text contract snapshot covered by this version. Present this content, the policies, and the disclosure before collecting acceptance.
    public let content: String
    /// Affirmative acceptance statement to present to the merchant.
    public let disclosure: String
    /// Additional financing fee information.
    public let feesUrl: String
    public let policies: [String]
    /// Source URL for the Splitit contract snapshot.
    public let url: String
    /// Content fingerprint to pass as merchant_acceptance.terms_version when submitting.
    public let version: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: String,
        disclosure: String,
        feesUrl: String,
        policies: [String],
        url: String,
        version: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.disclosure = disclosure
        self.feesUrl = feesUrl
        self.policies = policies
        self.url = url
        self.version = version
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.disclosure = try container.decode(String.self, forKey: .disclosure)
        self.feesUrl = try container.decode(String.self, forKey: .feesUrl)
        self.policies = try container.decode([String].self, forKey: .policies)
        self.url = try container.decode(String.self, forKey: .url)
        self.version = try container.decode(String.self, forKey: .version)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.disclosure, forKey: .disclosure)
        try container.encode(self.feesUrl, forKey: .feesUrl)
        try container.encode(self.policies, forKey: .policies)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.version, forKey: .version)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case disclosure
        case feesUrl = "fees_url"
        case policies
        case url
        case version
    }
}
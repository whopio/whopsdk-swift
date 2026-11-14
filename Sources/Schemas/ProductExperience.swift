import Foundation

public struct ProductExperience: Codable, Hashable, Sendable {
    /// App the experience runs in.
    public let app: ProductExperienceApp
    /// Experience ID, prefixed `exp_`.
    public let id: String
    /// Logo image URL uploaded for this experience. `null` when it has none; show the app's `icon` instead.
    public let logoUrl: Nullable<String>
    /// Experience display name.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        app: ProductExperienceApp,
        id: String,
        logoUrl: Nullable<String>,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.app = app
        self.id = id
        self.logoUrl = logoUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.app = try container.decode(ProductExperienceApp.self, forKey: .app)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.app, forKey: .app)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case app
        case id
        case logoUrl = "logo_url"
        case name
    }
}
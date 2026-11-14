import Foundation

public struct DomainWebsite: Codable, Hashable, Sendable {
    /// The app the domain serves. `null` until you choose one; the domain shows a placeholder page meanwhile.
    public let app: Nullable<DomainWebsiteApp>
    /// How far serving the website has got.
    public let state: DomainWebsiteState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        app: Nullable<DomainWebsiteApp>,
        state: DomainWebsiteState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.app = app
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.app = try container.decode(Nullable<DomainWebsiteApp>.self, forKey: .app)
        self.state = try container.decode(DomainWebsiteState.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.app, forKey: .app)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case app
        case state
    }
}
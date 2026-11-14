import Foundation

/// Serve a Whop website on the domain. Pass `null` to stop serving it; the domain keeps its other capabilities.
public struct CreateDomainsRequestWebsite: Codable, Hashable, Sendable {
    /// App ID, prefixed app_, of the website to serve. The app must belong to the account. Leave it out to point the domain at Whop before the website exists; it shows a placeholder until you choose one. Pass `null` to detach the app and keep the domain pointed at Whop.
    public let appId: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appId: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appId = appId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appId = try container.decodeNullableIfPresent(String.self, forKey: .appId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.appId, forKey: .appId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appId = "app_id"
    }
}
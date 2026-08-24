import Foundation

public struct RetrievePeopleResponseDevice: Codable, Hashable, Sendable {
    public let browser: Nullable<String>?
    public let device: Nullable<String>?
    public let os: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        browser: Nullable<String>? = nil,
        device: Nullable<String>? = nil,
        os: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.browser = browser
        self.device = device
        self.os = os
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.browser = try container.decodeNullableIfPresent(String.self, forKey: .browser)
        self.device = try container.decodeNullableIfPresent(String.self, forKey: .device)
        self.os = try container.decodeNullableIfPresent(String.self, forKey: .os)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.browser, forKey: .browser)
        try container.encodeNullableIfPresent(self.device, forKey: .device)
        try container.encodeNullableIfPresent(self.os, forKey: .os)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case browser
        case device
        case os
    }
}
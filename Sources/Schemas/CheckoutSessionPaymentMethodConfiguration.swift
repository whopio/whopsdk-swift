import Foundation

public struct CheckoutSessionPaymentMethodConfiguration: Codable, Hashable, Sendable {
    public let disabled: [String]
    public let enabled: [String]
    /// Whether Whop's default set is the starting point. When `false`, only `enabled` is offered.
    public let includePlatformDefaults: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disabled: [String],
        enabled: [String],
        includePlatformDefaults: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.disabled = disabled
        self.enabled = enabled
        self.includePlatformDefaults = includePlatformDefaults
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.disabled = try container.decode([String].self, forKey: .disabled)
        self.enabled = try container.decode([String].self, forKey: .enabled)
        self.includePlatformDefaults = try container.decode(Bool.self, forKey: .includePlatformDefaults)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.disabled, forKey: .disabled)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encode(self.includePlatformDefaults, forKey: .includePlatformDefaults)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disabled
        case enabled
        case includePlatformDefaults = "include_platform_defaults"
    }
}
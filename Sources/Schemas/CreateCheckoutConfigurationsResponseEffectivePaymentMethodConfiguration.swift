import Foundation

/// The configuration governing a checkout mounted from this configuration, resolved through every layer (its own overrides, the variant's, and the account's) — the shape a session's `payment_method_configuration` carries. Apply it over the payment method types catalogue for the offerable set. `null` means platform defaults; `payment_method_configuration` stays this configuration's own editable override.
public struct CreateCheckoutConfigurationsResponseEffectivePaymentMethodConfiguration: Codable, Hashable, Sendable {
    /// Payment methods explicitly disabled.
    public let disabled: [String]?
    /// Payment methods explicitly enabled.
    public let enabled: [String]?
    /// Whether platform default payment methods are included.
    public let includePlatformDefaults: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disabled: [String]? = nil,
        enabled: [String]? = nil,
        includePlatformDefaults: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.disabled = disabled
        self.enabled = enabled
        self.includePlatformDefaults = includePlatformDefaults
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.disabled = try container.decodeIfPresent([String].self, forKey: .disabled)
        self.enabled = try container.decodeIfPresent([String].self, forKey: .enabled)
        self.includePlatformDefaults = try container.decodeIfPresent(Bool.self, forKey: .includePlatformDefaults)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.disabled, forKey: .disabled)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.includePlatformDefaults, forKey: .includePlatformDefaults)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disabled
        case enabled
        case includePlatformDefaults = "include_platform_defaults"
    }
}
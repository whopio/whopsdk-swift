import Foundation

/// Explicit payment method configuration for the variant. When not provided, the account's defaults apply. Send at least one of `enabled` or `disabled`; an omitted one is empty.
public struct CreateVariantsRequestPaymentMethodConfiguration: Codable, Hashable, Sendable {
    /// Payment method types explicitly disabled for this variant — the `type` values from the payment method types catalogue. Types Whop no longer offers, and the read-only `unknown` placeholder, are dropped.
    public let disabled: [PaymentMethodTypes]?
    /// Payment method types explicitly enabled for this variant — the `type` values from the payment method types catalogue. Types Whop no longer offers, and the read-only `unknown` placeholder, are dropped.
    public let enabled: [PaymentMethodTypes]?
    public let includePlatformDefaults: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disabled: [PaymentMethodTypes]? = nil,
        enabled: [PaymentMethodTypes]? = nil,
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
        self.disabled = try container.decodeIfPresent([PaymentMethodTypes].self, forKey: .disabled)
        self.enabled = try container.decodeIfPresent([PaymentMethodTypes].self, forKey: .enabled)
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
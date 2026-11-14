import Foundation

/// The payment methods the customer can choose from when paying through the invoice's checkout link, in the shape a variant or checkout configuration takes. It takes precedence over the invoice's variants and the account, and changes neither. Send both lists. `null` uses its variants' payment methods. Can be updated on drafts.
public struct UpdateInvoicesRequestPaymentMethodConfiguration: Codable, Hashable, Sendable {
    /// Payment method types explicitly disabled for this invoice. Use the `type` values from the payment method types catalogue. Types Whop no longer offers, and the read-only `unknown` placeholder, are dropped.
    public let disabled: [PaymentMethodTypes]
    /// Payment method types explicitly enabled for this invoice. Use the `type` values from the payment method types catalogue. Types Whop no longer offers, and the read-only `unknown` placeholder, are dropped.
    public let enabled: [PaymentMethodTypes]
    /// Whether Whop's default set is the starting point. When `false`, only `enabled` is offered. Defaults to `true`.
    public let includePlatformDefaults: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disabled: [PaymentMethodTypes],
        enabled: [PaymentMethodTypes],
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
        self.disabled = try container.decode([PaymentMethodTypes].self, forKey: .disabled)
        self.enabled = try container.decode([PaymentMethodTypes].self, forKey: .enabled)
        self.includePlatformDefaults = try container.decodeIfPresent(Bool.self, forKey: .includePlatformDefaults)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.disabled, forKey: .disabled)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.includePlatformDefaults, forKey: .includePlatformDefaults)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disabled
        case enabled
        case includePlatformDefaults = "include_platform_defaults"
    }
}
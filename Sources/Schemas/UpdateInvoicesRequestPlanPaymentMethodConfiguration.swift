import Foundation

/// The explicit payment method configuration for the plan. If not provided, the platform or company's defaults will apply.
public struct UpdateInvoicesRequestPlanPaymentMethodConfiguration: Codable, Hashable, Sendable {
    /// An array of payment method identifiers that are explicitly disabled. Only applies if the include_platform_defaults is true.
    public let disabled: [PaymentMethodTypes]
    /// An array of payment method identifiers that are explicitly enabled. This means these payment methods will be shown on checkout. Example use case is to only enable a specific payment method like cashapp, or extending the platform defaults with additional methods.
    public let enabled: [PaymentMethodTypes]
    /// Whether Whop's platform default payment method enablement settings are included in this configuration. The full list of default payment methods can be found in the documentation at docs.whop.com/payments.
    public let includePlatformDefaults: Nullable<Bool>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disabled: [PaymentMethodTypes],
        enabled: [PaymentMethodTypes],
        includePlatformDefaults: Nullable<Bool>? = nil,
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
        self.includePlatformDefaults = try container.decodeNullableIfPresent(Bool.self, forKey: .includePlatformDefaults)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.disabled, forKey: .disabled)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encodeNullableIfPresent(self.includePlatformDefaults, forKey: .includePlatformDefaults)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disabled
        case enabled
        case includePlatformDefaults = "include_platform_defaults"
    }
}
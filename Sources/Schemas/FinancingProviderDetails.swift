import Foundation

public struct FinancingProviderDetails: Codable, Hashable, Sendable {
    /// The account's dispute rate as a fraction, for example 0.012 for 1.2%.
    public let disputeRate: Nullable<Double>
    /// The dispute rate, as a fraction, at which the provider is turned off or held back.
    public let disputeRateLimit: Nullable<Double>
    /// The provider whose dispute rate caused this change, or `null` when it was this provider's own rate.
    public let sourceProvider: Nullable<FinancingProviderDetailsSourceProvider>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disputeRate: Nullable<Double>,
        disputeRateLimit: Nullable<Double>,
        sourceProvider: Nullable<FinancingProviderDetailsSourceProvider>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.disputeRate = disputeRate
        self.disputeRateLimit = disputeRateLimit
        self.sourceProvider = sourceProvider
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.disputeRate = try container.decode(Nullable<Double>.self, forKey: .disputeRate)
        self.disputeRateLimit = try container.decode(Nullable<Double>.self, forKey: .disputeRateLimit)
        self.sourceProvider = try container.decode(Nullable<FinancingProviderDetailsSourceProvider>.self, forKey: .sourceProvider)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.disputeRate, forKey: .disputeRate)
        try container.encode(self.disputeRateLimit, forKey: .disputeRateLimit)
        try container.encode(self.sourceProvider, forKey: .sourceProvider)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disputeRate = "dispute_rate"
        case disputeRateLimit = "dispute_rate_limit"
        case sourceProvider = "source_provider"
    }
}
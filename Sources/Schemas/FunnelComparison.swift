import Foundation

public struct FunnelComparison: Codable, Hashable, Sendable {
    /// The reference group's name.
    public let baseline: String
    /// Adjusted Wald interval for the difference in percentage points, with Bonferroni correction across comparisons.
    public let differenceConfidenceInterval: Nullable<FunnelConfidenceInterval>
    /// This group's conversion percentage minus the baseline's.
    public let differencePercentagePoints: Double
    /// Relative conversion improvement in percent; null if baseline conversion is zero.
    public let relativeLiftPercent: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        baseline: String,
        differenceConfidenceInterval: Nullable<FunnelConfidenceInterval>,
        differencePercentagePoints: Double,
        relativeLiftPercent: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.baseline = baseline
        self.differenceConfidenceInterval = differenceConfidenceInterval
        self.differencePercentagePoints = differencePercentagePoints
        self.relativeLiftPercent = relativeLiftPercent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseline = try container.decode(String.self, forKey: .baseline)
        self.differenceConfidenceInterval = try container.decode(Nullable<FunnelConfidenceInterval>.self, forKey: .differenceConfidenceInterval)
        self.differencePercentagePoints = try container.decode(Double.self, forKey: .differencePercentagePoints)
        self.relativeLiftPercent = try container.decode(Nullable<Double>.self, forKey: .relativeLiftPercent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.baseline, forKey: .baseline)
        try container.encode(self.differenceConfidenceInterval, forKey: .differenceConfidenceInterval)
        try container.encode(self.differencePercentagePoints, forKey: .differencePercentagePoints)
        try container.encode(self.relativeLiftPercent, forKey: .relativeLiftPercent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case baseline
        case differenceConfidenceInterval = "difference_confidence_interval"
        case differencePercentagePoints = "difference_percentage_points"
        case relativeLiftPercent = "relative_lift_percent"
    }
}
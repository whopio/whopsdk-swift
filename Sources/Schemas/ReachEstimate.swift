import Foundation

public struct ReachEstimate: Codable, Hashable, Sendable {
    /// Low end of how many people the targeting can reach. Null when the platform couldn't produce an estimate.
    public let usersLowerBound: Nullable<Double>
    /// High end of how many people the targeting can reach. Null when the platform couldn't produce an estimate.
    public let usersUpperBound: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        usersLowerBound: Nullable<Double>,
        usersUpperBound: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.usersLowerBound = usersLowerBound
        self.usersUpperBound = usersUpperBound
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.usersLowerBound = try container.decode(Nullable<Double>.self, forKey: .usersLowerBound)
        self.usersUpperBound = try container.decode(Nullable<Double>.self, forKey: .usersUpperBound)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.usersLowerBound, forKey: .usersLowerBound)
        try container.encode(self.usersUpperBound, forKey: .usersUpperBound)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case usersLowerBound = "users_lower_bound"
        case usersUpperBound = "users_upper_bound"
    }
}
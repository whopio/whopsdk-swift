import Foundation

public struct UserBalanceHistoryPoint: Codable, Hashable, Sendable {
    /// Point timestamp, in Unix seconds.
    public let t: Int
    /// Cumulative wallet balance at this point, in USD.
    public let v: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        t: Int,
        v: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.t = t
        self.v = v
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.t = try container.decode(Int.self, forKey: .t)
        self.v = try container.decode(Double.self, forKey: .v)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.t, forKey: .t)
        try container.encode(self.v, forKey: .v)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case t
        case v
    }
}
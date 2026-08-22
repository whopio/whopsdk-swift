import Foundation

/// Currency for this ledger activity.
public struct LedgerActivityCurrency: Codable, Hashable, Sendable {
    /// Currency code.
    public let code: String
    /// Precision factor for the currency, for example `100000000` for USD.
    public let precision: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String,
        precision: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.precision = precision
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(String.self, forKey: .code)
        self.precision = try container.decode(String.self, forKey: .precision)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.precision, forKey: .precision)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case precision
    }
}
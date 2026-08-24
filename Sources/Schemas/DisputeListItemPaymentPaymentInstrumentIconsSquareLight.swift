import Foundation

/// The colorway for light surfaces.
public struct DisputeListItemPaymentPaymentInstrumentIconsSquareLight: Codable, Hashable, Sendable {
    /// The vector file. Prefer this everywhere SVG renders.
    public let svg: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        svg: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.svg = svg
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.svg = try container.decode(String.self, forKey: .svg)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.svg, forKey: .svg)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case svg
    }
}
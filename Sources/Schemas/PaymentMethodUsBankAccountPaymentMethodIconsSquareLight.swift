import Foundation

/// The colorway for light surfaces.
public struct PaymentMethodUsBankAccountPaymentMethodIconsSquareLight: Codable, Hashable, Sendable {
    /// Raster fallback at the shape's native size.
    public let png1X: String
    /// Raster fallback at double density.
    public let png2X: String
    /// Raster fallback at quadruple density.
    public let png4X: String
    /// The vector file. Prefer this everywhere SVG renders.
    public let svg: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        png1X: String,
        png2X: String,
        png4X: String,
        svg: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.png1X = png1X
        self.png2X = png2X
        self.png4X = png4X
        self.svg = svg
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.png1X = try container.decode(String.self, forKey: .png1X)
        self.png2X = try container.decode(String.self, forKey: .png2X)
        self.png4X = try container.decode(String.self, forKey: .png4X)
        self.svg = try container.decode(String.self, forKey: .svg)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.png1X, forKey: .png1X)
        try container.encode(self.png2X, forKey: .png2X)
        try container.encode(self.png4X, forKey: .png4X)
        try container.encode(self.svg, forKey: .svg)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case png1X = "png_1x"
        case png2X = "png_2x"
        case png4X = "png_4x"
        case svg
    }
}
import Foundation

/// The saved crop window for this creative, in source image pixels. Omit it for the original asset or for a format that has not been cropped.
public struct CreateAdsRequestCreativesItemCrop: Codable, Hashable, Sendable {
    public let height: Double?
    public let width: Double?
    public let x: Double?
    public let y: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        height: Double? = nil,
        width: Double? = nil,
        x: Double? = nil,
        y: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.height = height
        self.width = width
        self.x = x
        self.y = y
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decodeIfPresent(Double.self, forKey: .height)
        self.width = try container.decodeIfPresent(Double.self, forKey: .width)
        self.x = try container.decodeIfPresent(Double.self, forKey: .x)
        self.y = try container.decodeIfPresent(Double.self, forKey: .y)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.width, forKey: .width)
        try container.encodeIfPresent(self.x, forKey: .x)
        try container.encodeIfPresent(self.y, forKey: .y)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case height
        case width
        case x
        case y
    }
}
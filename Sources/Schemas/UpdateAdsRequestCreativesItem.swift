import Foundation

public struct UpdateAdsRequestCreativesItem: Codable, Hashable, Sendable {
    /// The saved crop window for this creative, in source image pixels. Omit it for the original asset or for a format that has not been cropped.
    public let crop: UpdateAdsRequestCreativesItemCrop?
    public let format: UpdateAdsRequestCreativesItemFormat?
    /// Uploaded file ID, prefixed `file_`.
    public let id: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        crop: UpdateAdsRequestCreativesItemCrop? = nil,
        format: UpdateAdsRequestCreativesItemFormat? = nil,
        id: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.crop = crop
        self.format = format
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.crop = try container.decodeIfPresent(UpdateAdsRequestCreativesItemCrop.self, forKey: .crop)
        self.format = try container.decodeIfPresent(UpdateAdsRequestCreativesItemFormat.self, forKey: .format)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.crop, forKey: .crop)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case crop
        case format
        case id
    }
}
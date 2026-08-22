import Foundation

public struct ListEarningsResponseDataItemResourceAlternativePaymentMethodAlternativePaymentMethod: Codable, Hashable, Sendable {
    public let imageUrl: Nullable<String>
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        imageUrl: Nullable<String>,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.imageUrl = imageUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case imageUrl = "image_url"
        case name
    }
}
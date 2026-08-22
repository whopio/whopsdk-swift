import Foundation

public struct PaymentNextActionRedirectData: Codable, Hashable, Sendable {
    /// The widest the provider's page lays out usefully, in CSS pixels — cap a frame or dialog presenting it at this width. `null` when the page fills whatever width it is given.
    public let frameMaxWidth: Nullable<Int>
    /// The provider's page for this payment, as an absolute URL — take the buyer there.
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        frameMaxWidth: Nullable<Int>,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.frameMaxWidth = frameMaxWidth
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frameMaxWidth = try container.decode(Nullable<Int>.self, forKey: .frameMaxWidth)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.frameMaxWidth, forKey: .frameMaxWidth)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case frameMaxWidth = "frame_max_width"
        case url
    }
}
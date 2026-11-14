import Foundation

public struct FeeOptionsPartnersResponse: Codable, Hashable, Sendable {
    public let object: FeeOptionsPartnersResponseObject
    /// One entry per income stream a partner earns on.
    public let streams: [FeeOptionsPartnersResponseStreamsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        object: FeeOptionsPartnersResponseObject,
        streams: [FeeOptionsPartnersResponseStreamsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.object = object
        self.streams = streams
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.object = try container.decode(FeeOptionsPartnersResponseObject.self, forKey: .object)
        self.streams = try container.decode([FeeOptionsPartnersResponseStreamsItem].self, forKey: .streams)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.streams, forKey: .streams)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case object
        case streams
    }
}
import Foundation

public struct Transfer: Codable, Hashable, Sendable {
    public let origin: TransferOrigin?
    public let destination: TransferDestination?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        origin: TransferOrigin? = nil,
        destination: TransferDestination? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.origin = origin
        self.destination = destination
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.origin = try container.decodeIfPresent(TransferOrigin.self, forKey: .origin)
        self.destination = try container.decodeIfPresent(TransferDestination.self, forKey: .destination)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.origin, forKey: .origin)
        try container.encodeIfPresent(self.destination, forKey: .destination)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case origin
        case destination
    }
}
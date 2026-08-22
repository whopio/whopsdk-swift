import Foundation

public struct NotFoundErrorBody: Codable, Hashable, Sendable {
    public let error: NotFoundErrorBodyError
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: NotFoundErrorBodyError,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(NotFoundErrorBodyError.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
    }
}
import Foundation

public struct PostShippingAddressChangedResponseDecline: Codable, Hashable, Sendable {
    /// Refuses this address; the buyer picks another.
    public let decline: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        decline: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.decline = decline
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.decline = try container.decode(Bool.self, forKey: .decline)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.decline, forKey: .decline)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case decline
    }
}
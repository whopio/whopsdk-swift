import Foundation

public struct TradingWebsocketSubscription: Codable, Hashable, Sendable {
    /// The live update stream this subscription opens.
    public let channel: TradingWebsocketSubscriptionChannel
    /// JSON subscription message to send unchanged over the Hyperliquid WebSocket.
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        channel: TradingWebsocketSubscriptionChannel,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.channel = channel
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channel = try container.decode(TradingWebsocketSubscriptionChannel.self, forKey: .channel)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.channel, forKey: .channel)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case channel
        case message
    }
}
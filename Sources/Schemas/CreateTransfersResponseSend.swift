import Foundation

/// Returned for a wallet_send: an onchain USDT send to a recipient.
public struct CreateTransfersResponseSend: Codable, Hashable, Sendable {
    public let amount: String
    public let currency: String
    public let destination: CreateTransfersResponseSendDestination
    public let source: CreateTransfersResponseSendSource
    public let txHash: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        currency: String,
        destination: CreateTransfersResponseSendDestination,
        source: CreateTransfersResponseSendSource,
        txHash: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.destination = destination
        self.source = source
        self.txHash = txHash
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.destination = try container.decode(CreateTransfersResponseSendDestination.self, forKey: .destination)
        self.source = try container.decode(CreateTransfersResponseSendSource.self, forKey: .source)
        self.txHash = try container.decode(String.self, forKey: .txHash)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.destination, forKey: .destination)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.txHash, forKey: .txHash)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case destination
        case source
        case txHash = "tx_hash"
    }
}
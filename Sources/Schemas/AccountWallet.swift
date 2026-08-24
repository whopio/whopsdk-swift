import Foundation

public struct AccountWallet: Codable, Hashable, Sendable {
    /// The on-chain address of the wallet
    public let address: String
    /// Wallet ID, prefixed `wallet_`.
    public let id: String
    /// The blockchain network the wallet lives on
    public let network: AccountWalletNetwork
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: String,
        id: String,
        network: AccountWalletNetwork,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.id = id
        self.network = network
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.id = try container.decode(String.self, forKey: .id)
        self.network = try container.decode(AccountWalletNetwork.self, forKey: .network)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.network, forKey: .network)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case id
        case network
    }
}
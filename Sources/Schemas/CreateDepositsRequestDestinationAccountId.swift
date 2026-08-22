import Foundation

public struct CreateDepositsRequestDestinationAccountId: Codable, Hashable, Sendable {
    /// Destination account ID.
    public let accountId: String?
    /// Destination wallet address.
    public let address: String?
    /// Destination wallet network.
    public let network: CreateDepositsRequestDestinationAccountIdNetwork?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String? = nil,
        address: String? = nil,
        network: CreateDepositsRequestDestinationAccountIdNetwork? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.address = address
        self.network = network
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.network = try container.decodeIfPresent(CreateDepositsRequestDestinationAccountIdNetwork.self, forKey: .network)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.network, forKey: .network)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case address
        case network
    }
}
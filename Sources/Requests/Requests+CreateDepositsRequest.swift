import Foundation

extension Requests {
    public struct CreateDepositsRequest: Codable, Hashable, Sendable {
        /// Amount to prefill on hosted deposit page.
        public let amount: Double?
        /// Destination account ID or wallet address. Object form is supported for compatibility. Any business resolves by its account ID without authentication; a user account resolves only for that same authenticated user.
        public let destination: CreateDepositsRequestDestination
        /// Metadata to include with the deposit response.
        public let metadata: [String: JSONValue]?
        /// Destination network override. Defaults to the destination wallet's own network.
        public let network: Nullable<CreateDepositsRequestNetwork>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            amount: Double? = nil,
            destination: CreateDepositsRequestDestination,
            metadata: [String: JSONValue]? = nil,
            network: Nullable<CreateDepositsRequestNetwork>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.amount = amount
            self.destination = destination
            self.metadata = metadata
            self.network = network
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.decodeIfPresent(Double.self, forKey: .amount)
            self.destination = try container.decode(CreateDepositsRequestDestination.self, forKey: .destination)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.network = try container.decodeNullableIfPresent(CreateDepositsRequestNetwork.self, forKey: .network)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.amount, forKey: .amount)
            try container.encode(self.destination, forKey: .destination)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.network, forKey: .network)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case amount
            case destination
            case metadata
            case network
        }
    }
}
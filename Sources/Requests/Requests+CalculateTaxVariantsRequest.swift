import Foundation

extension Requests {
    public struct CalculateTaxVariantsRequest: Codable, Hashable, Sendable {
        /// Buyer billing address used for tax calculation. Provide either `address.country` or `ip_address`; include state and postal code when available for more accurate results.
        public let address: Nullable<CalculateTaxVariantsRequestAddress>?
        /// Buyer IP address used to infer location when no billing address is provided.
        public let ipAddress: String?
        /// Optional buyer tax ID for B2B exemptions. At most one entry is supported.
        public let taxIds: Nullable<[CalculateTaxVariantsRequestTaxIdsItem]>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            address: Nullable<CalculateTaxVariantsRequestAddress>? = nil,
            ipAddress: String? = nil,
            taxIds: Nullable<[CalculateTaxVariantsRequestTaxIdsItem]>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.address = address
            self.ipAddress = ipAddress
            self.taxIds = taxIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.address = try container.decodeNullableIfPresent(CalculateTaxVariantsRequestAddress.self, forKey: .address)
            self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
            self.taxIds = try container.decodeNullableIfPresent([CalculateTaxVariantsRequestTaxIdsItem].self, forKey: .taxIds)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.address, forKey: .address)
            try container.encodeIfPresent(self.ipAddress, forKey: .ipAddress)
            try container.encodeNullableIfPresent(self.taxIds, forKey: .taxIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case address
            case ipAddress = "ip_address"
            case taxIds = "tax_ids"
        }
    }
}
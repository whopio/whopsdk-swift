import Foundation

extension Requests {
    public struct CalculateTaxPlansRequest: Codable, Hashable, Sendable {
        public let address: Nullable<CalculateTaxPlansRequestAddress>?
        public let ipAddress: String?
        public let taxIds: Nullable<[CalculateTaxPlansRequestTaxIdsItem]>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            address: Nullable<CalculateTaxPlansRequestAddress>? = nil,
            ipAddress: String? = nil,
            taxIds: Nullable<[CalculateTaxPlansRequestTaxIdsItem]>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.address = address
            self.ipAddress = ipAddress
            self.taxIds = taxIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.address = try container.decodeNullableIfPresent(CalculateTaxPlansRequestAddress.self, forKey: .address)
            self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
            self.taxIds = try container.decodeNullableIfPresent([CalculateTaxPlansRequestTaxIdsItem].self, forKey: .taxIds)
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
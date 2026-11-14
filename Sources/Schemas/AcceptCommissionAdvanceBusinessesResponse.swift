import Foundation

public struct AcceptCommissionAdvanceBusinessesResponse: Codable, Hashable, Sendable {
    public let commissionAdvance: PartnerAdvance
    /// The referred business relationship ID.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        commissionAdvance: PartnerAdvance,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.commissionAdvance = commissionAdvance
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.commissionAdvance = try container.decode(PartnerAdvance.self, forKey: .commissionAdvance)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.commissionAdvance, forKey: .commissionAdvance)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case commissionAdvance = "commission_advance"
        case id
    }
}
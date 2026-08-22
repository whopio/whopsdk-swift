import Foundation

public struct ReferredUsersPartnersResponseDataItem: Codable, Hashable, Sendable {
    public let totalEarningsUsd: String
    public let totalVolumeUsd: String
    public let user: ReferredUsersPartnersResponseDataItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalEarningsUsd: String,
        totalVolumeUsd: String,
        user: ReferredUsersPartnersResponseDataItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalEarningsUsd = totalEarningsUsd
        self.totalVolumeUsd = totalVolumeUsd
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalEarningsUsd = try container.decode(String.self, forKey: .totalEarningsUsd)
        self.totalVolumeUsd = try container.decode(String.self, forKey: .totalVolumeUsd)
        self.user = try container.decode(ReferredUsersPartnersResponseDataItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.totalEarningsUsd, forKey: .totalEarningsUsd)
        try container.encode(self.totalVolumeUsd, forKey: .totalVolumeUsd)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalEarningsUsd = "total_earnings_usd"
        case totalVolumeUsd = "total_volume_usd"
        case user
    }
}
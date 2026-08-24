import Foundation

public struct UserStaffAccess: Codable, Hashable, Sendable {
    /// Whether the user holds the admin staff role with a valid second factor.
    public let admin: Bool
    /// Whether the user can open Whop-internal investigation tooling right now: a qualifying staff role plus their investigation toggle switched on.
    public let investigationAccess: Bool
    /// Whether the user holds the manager staff role with a valid second factor.
    public let manager: Bool
    /// Whether the user holds the support staff role with a valid second factor.
    public let support: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        admin: Bool,
        investigationAccess: Bool,
        manager: Bool,
        support: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.admin = admin
        self.investigationAccess = investigationAccess
        self.manager = manager
        self.support = support
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.admin = try container.decode(Bool.self, forKey: .admin)
        self.investigationAccess = try container.decode(Bool.self, forKey: .investigationAccess)
        self.manager = try container.decode(Bool.self, forKey: .manager)
        self.support = try container.decode(Bool.self, forKey: .support)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.admin, forKey: .admin)
        try container.encode(self.investigationAccess, forKey: .investigationAccess)
        try container.encode(self.manager, forKey: .manager)
        try container.encode(self.support, forKey: .support)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case admin
        case investigationAccess = "investigation_access"
        case manager
        case support
    }
}
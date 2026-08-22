import Foundation

extension Requests {
    public struct UpdatePermissionsAppRequest: Codable, Hashable, Sendable {
        /// The permissions that the app will request off of users when a user installs the app.
        public let requestedPermissions: [UpdatePermissionsAppRequestRequestedPermissionsItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            requestedPermissions: [UpdatePermissionsAppRequestRequestedPermissionsItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.requestedPermissions = requestedPermissions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.requestedPermissions = try container.decode([UpdatePermissionsAppRequestRequestedPermissionsItem].self, forKey: .requestedPermissions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.requestedPermissions, forKey: .requestedPermissions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case requestedPermissions = "requested_permissions"
        }
    }
}
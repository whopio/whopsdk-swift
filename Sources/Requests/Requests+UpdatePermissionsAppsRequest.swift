import Foundation

extension Requests {
    public struct UpdatePermissionsAppsRequest: Codable, Hashable, Sendable {
        /// The full set of permissions the app requests on install; permissions not listed are removed.
        public let requestedPermissions: [UpdatePermissionsAppsRequestRequestedPermissionsItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            requestedPermissions: [UpdatePermissionsAppsRequestRequestedPermissionsItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.requestedPermissions = requestedPermissions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.requestedPermissions = try container.decode([UpdatePermissionsAppsRequestRequestedPermissionsItem].self, forKey: .requestedPermissions)
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
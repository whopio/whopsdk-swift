import Foundation

extension Requests {
    public struct CreateApiKeyCompaniesRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the connected account to create the API key for (e.g. 'biz_xxx').
        public let childCompanyId: String
        /// A human-readable name for the API key, such as 'Production API Key'.
        public let name: Nullable<String>?
        /// Granular permission statements defining which actions this API key can perform. Either permissions or role must be provided.
        public let permissions: Nullable<[CreateApiKeyCompaniesRequestPermissionsItem]>?
        /// A system role to inherit permissions from (e.g. owner, admin, moderator). Either role or permissions must be provided.
        public let role: Nullable<PermissionSystemRoles>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            childCompanyId: String,
            name: Nullable<String>? = nil,
            permissions: Nullable<[CreateApiKeyCompaniesRequestPermissionsItem]>? = nil,
            role: Nullable<PermissionSystemRoles>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.childCompanyId = childCompanyId
            self.name = name
            self.permissions = permissions
            self.role = role
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.childCompanyId = try container.decode(String.self, forKey: .childCompanyId)
            self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
            self.permissions = try container.decodeNullableIfPresent([CreateApiKeyCompaniesRequestPermissionsItem].self, forKey: .permissions)
            self.role = try container.decodeNullableIfPresent(PermissionSystemRoles.self, forKey: .role)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.childCompanyId, forKey: .childCompanyId)
            try container.encodeNullableIfPresent(self.name, forKey: .name)
            try container.encodeNullableIfPresent(self.permissions, forKey: .permissions)
            try container.encodeNullableIfPresent(self.role, forKey: .role)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case childCompanyId = "child_company_id"
            case name
            case permissions
            case role
        }
    }
}
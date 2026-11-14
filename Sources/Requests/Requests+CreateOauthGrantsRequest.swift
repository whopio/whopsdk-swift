import Foundation

extension Requests {
    public struct CreateOauthGrantsRequest: Codable, Hashable, Sendable {
        /// Authorize the app for one of the user's accounts rather than for the user alone, prefixed `biz_`. The user must have access to it.
        public let accountId: String?
        /// The app being authorized, prefixed `app_`.
        public let clientId: String
        /// The PKCE code challenge: the base64url-encoded SHA-256 of your code verifier, without padding. Required unless the app is confidential; a confidential app that leaves it out redeems the code with its secret instead of a verifier.
        public let codeChallenge: String?
        /// How `code_challenge` was derived. Only `S256` is accepted. Required with `code_challenge`.
        public let codeChallengeMethod: CreateOauthGrantsRequestCodeChallengeMethod?
        /// Whether the consent UI listed these scopes for the user. Sending `false` succeeds only when the user has already granted every scope requested, or when the app is one of Whop's own with the consent skip switched on and asks for `openid` alone.
        public let consentShown: Bool?
        /// The downstream MCP client displayed on the consent screen. Requires explicit consent even when the upstream app already has a grant. Bound to the authorization code and returned on token exchange so the MCP server can verify the approved client.
        public let mcpClient: CreateOauthGrantsRequestMcpClient?
        /// OIDC nonce, echoed into the resulting ID token. Required when `requested_scopes` includes `openid`.
        public let nonce: String?
        /// Where to send the user once they have consented. Must match one of the app's registered redirect URIs exactly — it is compared as a string, not normalized.
        public let redirectUri: String
        /// The permissions the app is asking for, for example `member:basic:read`. `GET /api_keys/permissions` names and describes each one. Granting adds to whatever the user already granted this app rather than replacing it.
        public let requestedScopes: [String]
        /// The OAuth response type. Only `code` is accepted; defaults to `code`.
        public let responseType: CreateOauthGrantsRequestResponseType?
        /// Opaque value appended to `redirect_url` unchanged, for the client to correlate the response with its request.
        public let state: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            clientId: String,
            codeChallenge: String? = nil,
            codeChallengeMethod: CreateOauthGrantsRequestCodeChallengeMethod? = nil,
            consentShown: Bool? = nil,
            mcpClient: CreateOauthGrantsRequestMcpClient? = nil,
            nonce: String? = nil,
            redirectUri: String,
            requestedScopes: [String],
            responseType: CreateOauthGrantsRequestResponseType? = nil,
            state: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.clientId = clientId
            self.codeChallenge = codeChallenge
            self.codeChallengeMethod = codeChallengeMethod
            self.consentShown = consentShown
            self.mcpClient = mcpClient
            self.nonce = nonce
            self.redirectUri = redirectUri
            self.requestedScopes = requestedScopes
            self.responseType = responseType
            self.state = state
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.clientId = try container.decode(String.self, forKey: .clientId)
            self.codeChallenge = try container.decodeIfPresent(String.self, forKey: .codeChallenge)
            self.codeChallengeMethod = try container.decodeIfPresent(CreateOauthGrantsRequestCodeChallengeMethod.self, forKey: .codeChallengeMethod)
            self.consentShown = try container.decodeIfPresent(Bool.self, forKey: .consentShown)
            self.mcpClient = try container.decodeIfPresent(CreateOauthGrantsRequestMcpClient.self, forKey: .mcpClient)
            self.nonce = try container.decodeIfPresent(String.self, forKey: .nonce)
            self.redirectUri = try container.decode(String.self, forKey: .redirectUri)
            self.requestedScopes = try container.decode([String].self, forKey: .requestedScopes)
            self.responseType = try container.decodeIfPresent(CreateOauthGrantsRequestResponseType.self, forKey: .responseType)
            self.state = try container.decodeIfPresent(String.self, forKey: .state)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.clientId, forKey: .clientId)
            try container.encodeIfPresent(self.codeChallenge, forKey: .codeChallenge)
            try container.encodeIfPresent(self.codeChallengeMethod, forKey: .codeChallengeMethod)
            try container.encodeIfPresent(self.consentShown, forKey: .consentShown)
            try container.encodeIfPresent(self.mcpClient, forKey: .mcpClient)
            try container.encodeIfPresent(self.nonce, forKey: .nonce)
            try container.encode(self.redirectUri, forKey: .redirectUri)
            try container.encode(self.requestedScopes, forKey: .requestedScopes)
            try container.encodeIfPresent(self.responseType, forKey: .responseType)
            try container.encodeIfPresent(self.state, forKey: .state)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case clientId = "client_id"
            case codeChallenge = "code_challenge"
            case codeChallengeMethod = "code_challenge_method"
            case consentShown = "consent_shown"
            case mcpClient = "mcp_client"
            case nonce
            case redirectUri = "redirect_uri"
            case requestedScopes = "requested_scopes"
            case responseType = "response_type"
            case state
        }
    }
}
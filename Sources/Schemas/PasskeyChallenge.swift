import Foundation

public struct PasskeyChallenge: Codable, Hashable, Sendable {
    /// The challenge to pass to the WebAuthn ceremony, base64url-encoded without padding. Also inside the options.
    public let challenge: String
    /// The options for `navigator.credentials.create()` when `challenge_type` is `registration`, otherwise `null`. Convert the keys to camelCase before passing them to the browser.
    public let creationOptions: Nullable<PasskeyCreationOptions>
    /// The options for `navigator.credentials.get()` when `challenge_type` is `deletion`, otherwise `null`. Convert the keys to camelCase before passing them to the browser.
    public let requestOptions: Nullable<PasskeyRequestOptions>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        challenge: String,
        creationOptions: Nullable<PasskeyCreationOptions>,
        requestOptions: Nullable<PasskeyRequestOptions>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.challenge = challenge
        self.creationOptions = creationOptions
        self.requestOptions = requestOptions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.challenge = try container.decode(String.self, forKey: .challenge)
        self.creationOptions = try container.decode(Nullable<PasskeyCreationOptions>.self, forKey: .creationOptions)
        self.requestOptions = try container.decode(Nullable<PasskeyRequestOptions>.self, forKey: .requestOptions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.challenge, forKey: .challenge)
        try container.encode(self.creationOptions, forKey: .creationOptions)
        try container.encode(self.requestOptions, forKey: .requestOptions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case challenge
        case creationOptions = "creation_options"
        case requestOptions = "request_options"
    }
}
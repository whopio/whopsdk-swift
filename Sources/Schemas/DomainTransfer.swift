import Foundation

public struct DomainTransfer: Codable, Hashable, Sendable {
    /// The code that takes the domain. For an `internal` move it starts `whop_dt_`, and the receiving Whop account enters it as `registration.auth_code` when it creates or updates the domain. Returned when the response is a single domain and you can manage it; `null` otherwise.
    public let code: Nullable<String>
    /// Where the domain is moving. `internal` is another Whop account.
    public let destination: DomainTransferDestination
    /// `ready` while the code waits to be used. `pending` once it has: Whop removes the domain's email, Apple Pay and pixel from this account, then moves the registration and removes the domain from this account.
    public let state: DomainTransferState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: Nullable<String>,
        destination: DomainTransferDestination,
        state: DomainTransferState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.destination = destination
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.destination = try container.decode(DomainTransferDestination.self, forKey: .destination)
        self.state = try container.decode(DomainTransferState.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.destination, forKey: .destination)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case destination
        case state
    }
}
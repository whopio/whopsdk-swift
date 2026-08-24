import Foundation

public struct CreateDepositsResponse: Codable, Hashable, Sendable {
    /// Account ID of the destination owner. Null for raw wallet address destinations.
    public let accountId: Nullable<String>
    /// Requested deposit amount.
    public let amount: String?
    /// URL of the hosted deposit page. Only present for business destinations.
    public let hostedUrl: Nullable<String>
    /// Metadata from the request.
    public let metadata: [String: JSONValue]
    /// Available deposit methods for destination.
    public let methods: CreateDepositsResponseMethods
    public let object: CreateDepositsResponseObject
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        amount: String? = nil,
        hostedUrl: Nullable<String>,
        metadata: [String: JSONValue],
        methods: CreateDepositsResponseMethods,
        object: CreateDepositsResponseObject,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amount = amount
        self.hostedUrl = hostedUrl
        self.metadata = metadata
        self.methods = methods
        self.object = object
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amount = try container.decodeIfPresent(String.self, forKey: .amount)
        self.hostedUrl = try container.decode(Nullable<String>.self, forKey: .hostedUrl)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.methods = try container.decode(CreateDepositsResponseMethods.self, forKey: .methods)
        self.object = try container.decode(CreateDepositsResponseObject.self, forKey: .object)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encode(self.hostedUrl, forKey: .hostedUrl)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.methods, forKey: .methods)
        try container.encode(self.object, forKey: .object)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amount
        case hostedUrl = "hosted_url"
        case metadata
        case methods
        case object
    }
}
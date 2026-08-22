import Foundation

public struct PostCardApplicationApprovedPayloadData: Codable, Hashable, Sendable {
    /// URL where the applicant completes additional identity verification.
    public let hostedUrl: Nullable<String>
    /// Card application ID, prefixed `ciac_`.
    public let id: String
    public let object: PostCardApplicationApprovedPayloadDataObject
    /// The application status.
    public let status: PostCardApplicationApprovedPayloadDataStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        hostedUrl: Nullable<String>,
        id: String,
        object: PostCardApplicationApprovedPayloadDataObject,
        status: PostCardApplicationApprovedPayloadDataStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.hostedUrl = hostedUrl
        self.id = id
        self.object = object
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hostedUrl = try container.decode(Nullable<String>.self, forKey: .hostedUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(PostCardApplicationApprovedPayloadDataObject.self, forKey: .object)
        self.status = try container.decode(PostCardApplicationApprovedPayloadDataStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.hostedUrl, forKey: .hostedUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case hostedUrl = "hosted_url"
        case id
        case object
        case status
    }
}
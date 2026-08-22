import Foundation

/// An object representing an asynchronous job.
public struct ApproveEntriesResponse: Codable, Hashable, Sendable {
    /// The ID of the job.
    public let jobId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        jobId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.jobId = jobId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.jobId = try container.decode(String.self, forKey: .jobId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.jobId, forKey: .jobId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case jobId = "job_id"
    }
}
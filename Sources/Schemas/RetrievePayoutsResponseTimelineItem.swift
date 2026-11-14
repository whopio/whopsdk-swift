import Foundation

public struct RetrievePayoutsResponseTimelineItem: Codable, Hashable, Sendable {
    /// Failure message, only with payout:destination:read.
    public let errorMessage: Nullable<String>
    public let estimatedArrival: Nullable<Date>
    public let status: RetrievePayoutsResponseTimelineItemStatus
    /// Informational event detail; security_review identifies manual review.
    public let statusDetail: Nullable<String>
    public let timestamp: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        errorMessage: Nullable<String>,
        estimatedArrival: Nullable<Date>,
        status: RetrievePayoutsResponseTimelineItemStatus,
        statusDetail: Nullable<String>,
        timestamp: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.errorMessage = errorMessage
        self.estimatedArrival = estimatedArrival
        self.status = status
        self.statusDetail = statusDetail
        self.timestamp = timestamp
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.estimatedArrival = try container.decode(Nullable<Date>.self, forKey: .estimatedArrival)
        self.status = try container.decode(RetrievePayoutsResponseTimelineItemStatus.self, forKey: .status)
        self.statusDetail = try container.decode(Nullable<String>.self, forKey: .statusDetail)
        self.timestamp = try container.decode(Nullable<Date>.self, forKey: .timestamp)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusDetail, forKey: .statusDetail)
        try container.encode(self.timestamp, forKey: .timestamp)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case errorMessage = "error_message"
        case estimatedArrival = "estimated_arrival"
        case status
        case statusDetail = "status_detail"
        case timestamp
    }
}
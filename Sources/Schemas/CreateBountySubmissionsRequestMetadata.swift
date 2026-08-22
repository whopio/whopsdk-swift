import Foundation

/// Optional capture metadata describing where and how the footage was recorded. Persisted on the submission. On a `data_capture` bounty every field except `fov` is required whenever metadata is provided.
public struct CreateBountySubmissionsRequestMetadata: Codable, Hashable, Sendable {
    /// City the footage was recorded in.
    public let city: Nullable<String>?
    /// Country the footage was recorded in.
    public let country: Nullable<String>?
    /// Device the footage was recorded on.
    public let device: Nullable<String>?
    /// Horizontal field of view in degrees.
    public let fov: Nullable<Int>?
    /// Identifier of the person who recorded the footage.
    public let `operator`: Nullable<String>?
    /// Site or venue the footage was recorded at.
    public let site: Nullable<String>?
    /// Station or position within the site.
    public let station: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        device: Nullable<String>? = nil,
        fov: Nullable<Int>? = nil,
        operator: Nullable<String>? = nil,
        site: Nullable<String>? = nil,
        station: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.device = device
        self.fov = fov
        self.operator = `operator`
        self.site = site
        self.station = station
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.device = try container.decodeNullableIfPresent(String.self, forKey: .device)
        self.fov = try container.decodeNullableIfPresent(Int.self, forKey: .fov)
        self.operator = try container.decodeNullableIfPresent(String.self, forKey: .operator)
        self.site = try container.decodeNullableIfPresent(String.self, forKey: .site)
        self.station = try container.decodeNullableIfPresent(String.self, forKey: .station)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.device, forKey: .device)
        try container.encodeNullableIfPresent(self.fov, forKey: .fov)
        try container.encodeNullableIfPresent(self.operator, forKey: .operator)
        try container.encodeNullableIfPresent(self.site, forKey: .site)
        try container.encodeNullableIfPresent(self.station, forKey: .station)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case device
        case fov
        case `operator`
        case site
        case station
    }
}
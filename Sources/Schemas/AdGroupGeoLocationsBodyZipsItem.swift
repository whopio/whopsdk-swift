import Foundation

public enum AdGroupGeoLocationsBodyZipsItem: Codable, Hashable, Sendable {
    case string(String)
    case adGroupGeoLocationsBodyZipsItemKey(AdGroupGeoLocationsBodyZipsItemKey)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(AdGroupGeoLocationsBodyZipsItemKey.self) {
            self = .adGroupGeoLocationsBodyZipsItemKey(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .adGroupGeoLocationsBodyZipsItemKey(let value):
            try container.encode(value)
        }
    }
}
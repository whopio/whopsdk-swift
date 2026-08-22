import Foundation

public enum CreateAudiencesResponse: Codable, Hashable, Sendable {
    case audience(Audience)
    case createAudiencesResponseData(CreateAudiencesResponseData)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Audience.self) {
            self = .audience(value)
        } else if let value = try? container.decode(CreateAudiencesResponseData.self) {
            self = .createAudiencesResponseData(value)
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
        case .audience(let value):
            try container.encode(value)
        case .createAudiencesResponseData(let value):
            try container.encode(value)
        }
    }
}
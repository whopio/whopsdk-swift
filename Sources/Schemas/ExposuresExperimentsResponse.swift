import Foundation

public enum ExposuresExperimentsResponse: Codable, Hashable, Sendable {
    case experimentExposure(ExperimentExposure)
    case experimentExposureBatch(ExperimentExposureBatch)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ExperimentExposure.self) {
            self = .experimentExposure(value)
        } else if let value = try? container.decode(ExperimentExposureBatch.self) {
            self = .experimentExposureBatch(value)
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
        case .experimentExposure(let value):
            try container.encode(value)
        case .experimentExposureBatch(let value):
            try container.encode(value)
        }
    }
}
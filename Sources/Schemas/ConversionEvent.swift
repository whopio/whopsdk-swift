import Foundation

/// The pixel event optimized for. A standard event, or any custom pixel event name.
public enum ConversionEvent: Codable, Hashable, Sendable {
    case conversionEventZero(ConversionEventZero)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ConversionEventZero.self) {
            self = .conversionEventZero(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
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
        case .conversionEventZero(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}
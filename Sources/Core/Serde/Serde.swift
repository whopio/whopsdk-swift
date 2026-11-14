import Foundation

final class Serde {
    static var jsonEncoder: Foundation.JSONEncoder {
        let encoder = Foundation.JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        // Foundation makes no key-order promise for a keyed container, so without this
        // one request value encodes to different bytes on different calls. Whop
        // fingerprints Idempotency-Key over the body, so an unstable encoding turns a
        // safe retry into "this key was already used with a different request".
        encoder.outputFormatting = [.sortedKeys]
        return encoder
    }

    static var jsonDecoder: Foundation.JSONDecoder {
        let decoder = Foundation.JSONDecoder()
        // Use custom strategy for robust ISO 8601 date parsing with fractional seconds
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            let formatter = Foundation.ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

            if let date = formatter.date(from: dateString) {
                return date
            }

            // Fallback for dates without fractional seconds
            formatter.formatOptions = [.withInternetDateTime]
            if let date = formatter.date(from: dateString) {
                return date
            }

            throw Swift.DecodingError.dataCorruptedError(
                in: container, debugDescription: "Invalid date format: \(dateString)")
        }
        return decoder
    }
}

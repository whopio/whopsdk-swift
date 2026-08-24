import Foundation

public enum LedgerActivityResourceOwnerOwner: Codable, Hashable, Sendable {
    case ledgerActivityResourceOwnerOwnerLogoUrl(LedgerActivityResourceOwnerOwnerLogoUrl)
    case ledgerActivityResourceOwnerOwnerName(LedgerActivityResourceOwnerOwnerName)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(LedgerActivityResourceOwnerOwnerLogoUrl.self) {
            self = .ledgerActivityResourceOwnerOwnerLogoUrl(value)
        } else if let value = try? container.decode(LedgerActivityResourceOwnerOwnerName.self) {
            self = .ledgerActivityResourceOwnerOwnerName(value)
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
        case .ledgerActivityResourceOwnerOwnerLogoUrl(let value):
            try container.encode(value)
        case .ledgerActivityResourceOwnerOwnerName(let value):
            try container.encode(value)
        }
    }
}
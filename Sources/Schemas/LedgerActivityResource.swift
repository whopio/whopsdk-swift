import Foundation

/// Resource associated with this ledger activity.
public enum LedgerActivityResource: Codable, Hashable, Sendable {
    case ledgerActivityResourceLogoUrl(LedgerActivityResourceLogoUrl)
    case ledgerActivityResourceName(LedgerActivityResourceName)
    case ledgerActivityResourceTwo(LedgerActivityResourceTwo)
    case ledgerActivityResourceOwner(LedgerActivityResourceOwner)
    case ledgerActivityResourceBank(LedgerActivityResourceBank)
    case ledgerActivityResourceAccountReference(LedgerActivityResourceAccountReference)
    case ledgerActivityResourceAuthorizedAt(LedgerActivityResourceAuthorizedAt)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(LedgerActivityResourceLogoUrl.self) {
            self = .ledgerActivityResourceLogoUrl(value)
        } else if let value = try? container.decode(LedgerActivityResourceName.self) {
            self = .ledgerActivityResourceName(value)
        } else if let value = try? container.decode(LedgerActivityResourceTwo.self) {
            self = .ledgerActivityResourceTwo(value)
        } else if let value = try? container.decode(LedgerActivityResourceOwner.self) {
            self = .ledgerActivityResourceOwner(value)
        } else if let value = try? container.decode(LedgerActivityResourceBank.self) {
            self = .ledgerActivityResourceBank(value)
        } else if let value = try? container.decode(LedgerActivityResourceAccountReference.self) {
            self = .ledgerActivityResourceAccountReference(value)
        } else if let value = try? container.decode(LedgerActivityResourceAuthorizedAt.self) {
            self = .ledgerActivityResourceAuthorizedAt(value)
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
        case .ledgerActivityResourceLogoUrl(let value):
            try container.encode(value)
        case .ledgerActivityResourceName(let value):
            try container.encode(value)
        case .ledgerActivityResourceTwo(let value):
            try container.encode(value)
        case .ledgerActivityResourceOwner(let value):
            try container.encode(value)
        case .ledgerActivityResourceBank(let value):
            try container.encode(value)
        case .ledgerActivityResourceAccountReference(let value):
            try container.encode(value)
        case .ledgerActivityResourceAuthorizedAt(let value):
            try container.encode(value)
        }
    }
}
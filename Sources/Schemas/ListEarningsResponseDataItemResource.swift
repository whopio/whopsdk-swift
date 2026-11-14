import Foundation

/// The resource that generated the earning. For sales and ad spend earnings, it is the customer payment receipt. For transfer earnings, it is the balance transfer. For withdrawal earnings, it is the withdrawal. For card interchange earnings, it is the card transaction. For fixed reward earnings, it is the qualifying reward. For business referral earnings, it is the referred partner business's own commission.
public enum ListEarningsResponseDataItemResource: Codable, Hashable, Sendable {
    case nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>)
    case listEarningsResponseDataItemResourceOne(ListEarningsResponseDataItemResourceOne)
    case listEarningsResponseDataItemResourceTwo(ListEarningsResponseDataItemResourceTwo)
    case listEarningsResponseDataItemResourceMerchantName(ListEarningsResponseDataItemResourceMerchantName)
    case listEarningsResponseDataItemResourceSlug(ListEarningsResponseDataItemResourceSlug)
    case listEarningsResponseDataItemResourceFive(ListEarningsResponseDataItemResourceFive)
    case listEarningsResponseDataItemResourceCreatedAt(ListEarningsResponseDataItemResourceCreatedAt)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>.self) {
            self = .nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceOne.self) {
            self = .listEarningsResponseDataItemResourceOne(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceTwo.self) {
            self = .listEarningsResponseDataItemResourceTwo(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceMerchantName.self) {
            self = .listEarningsResponseDataItemResourceMerchantName(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceSlug.self) {
            self = .listEarningsResponseDataItemResourceSlug(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceFive.self) {
            self = .listEarningsResponseDataItemResourceFive(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceCreatedAt.self) {
            self = .listEarningsResponseDataItemResourceCreatedAt(value)
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
        case .nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(let value):
            try container.encode(value)
        case .listEarningsResponseDataItemResourceOne(let value):
            try container.encode(value)
        case .listEarningsResponseDataItemResourceTwo(let value):
            try container.encode(value)
        case .listEarningsResponseDataItemResourceMerchantName(let value):
            try container.encode(value)
        case .listEarningsResponseDataItemResourceSlug(let value):
            try container.encode(value)
        case .listEarningsResponseDataItemResourceFive(let value):
            try container.encode(value)
        case .listEarningsResponseDataItemResourceCreatedAt(let value):
            try container.encode(value)
        }
    }
}
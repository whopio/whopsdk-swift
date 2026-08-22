import Foundation

/// The resource that generated the earning: the customer payment receipt for sales and ad spend earnings, the balance transfer for transfer earnings, or the card transaction for card interchange earnings.
public enum ListEarningsResponseDataItemResource: Codable, Hashable, Sendable {
    case nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>)
    case listEarningsResponseDataItemResourceOne(ListEarningsResponseDataItemResourceOne)
    case listEarningsResponseDataItemResourceCreatedAt(ListEarningsResponseDataItemResourceCreatedAt)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Nullable<ListEarningsResponseDataItemResourceAlternativePaymentMethod>.self) {
            self = .nullableListEarningsResponseDataItemResourceAlternativePaymentMethod(value)
        } else if let value = try? container.decode(ListEarningsResponseDataItemResourceOne.self) {
            self = .listEarningsResponseDataItemResourceOne(value)
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
        case .listEarningsResponseDataItemResourceCreatedAt(let value):
            try container.encode(value)
        }
    }
}
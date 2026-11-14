import Foundation

public enum PaymentMethodListItem: Codable, Hashable, Sendable {
    /// A saved payment method with no type-specific details available.
    case basePaymentMethod(PaymentMethodListItemBasePaymentMethod)
    /// A saved card payment method, including brand, last four digits, and expiration details.
    case cardPaymentMethod(PaymentMethodListItemCardPaymentMethod)
    /// A saved Cash App payment method, including the buyer's cashtag and unique identifier.
    case cashappPaymentMethod(PaymentMethodListItemCashappPaymentMethod)
    /// A saved iDEAL payment method, including the customer's bank name and BIC code.
    case idealPaymentMethod(PaymentMethodListItemIdealPaymentMethod)
    /// A saved SEPA Direct Debit payment method, including the bank code, country, and last four IBAN digits.
    case sepaDebitPaymentMethod(PaymentMethodListItemSepaDebitPaymentMethod)
    /// A saved US bank account payment method, including bank name, last four digits, and account type.
    case usBankAccountPaymentMethod(PaymentMethodListItemUsBankAccountPaymentMethod)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .typename)
        switch discriminant {
        case "BasePaymentMethod":
            self = .basePaymentMethod(try PaymentMethodListItemBasePaymentMethod(from: decoder))
        case "CardPaymentMethod":
            self = .cardPaymentMethod(try PaymentMethodListItemCardPaymentMethod(from: decoder))
        case "CashappPaymentMethod":
            self = .cashappPaymentMethod(try PaymentMethodListItemCashappPaymentMethod(from: decoder))
        case "IdealPaymentMethod":
            self = .idealPaymentMethod(try PaymentMethodListItemIdealPaymentMethod(from: decoder))
        case "SepaDebitPaymentMethod":
            self = .sepaDebitPaymentMethod(try PaymentMethodListItemSepaDebitPaymentMethod(from: decoder))
        case "UsBankAccountPaymentMethod":
            self = .usBankAccountPaymentMethod(try PaymentMethodListItemUsBankAccountPaymentMethod(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .basePaymentMethod(let data):
            try container.encode("BasePaymentMethod", forKey: .typename)
            try data.encode(to: encoder)
        case .cardPaymentMethod(let data):
            try container.encode("CardPaymentMethod", forKey: .typename)
            try data.encode(to: encoder)
        case .cashappPaymentMethod(let data):
            try container.encode("CashappPaymentMethod", forKey: .typename)
            try data.encode(to: encoder)
        case .idealPaymentMethod(let data):
            try container.encode("IdealPaymentMethod", forKey: .typename)
            try data.encode(to: encoder)
        case .sepaDebitPaymentMethod(let data):
            try container.encode("SepaDebitPaymentMethod", forKey: .typename)
            try data.encode(to: encoder)
        case .usBankAccountPaymentMethod(let data):
            try container.encode("UsBankAccountPaymentMethod", forKey: .typename)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case typename
    }
}
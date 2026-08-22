import Foundation

public enum PaymentMethod: Codable, Hashable, Sendable {
    /// A saved payment method with no type-specific details available.
    case basePaymentMethod(PaymentMethodBasePaymentMethod)
    /// A saved card payment method, including brand, last four digits, and expiration details.
    case cardPaymentMethod(PaymentMethodCardPaymentMethod)
    /// A saved Cash App payment method, including the buyer's cashtag and unique identifier.
    case cashappPaymentMethod(PaymentMethodCashappPaymentMethod)
    /// A saved iDEAL payment method, including the customer's bank name and BIC code.
    case idealPaymentMethod(PaymentMethodIdealPaymentMethod)
    /// A Whop balance the buyer can pay with — their own, or an account's they hold permission to spend. Charged by naming its ledger id on a `saved` confirmation token — it is a live wallet, not a stored credential, so it cannot be vaulted or charged off-session.
    case platformBalancePaymentMethod(PaymentMethodPlatformBalancePaymentMethod)
    /// A saved SEPA Direct Debit payment method, including the bank code, country, and last four IBAN digits.
    case sepaDebitPaymentMethod(PaymentMethodSepaDebitPaymentMethod)
    /// A saved US bank account payment method, including bank name, last four digits, and account type.
    case usBankAccountPaymentMethod(PaymentMethodUsBankAccountPaymentMethod)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .typename)
        switch discriminant {
        case "BasePaymentMethod":
            self = .basePaymentMethod(try PaymentMethodBasePaymentMethod(from: decoder))
        case "CardPaymentMethod":
            self = .cardPaymentMethod(try PaymentMethodCardPaymentMethod(from: decoder))
        case "CashappPaymentMethod":
            self = .cashappPaymentMethod(try PaymentMethodCashappPaymentMethod(from: decoder))
        case "IdealPaymentMethod":
            self = .idealPaymentMethod(try PaymentMethodIdealPaymentMethod(from: decoder))
        case "PlatformBalancePaymentMethod":
            self = .platformBalancePaymentMethod(try PaymentMethodPlatformBalancePaymentMethod(from: decoder))
        case "SepaDebitPaymentMethod":
            self = .sepaDebitPaymentMethod(try PaymentMethodSepaDebitPaymentMethod(from: decoder))
        case "UsBankAccountPaymentMethod":
            self = .usBankAccountPaymentMethod(try PaymentMethodUsBankAccountPaymentMethod(from: decoder))
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
        case .platformBalancePaymentMethod(let data):
            try container.encode("PlatformBalancePaymentMethod", forKey: .typename)
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
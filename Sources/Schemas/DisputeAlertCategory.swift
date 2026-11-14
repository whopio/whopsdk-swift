import Foundation

/// What the cardholder claims. `fraud` when they say they didn't make the payment: always for an `early_fraud_warning`, and for Ethoca fraud alerts and Visa RDR cases filed under a fraud reason. `customer_dispute` when they made the payment but dispute it, such as a product not received or a canceled subscription. `null` when the alert carries no claim, such as an issuer's request for transaction documents.
public enum DisputeAlertCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case fraud
    case customerDispute = "customer_dispute"
}
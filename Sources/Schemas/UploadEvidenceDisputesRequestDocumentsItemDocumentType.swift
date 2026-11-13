import Foundation

/// What this document proves, in the processor's own evidence vocabulary. `return_policy`, `cancellation_policy`, and `terms_of_service` are the seller's policy documents — uploading one overrides the account's copy for this dispute (`return_policy`, `cancellation_policy`, and `customer_communication` also override the matching fixed evidence slot). `shipping_policy` is the seller's shipping terms. `customer_communication` is correspondence with the buyer — a support thread or chat log. `product_image` is a photo of the product or service the buyer received. `physical_fulfillment` is proof a physical order shipped and arrived; `digital_fulfillment` is proof the buyer accessed a digital product. `customer_order_history` is the buyer's past orders with this seller; `prior_transactions` is their broader payment history across the platform, for a fraud defense. `customer_session` is checkout forensics — IP, device fingerprint, AVS/CVV, 3D Secure result. `subscription` is membership lifecycle evidence — renewals, cancellation, reminders sent.
public enum UploadEvidenceDisputesRequestDocumentsItemDocumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case returnPolicy = "return_policy"
    case shippingPolicy = "shipping_policy"
    case cancellationPolicy = "cancellation_policy"
    case termsOfService = "terms_of_service"
    case physicalFulfillment = "physical_fulfillment"
    case customerOrderHistory = "customer_order_history"
    case productImage = "product_image"
    case priorTransactions = "prior_transactions"
    case customerSession = "customer_session"
    case digitalFulfillment = "digital_fulfillment"
    case subscription
    case customerCommunication = "customer_communication"
}
import Foundation

/// What this document proves. `return_policy`, `cancellation_policy` and `terms_of_service` are the seller's policy documents. A policy document replaces the account's copy for this dispute. `return_policy`, `cancellation_policy` and `customer_communication` also replace the matching fixed evidence slot. `shipping_policy` is the seller's shipping terms. `customer_communication` is correspondence with the buyer, such as a support thread or chat log. `product_image` is a photo of the product or service the buyer received. `physical_fulfillment` is proof that a physical order shipped and arrived. `digital_fulfillment` is proof that the buyer accessed a digital product. `customer_order_history` is the buyer's past orders with this seller. `prior_transactions` is the buyer's payment history across the platform, for a fraud defense. `customer_session` is checkout data, such as IP address, device fingerprint, AVS and CVV results, and the 3D Secure result. `subscription` is membership lifecycle evidence, such as renewals, cancellation and reminders sent. `complete_evidence` is the seller's whole response as one PDF of at most 19 pages, and it must be the only document. Whop sends a `complete_evidence` document to the processor in place of every other evidence field, attachment and document.
public enum UpdateDisputesRequestEvidenceDocumentsItemDocumentType: String, Codable, Hashable, CaseIterable, Sendable {
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
    case completeEvidence = "complete_evidence"
}
import Foundation

/// What kind of evidence the document is.
public enum UploadEvidenceDisputesRequestDocumentsItemDocumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case returnPolicy = "return_policy"
    case shippingPolicy = "shipping_policy"
    case physicalFulfillment = "physical_fulfillment"
    case customerOrderHistory = "customer_order_history"
    case productImage = "product_image"
    case priorTransactions = "prior_transactions"
    case customerSession = "customer_session"
    case digitalFulfillment = "digital_fulfillment"
    case subscription
}
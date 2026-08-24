import Foundation

public enum ConversionEventZero: String, Codable, Hashable, CaseIterable, Sendable {
    case purchase
    case addToCart = "add_to_cart"
    case initiatedCheckout = "initiated_checkout"
    case addPaymentInfo = "add_payment_info"
    case completeRegistration = "complete_registration"
    case lead
    case contentView = "content_view"
    case search
    case contact
    case customizeProduct = "customize_product"
    case donate
    case findLocation = "find_location"
    case schedule
    case startTrial = "start_trial"
    case submitApplication = "submit_application"
    case subscribe
}
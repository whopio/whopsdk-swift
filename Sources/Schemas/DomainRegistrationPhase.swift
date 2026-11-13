import Foundation

/// Where the registration is: awaiting payment, ordering at the registrar, transferring from another registrar, delegating DNS to Whop, held, expired, or releasing.
public enum DomainRegistrationPhase: String, Codable, Hashable, CaseIterable, Sendable {
    case awaitingPayment = "awaiting_payment"
    case ordering
    case transferring
    case delegating
    case held
    case expired
    case failed
    case releasing
}
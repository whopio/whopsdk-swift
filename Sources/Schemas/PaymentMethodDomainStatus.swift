import Foundation

/// Verification status. `pending` means the provider could not fetch the domain-association file yet; only `verified` domains show wallet payment methods at checkout.
public enum PaymentMethodDomainStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case verified
}
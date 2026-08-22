import Foundation

/// Wallet provider the domain is registered with.
public enum PaymentMethodDomainProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case apple
}
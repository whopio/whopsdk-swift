import Foundation

public enum ListPaymentMethodDomainsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case verified
}
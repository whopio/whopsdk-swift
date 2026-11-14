import Foundation

/// The webhook event type
public enum PostAccountFinancingDeniedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case accountFinancingDenied = "account.financing_denied"
}
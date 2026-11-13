import Foundation

/// The webhook event type
public enum PostAccountFinancingApprovedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case accountFinancingApproved = "account.financing_approved"
}
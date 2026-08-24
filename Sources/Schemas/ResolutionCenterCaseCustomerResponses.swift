import Foundation

/// The types of responses a customer can make to a resolution.
public enum ResolutionCenterCaseCustomerResponses: String, Codable, Hashable, CaseIterable, Sendable {
    case respond
    case appeal
    case withdraw
}
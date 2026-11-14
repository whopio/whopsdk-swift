import Foundation

/// The webhook event type
public enum PostDomainUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case domainUpdated = "domain.updated"
}
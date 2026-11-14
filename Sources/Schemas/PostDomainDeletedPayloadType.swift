import Foundation

/// The webhook event type
public enum PostDomainDeletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case domainDeleted = "domain.deleted"
}
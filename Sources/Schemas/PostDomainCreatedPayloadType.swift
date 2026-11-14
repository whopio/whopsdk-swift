import Foundation

/// The webhook event type
public enum PostDomainCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case domainCreated = "domain.created"
}
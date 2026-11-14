import Foundation

/// The webhook event type
public enum PostEventsCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case eventsCreated = "events.created"
}
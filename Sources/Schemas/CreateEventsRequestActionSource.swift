import Foundation

/// The channel where an event originated
public enum CreateEventsRequestActionSource: String, Codable, Hashable, CaseIterable, Sendable {
    case email
    case website
    case app
    case phoneCall = "phone_call"
    case chat
    case physicalStore = "physical_store"
    case systemGenerated = "system_generated"
    case businessMessaging = "business_messaging"
    case other
}
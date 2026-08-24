import Foundation

/// The application status.
public enum PostCardApplicationApprovedPayloadDataStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case approved
    case pending
    case manualReview = "manual_review"
    case denied
    case locked
    case canceled
    case needsVerification = "needs_verification"
    case needsInformation = "needs_information"
}
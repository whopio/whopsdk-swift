import Foundation

/// The approval state, or null for requests without an approval process.
public enum PartnerReferralRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case accepted
    case denied
    case cancelled
}
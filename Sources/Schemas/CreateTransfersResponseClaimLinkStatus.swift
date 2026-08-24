import Foundation

/// A newly funded claim link is always `pending` — it stays claimable until it is fully claimed, canceled, or expires.
public enum CreateTransfersResponseClaimLinkStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
}
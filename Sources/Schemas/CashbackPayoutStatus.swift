import Foundation

/// Request status. `processing` means background processing was queued, not that payment completed. `failed`, returned with HTTP `200`, means the queue rejected the request. Subsequent transaction failures retry automatically.
public enum CashbackPayoutStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case failed
}
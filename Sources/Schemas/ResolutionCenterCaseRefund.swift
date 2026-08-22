import Foundation

/// Whether money moved and off whose balance: `none`, `merchant`, or `platform` (Whop refunded the customer and the merchant kept the funds). Independent of `outcome` — a case the merchant won can still carry a platform refund. `null` while the case is open, and on older closed cases that predate this being recorded.
public enum ResolutionCenterCaseRefund: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case merchant
    case platform
}
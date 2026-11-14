import Foundation

/// The reason funds are held: `reserve`, `bnpl`, `sequra`, `fraud_hold`, or `preshipment_hold`.
public enum PaymentHoldType: String, Codable, Hashable, CaseIterable, Sendable {
    case reserve
    case bnpl
    case sequra
    case fraudHold = "fraud_hold"
    case preshipmentHold = "preshipment_hold"
}
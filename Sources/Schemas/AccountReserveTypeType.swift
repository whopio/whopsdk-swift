import Foundation

/// Why this part of the balance is held. `regular` is the account's standing risk reserve; `bnpl` and `sequra` cover buy-now-pay-later settlement; `preshipment_hold` covers a physical order that has not shipped yet; `fraud_hold` is held while activity is reviewed.
public enum AccountReserveTypeType: String, Codable, Hashable, CaseIterable, Sendable {
    case regular
    case bnpl
    case sequra
    case fraudHold = "fraud_hold"
    case preshipmentHold = "preshipment_hold"
}
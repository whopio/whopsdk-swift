import Foundation

/// What the issuer sent. `early_fraud_warning` is a fraud report on a settled payment (Visa TC40 / Mastercard SAFE) — refunding still avoids the chargeback, and Whop never charges a fee for one. `dispute_alert` is a pre-dispute notice from the issuer's alert network, which Whop pays for and passes on as a fee. `rapid_dispute_resolution` is a Visa RDR case the network already closed by refunding the payment — nothing is left to act on.
public enum DisputeAlertType: String, Codable, Hashable, CaseIterable, Sendable {
    case earlyFraudWarning = "early_fraud_warning"
    case disputeAlert = "dispute_alert"
    case rapidDisputeResolution = "rapid_dispute_resolution"
}
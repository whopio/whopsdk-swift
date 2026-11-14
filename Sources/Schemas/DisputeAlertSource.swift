import Foundation

/// The network program that sent the alert, which `type` alone doesn't tell apart. `ethoca` for Mastercard Ethoca, `cdrn` for Visa Verifi CDRN, `rdr` for Visa RDR, `tc40` / `safe` for a Visa / Mastercard fraud report, `paypal` for a PayPal alert. `null` when the network didn't say.
public enum DisputeAlertSource: String, Codable, Hashable, CaseIterable, Sendable {
    case ethoca
    case cdrn
    case rdr
    case tc40
    case safe
    case paypal
}
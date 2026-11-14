import Foundation

public enum AcceptCommissionAdvanceBusinessesRequestAcknowledgmentsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case commissionReplacement = "commission_replacement"
    case clawback
    case term
}
import Foundation

/// The type of dispute alert.
public enum DisputeAlertTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case dispute
    case disputeRdr = "dispute_rdr"
    case fraud
}
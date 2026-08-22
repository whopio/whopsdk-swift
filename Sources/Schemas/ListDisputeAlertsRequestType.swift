import Foundation

public enum ListDisputeAlertsRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case earlyFraudWarning = "early_fraud_warning"
    case disputeAlert = "dispute_alert"
    case rapidDisputeResolution = "rapid_dispute_resolution"
}
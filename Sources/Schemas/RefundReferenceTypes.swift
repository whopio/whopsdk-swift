import Foundation

/// The type of refund reference that was made available by the payment provider.
public enum RefundReferenceTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case acquirerReferenceNumber = "acquirer_reference_number"
    case retrievalReferenceNumber = "retrieval_reference_number"
    case systemTraceAuditNumber = "system_trace_audit_number"
}
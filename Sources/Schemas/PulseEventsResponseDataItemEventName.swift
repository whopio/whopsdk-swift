import Foundation

/// The underlying event recorded. Every movement on this feed is a ledger line, so switch on `type` rather than this.
public enum PulseEventsResponseDataItemEventName: String, Codable, Hashable, CaseIterable, Sendable {
    case ledgerLineCreated = "ledger_line.created"
}
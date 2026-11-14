import Foundation

/// DNS record type.
public enum DomainDnsRecordType: String, Codable, Hashable, CaseIterable, Sendable {
    case txt = "TXT"
    case cname = "CNAME"
    case a = "A"
    case aaaa = "AAAA"
}
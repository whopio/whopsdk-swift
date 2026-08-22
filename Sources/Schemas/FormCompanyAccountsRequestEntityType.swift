import Foundation

/// Legal entity type to form. Defaults to `llc`.
public enum FormCompanyAccountsRequestEntityType: String, Codable, Hashable, CaseIterable, Sendable {
    case llc
    case cCorp = "c_corp"
}
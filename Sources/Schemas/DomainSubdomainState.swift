import Foundation

/// Whether Whop has published the subdomain's DNS records in its root domain's zone. It stays `pending` until the root domain is set up.
public enum DomainSubdomainState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}
import Foundation

public enum ListSupportedMethodsRequestPartyType: String, Codable, Hashable, CaseIterable, Sendable {
    case firstParty = "first_party"
    case thirdParty = "third_party"
}
import Foundation

/// Optional native input format for a text response.
public enum CreateVerificationsResponseRequestedInformationItemResponseType: String, Codable, Hashable, CaseIterable, Sendable {
    case yesNo = "yes_no"
    case yesNoNa = "yes_no_na"
    case date
    case url
    case number
    case tel
}
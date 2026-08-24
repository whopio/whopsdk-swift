import Foundation

/// Legal entity ending appended to `business_name`. LLC formations accept `LLC`, `L.L.C`, `L.L.C.` or `Limited Liability Company` and default to `LLC`; C-Corp formations accept `Inc`, `Inc.`, `Incorporated`, `Corp.`, `Corporation`, `C Corp`, `C Corporation`, `CCorp` or `Company` and default to `Inc.`. Unrecognized values fall back to the default for the entity type.
public enum FormCompanyAccountsRequestEntitySuffix: String, Codable, Hashable, CaseIterable, Sendable {
    case llc = "LLC"
    case llcDotted = "L.L.C"
    case llcDottedTrailingPeriod = "L.L.C."
    case limitedLiabilityCompany = "Limited Liability Company"
    case inc = "Inc"
    case incTrailingPeriod = "Inc."
    case incorporated = "Incorporated"
    case corp = "Corp."
    case corporation = "Corporation"
    case cCorp = "C Corp"
    case cCorporation = "C Corporation"
    case cCorpOneWord = "CCorp"
    case company = "Company"
}
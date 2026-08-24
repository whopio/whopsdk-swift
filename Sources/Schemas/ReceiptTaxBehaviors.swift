import Foundation

/// The type of tax inclusivity applied to the receipt, for determining whether the tax is included in the final price, or paid on top.
public enum ReceiptTaxBehaviors: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
    case unspecified
    case unableToCollect = "unable_to_collect"
}
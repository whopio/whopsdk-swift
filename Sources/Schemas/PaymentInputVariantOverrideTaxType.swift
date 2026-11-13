import Foundation

/// Whether the variant's price includes tax: `inclusive` (tax is included in the price), `exclusive` (tax is added on top), or `unspecified`. Omit it or pass `null` to use the account's tax setting. On an account enrolled in the Whop tax service, `inclusive` or `exclusive` replaces the account's setting and `unspecified` keeps it. Otherwise it applies only where the account is the merchant of record: `inclusive` or `exclusive` replaces the account's setting when the account collects tax, and `unspecified` means the variant collects no tax. Where Whop is the merchant of record, the account's setting applies. Variants that differ only in this value are different variants.
public enum PaymentInputVariantOverrideTaxType: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
    case unspecified
}
import Foundation

public struct PaymentVoucher: Codable, Hashable, Sendable {
    /// Exactly what the buyer must pay, in the charged currency.
    public let amount: Money?
    /// The barcode's contents, when the voucher carries one — render it in the symbology named by `barcode_format`.
    public let barcode: String?
    /// The symbology `barcode` is encoded in, such as `CODE_128`.
    public let barcodeFormat: String?
    /// Who the payment is made out to.
    public let companyName: String?
    /// A hosted page with the complete, printable instructions. If you would rather not render the details yourself, send the buyer here.
    public let documentUrl: String?
    /// When the voucher stops being payable, as an ISO 8601 timestamp.
    public let expiresAt: String?
    /// URL of that network's logo.
    public let providerLogo: String?
    /// The network the buyer pays at, such as OXXO.
    public let providerName: String?
    /// The voucher's number — what the buyer reads out or types at the counter to pay.
    public let reference: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money? = nil,
        barcode: String? = nil,
        barcodeFormat: String? = nil,
        companyName: String? = nil,
        documentUrl: String? = nil,
        expiresAt: String? = nil,
        providerLogo: String? = nil,
        providerName: String? = nil,
        reference: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.barcode = barcode
        self.barcodeFormat = barcodeFormat
        self.companyName = companyName
        self.documentUrl = documentUrl
        self.expiresAt = expiresAt
        self.providerLogo = providerLogo
        self.providerName = providerName
        self.reference = reference
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decodeIfPresent(Money.self, forKey: .amount)
        self.barcode = try container.decodeIfPresent(String.self, forKey: .barcode)
        self.barcodeFormat = try container.decodeIfPresent(String.self, forKey: .barcodeFormat)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.documentUrl = try container.decodeIfPresent(String.self, forKey: .documentUrl)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.providerLogo = try container.decodeIfPresent(String.self, forKey: .providerLogo)
        self.providerName = try container.decodeIfPresent(String.self, forKey: .providerName)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.barcode, forKey: .barcode)
        try container.encodeIfPresent(self.barcodeFormat, forKey: .barcodeFormat)
        try container.encodeIfPresent(self.companyName, forKey: .companyName)
        try container.encodeIfPresent(self.documentUrl, forKey: .documentUrl)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.providerLogo, forKey: .providerLogo)
        try container.encodeIfPresent(self.providerName, forKey: .providerName)
        try container.encodeIfPresent(self.reference, forKey: .reference)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case barcode
        case barcodeFormat = "barcode_format"
        case companyName = "company_name"
        case documentUrl = "document_url"
        case expiresAt = "expires_at"
        case providerLogo = "provider_logo"
        case providerName = "provider_name"
        case reference
    }
}
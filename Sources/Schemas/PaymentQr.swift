import Foundation

public struct PaymentQr: Codable, Hashable, Sendable {
    /// Exactly what the buyer must pay, in the charged currency.
    public let amount: Money?
    /// The code the buyer pastes into their payment app instead of scanning, such as Pix's copy-and-paste code, so they can pay from the device showing the QR. Only present for methods that accept a pasted code.
    public let copyCode: String?
    /// A hosted page with the complete, printable instructions. If you would rather not render the details yourself, send the buyer here.
    public let documentUrl: String?
    /// When the code stops being payable, as an ISO 8601 timestamp.
    public let expiresAt: String?
    /// An account key the buyer can pay to directly (Colombia's Bre-B llave), for apps that take a key instead of a scan.
    public let key: String?
    /// The QR code's contents, ready to render as a scannable image — `qr_format` says how it is encoded.
    public let qrCode: String?
    /// How `qr_code` is encoded.
    public let qrFormat: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money? = nil,
        copyCode: String? = nil,
        documentUrl: String? = nil,
        expiresAt: String? = nil,
        key: String? = nil,
        qrCode: String? = nil,
        qrFormat: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.copyCode = copyCode
        self.documentUrl = documentUrl
        self.expiresAt = expiresAt
        self.key = key
        self.qrCode = qrCode
        self.qrFormat = qrFormat
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decodeIfPresent(Money.self, forKey: .amount)
        self.copyCode = try container.decodeIfPresent(String.self, forKey: .copyCode)
        self.documentUrl = try container.decodeIfPresent(String.self, forKey: .documentUrl)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.qrCode = try container.decodeIfPresent(String.self, forKey: .qrCode)
        self.qrFormat = try container.decodeIfPresent(String.self, forKey: .qrFormat)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.copyCode, forKey: .copyCode)
        try container.encodeIfPresent(self.documentUrl, forKey: .documentUrl)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.qrCode, forKey: .qrCode)
        try container.encodeIfPresent(self.qrFormat, forKey: .qrFormat)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case copyCode = "copy_code"
        case documentUrl = "document_url"
        case expiresAt = "expires_at"
        case key
        case qrCode = "qr_code"
        case qrFormat = "qr_format"
    }
}
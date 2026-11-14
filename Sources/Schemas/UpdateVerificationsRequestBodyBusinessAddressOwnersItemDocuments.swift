import Foundation

/// The owner's identity document and selfie, each the ID of a ready file uploaded with Create File and not yet attached to anything else, prefixed `file_`. Send every slot for `document_type` plus `selfie`. Document files can be a PDF, JPEG, or PNG and the selfie a JPEG or PNG, each up to 10MB. They're sent to the verification provider in the background: the owner reads `processing` until then, and `action_required`, with a `rejection_reason` on each document, if a file couldn't be used.
public struct UpdateVerificationsRequestBodyBusinessAddressOwnersItemDocuments: Codable, Hashable, Sendable {
    /// File ID of the back of the driver's license. Required when `document_type` is `drivers`.
    public let driversBack: String?
    /// File ID of the front of the driver's license. Required when `document_type` is `drivers`.
    public let driversFront: String?
    /// File ID of the back of the ID card. Required when `document_type` is `id_card`.
    public let idCardBack: String?
    /// File ID of the front of the ID card. Required when `document_type` is `id_card`.
    public let idCardFront: String?
    /// File ID of the passport's photo page. Required when `document_type` is `passport`.
    public let passportFront: String?
    /// File ID of the back of the residence permit. Required when `document_type` is `residence_permit`.
    public let residencePermitBack: String?
    /// File ID of the front of the residence permit. Required when `document_type` is `residence_permit`.
    public let residencePermitFront: String?
    /// File ID of a photo of the owner's face. Must be a JPEG or PNG. Required, except on Update Verification for an owner whose selfie already passed.
    public let selfie: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        driversBack: String? = nil,
        driversFront: String? = nil,
        idCardBack: String? = nil,
        idCardFront: String? = nil,
        passportFront: String? = nil,
        residencePermitBack: String? = nil,
        residencePermitFront: String? = nil,
        selfie: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.driversBack = driversBack
        self.driversFront = driversFront
        self.idCardBack = idCardBack
        self.idCardFront = idCardFront
        self.passportFront = passportFront
        self.residencePermitBack = residencePermitBack
        self.residencePermitFront = residencePermitFront
        self.selfie = selfie
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.driversBack = try container.decodeIfPresent(String.self, forKey: .driversBack)
        self.driversFront = try container.decodeIfPresent(String.self, forKey: .driversFront)
        self.idCardBack = try container.decodeIfPresent(String.self, forKey: .idCardBack)
        self.idCardFront = try container.decodeIfPresent(String.self, forKey: .idCardFront)
        self.passportFront = try container.decodeIfPresent(String.self, forKey: .passportFront)
        self.residencePermitBack = try container.decodeIfPresent(String.self, forKey: .residencePermitBack)
        self.residencePermitFront = try container.decodeIfPresent(String.self, forKey: .residencePermitFront)
        self.selfie = try container.decodeIfPresent(String.self, forKey: .selfie)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.driversBack, forKey: .driversBack)
        try container.encodeIfPresent(self.driversFront, forKey: .driversFront)
        try container.encodeIfPresent(self.idCardBack, forKey: .idCardBack)
        try container.encodeIfPresent(self.idCardFront, forKey: .idCardFront)
        try container.encodeIfPresent(self.passportFront, forKey: .passportFront)
        try container.encodeIfPresent(self.residencePermitBack, forKey: .residencePermitBack)
        try container.encodeIfPresent(self.residencePermitFront, forKey: .residencePermitFront)
        try container.encodeIfPresent(self.selfie, forKey: .selfie)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case driversBack = "drivers_back"
        case driversFront = "drivers_front"
        case idCardBack = "id_card_back"
        case idCardFront = "id_card_front"
        case passportFront = "passport_front"
        case residencePermitBack = "residence_permit_back"
        case residencePermitFront = "residence_permit_front"
        case selfie
    }
}
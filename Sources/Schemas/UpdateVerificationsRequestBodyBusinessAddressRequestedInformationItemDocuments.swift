import Foundation

/// Answer for an `id_document` item: the same slot keys Create Verification takes, so the key names both the document and the side. Send every slot for the ID you are uploading — `PASSPORT` is `passport_front`; `ID_CARD`, `DRIVERS` and `RESIDENCE_PERMIT` take a front and a back. Each value is a direct upload ID, or a `file_`-prefixed attachment ID to reuse an uploaded document.
public struct UpdateVerificationsRequestBodyBusinessAddressRequestedInformationItemDocuments: Codable, Hashable, Sendable {
    /// Back of the driver's license.
    public let driversBack: String?
    /// Front of the driver's license.
    public let driversFront: String?
    /// Back of the ID card.
    public let idCardBack: String?
    /// Front of the ID card.
    public let idCardFront: String?
    /// Photo page of the passport.
    public let passportFront: String?
    /// Back of the residence permit.
    public let residencePermitBack: String?
    /// Front of the residence permit.
    public let residencePermitFront: String?
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
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.driversBack = driversBack
        self.driversFront = driversFront
        self.idCardBack = idCardBack
        self.idCardFront = idCardFront
        self.passportFront = passportFront
        self.residencePermitBack = residencePermitBack
        self.residencePermitFront = residencePermitFront
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
    }
}
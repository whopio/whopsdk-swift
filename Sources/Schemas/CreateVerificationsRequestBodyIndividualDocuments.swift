import Foundation

/// Identity document files, each value the file's raw bytes base64-encoded (JPEG, PNG, or PDF, up to 5MB per file before encoding). Sending this object verifies the person from the files in this request instead of a hosted session — individual verifications only, and the request must also carry `document_type`, `first_name`, `last_name`, `date_of_birth`, `country`, `phone`, `tax_identification_number`, and an `address` with `line1`, `city`, `state`, and `postal_code`. Send every slot for your `document_type` — a missing or rejected file fails the whole request and nothing is submitted; review starts automatically once every document is accepted. See [Identity documents](/developer/verification/identity-documents) for a full walkthrough.
public struct CreateVerificationsRequestBodyIndividualDocuments: Codable, Hashable, Sendable {
    /// Back of the driver's license, base64-encoded. Required when `document_type` is `drivers`.
    public let driversBack: String?
    /// Front of the driver's license, base64-encoded. Required when `document_type` is `drivers`.
    public let driversFront: String?
    /// Back of the ID card, base64-encoded. Required when `document_type` is `id_card`.
    public let idCardBack: String?
    /// Front of the ID card, base64-encoded. Required when `document_type` is `id_card`.
    public let idCardFront: String?
    /// Photo page of the passport, base64-encoded. Required when `document_type` is `passport`.
    public let passportFront: String?
    /// Back of the residence permit, base64-encoded. Required when `document_type` is `residence_permit`.
    public let residencePermitBack: String?
    /// Front of the residence permit, base64-encoded. Required when `document_type` is `residence_permit`.
    public let residencePermitFront: String?
    /// Photo of the person's face, base64-encoded. Always required, with every document type. Must be JPEG or PNG.
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
import Foundation

public struct UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItem: Codable, Hashable, Sendable {
    /// Answer for `address` items.
    public let address: UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemAddress?
    /// Identity number for an `id_document` answer.
    public let documentNumber: String?
    /// Answer for an `id_document` item: the same slot keys Create Verification takes, so the key names both the document and the side. Send every slot for the ID you are uploading — `PASSPORT` is `passport_front`; `ID_CARD`, `DRIVERS` and `RESIDENCE_PERMIT` take a front and a back. Each value is a direct upload ID, or a `file_`-prefixed attachment ID to reuse an uploaded document.
    public let documents: UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemDocuments?
    /// Answer for a `files` item, optional supporting documents for `text_with_files`, or the document an item's `alternative_document_label` names — a list of pages, first page first. Each entry is a direct upload ID, or a `file_`-prefixed attachment ID to reuse an uploaded document.
    public let files: [String]?
    /// Item ID from `requested_information`.
    public let id: String
    /// Two-letter ISO 3166-1 issuing country for an `id_document` answer.
    public let issuingCountry: String?
    /// Answer for `text`, `text_with_files`, `date`, `phone`, and `select` items, and the chosen document type for a `file` item that lists `options`.
    public let value: String?
    /// Whether `value` is raw input or a vault token.
    public let valueType: UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemValueType?
    /// Every chosen option for a `select` item that accepts more than one answer. Use `value` for every other item.
    public let values: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemAddress? = nil,
        documentNumber: String? = nil,
        documents: UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemDocuments? = nil,
        files: [String]? = nil,
        id: String,
        issuingCountry: String? = nil,
        value: String? = nil,
        valueType: UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemValueType? = nil,
        values: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.documentNumber = documentNumber
        self.documents = documents
        self.files = files
        self.id = id
        self.issuingCountry = issuingCountry
        self.value = value
        self.valueType = valueType
        self.values = values
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeIfPresent(UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemAddress.self, forKey: .address)
        self.documentNumber = try container.decodeIfPresent(String.self, forKey: .documentNumber)
        self.documents = try container.decodeIfPresent(UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemDocuments.self, forKey: .documents)
        self.files = try container.decodeIfPresent([String].self, forKey: .files)
        self.id = try container.decode(String.self, forKey: .id)
        self.issuingCountry = try container.decodeIfPresent(String.self, forKey: .issuingCountry)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.valueType = try container.decodeIfPresent(UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemValueType.self, forKey: .valueType)
        self.values = try container.decodeIfPresent([String].self, forKey: .values)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.documentNumber, forKey: .documentNumber)
        try container.encodeIfPresent(self.documents, forKey: .documents)
        try container.encodeIfPresent(self.files, forKey: .files)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.issuingCountry, forKey: .issuingCountry)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encodeIfPresent(self.valueType, forKey: .valueType)
        try container.encodeIfPresent(self.values, forKey: .values)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case documentNumber = "document_number"
        case documents
        case files
        case id
        case issuingCountry = "issuing_country"
        case value
        case valueType = "value_type"
        case values
    }
}
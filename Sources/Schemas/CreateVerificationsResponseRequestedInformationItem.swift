import Foundation

public struct CreateVerificationsResponseRequestedInformationItem: Codable, Hashable, Sendable {
    /// URL for a related action, such as completing liveness verification or viewing a payment. Absent when no action is available.
    public let actionUrl: String?
    /// A document that answers this item in place of `value`, such as an IRS EIN letter when the EIN could not be matched. Send its pages in `files`, with or without a corrected `value`. Absent when only `value` is accepted.
    public let alternativeDocumentLabel: String?
    /// Follow-up prompt shown with this requirement.
    public let detailsLabel: String?
    /// Whether the follow-up response is required when visible.
    public let detailsRequired: Bool?
    /// Selected option values that make the follow-up prompt visible.
    public let detailsVisibleFor: [String]?
    /// Present after a rejected submission.
    public let errors: [CreateVerificationsResponseRequestedInformationItemErrorsItem]?
    /// Requested information item ID, prefixed `inrqi_`.
    public let id: String
    /// Instruction to show the user. Carries the reviewer's note verbatim when there is one.
    public let label: String
    /// `true` when the item can be skipped.
    public let optional: Bool?
    /// The values `value` may take on a `select` item. On an `id_document` item these are the ID types accepted, and the chosen one decides which `documents` slots to send. Absent when the item has no choice to make.
    public let options: [String]?
    /// What is needed: a document name such as `bank_statement`, or a field key such as `ssn` or `identity_document`. Handle unrecognized values by `type`.
    public let requirement: String
    /// Optional native input format for a text response.
    public let responseType: CreateVerificationsResponseRequestedInformationItemResponseType?
    /// Whether a question with `options` accepts one value or multiple values.
    public let selectionMode: CreateVerificationsResponseRequestedInformationItemSelectionMode?
    /// Documents supplied with the requirement for context.
    public let supportingDocuments: [File]?
    /// Whether a written explanation may replace required supporting files.
    public let supportingFilesExplanationAllowed: Bool?
    /// Whether this requirement also needs supporting files.
    public let supportingFilesRequired: Bool?
    /// Selected option values that make the supporting-file input visible.
    public let supportingFilesVisibleFor: [String]?
    /// What to send as the answer, so you never have to infer it: `files` (a document, as a list of its pages), `id_document` (send `documents` with the slot keys for the ID you are uploading), `text`, `date`, `phone` or `select` (send `value`), `text_with_files` (send `value` and optional `files`), `address` (send `address`), or `liveness` (open `action_url`, then send `value` as `true` after completion).
    public let type: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actionUrl: String? = nil,
        alternativeDocumentLabel: String? = nil,
        detailsLabel: String? = nil,
        detailsRequired: Bool? = nil,
        detailsVisibleFor: [String]? = nil,
        errors: [CreateVerificationsResponseRequestedInformationItemErrorsItem]? = nil,
        id: String,
        label: String,
        optional: Bool? = nil,
        options: [String]? = nil,
        requirement: String,
        responseType: CreateVerificationsResponseRequestedInformationItemResponseType? = nil,
        selectionMode: CreateVerificationsResponseRequestedInformationItemSelectionMode? = nil,
        supportingDocuments: [File]? = nil,
        supportingFilesExplanationAllowed: Bool? = nil,
        supportingFilesRequired: Bool? = nil,
        supportingFilesVisibleFor: [String]? = nil,
        type: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actionUrl = actionUrl
        self.alternativeDocumentLabel = alternativeDocumentLabel
        self.detailsLabel = detailsLabel
        self.detailsRequired = detailsRequired
        self.detailsVisibleFor = detailsVisibleFor
        self.errors = errors
        self.id = id
        self.label = label
        self.optional = optional
        self.options = options
        self.requirement = requirement
        self.responseType = responseType
        self.selectionMode = selectionMode
        self.supportingDocuments = supportingDocuments
        self.supportingFilesExplanationAllowed = supportingFilesExplanationAllowed
        self.supportingFilesRequired = supportingFilesRequired
        self.supportingFilesVisibleFor = supportingFilesVisibleFor
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionUrl = try container.decodeIfPresent(String.self, forKey: .actionUrl)
        self.alternativeDocumentLabel = try container.decodeIfPresent(String.self, forKey: .alternativeDocumentLabel)
        self.detailsLabel = try container.decodeIfPresent(String.self, forKey: .detailsLabel)
        self.detailsRequired = try container.decodeIfPresent(Bool.self, forKey: .detailsRequired)
        self.detailsVisibleFor = try container.decodeIfPresent([String].self, forKey: .detailsVisibleFor)
        self.errors = try container.decodeIfPresent([CreateVerificationsResponseRequestedInformationItemErrorsItem].self, forKey: .errors)
        self.id = try container.decode(String.self, forKey: .id)
        self.label = try container.decode(String.self, forKey: .label)
        self.optional = try container.decodeIfPresent(Bool.self, forKey: .optional)
        self.options = try container.decodeIfPresent([String].self, forKey: .options)
        self.requirement = try container.decode(String.self, forKey: .requirement)
        self.responseType = try container.decodeIfPresent(CreateVerificationsResponseRequestedInformationItemResponseType.self, forKey: .responseType)
        self.selectionMode = try container.decodeIfPresent(CreateVerificationsResponseRequestedInformationItemSelectionMode.self, forKey: .selectionMode)
        self.supportingDocuments = try container.decodeIfPresent([File].self, forKey: .supportingDocuments)
        self.supportingFilesExplanationAllowed = try container.decodeIfPresent(Bool.self, forKey: .supportingFilesExplanationAllowed)
        self.supportingFilesRequired = try container.decodeIfPresent(Bool.self, forKey: .supportingFilesRequired)
        self.supportingFilesVisibleFor = try container.decodeIfPresent([String].self, forKey: .supportingFilesVisibleFor)
        self.type = try container.decode(String.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.actionUrl, forKey: .actionUrl)
        try container.encodeIfPresent(self.alternativeDocumentLabel, forKey: .alternativeDocumentLabel)
        try container.encodeIfPresent(self.detailsLabel, forKey: .detailsLabel)
        try container.encodeIfPresent(self.detailsRequired, forKey: .detailsRequired)
        try container.encodeIfPresent(self.detailsVisibleFor, forKey: .detailsVisibleFor)
        try container.encodeIfPresent(self.errors, forKey: .errors)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
        try container.encodeIfPresent(self.optional, forKey: .optional)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encode(self.requirement, forKey: .requirement)
        try container.encodeIfPresent(self.responseType, forKey: .responseType)
        try container.encodeIfPresent(self.selectionMode, forKey: .selectionMode)
        try container.encodeIfPresent(self.supportingDocuments, forKey: .supportingDocuments)
        try container.encodeIfPresent(self.supportingFilesExplanationAllowed, forKey: .supportingFilesExplanationAllowed)
        try container.encodeIfPresent(self.supportingFilesRequired, forKey: .supportingFilesRequired)
        try container.encodeIfPresent(self.supportingFilesVisibleFor, forKey: .supportingFilesVisibleFor)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actionUrl = "action_url"
        case alternativeDocumentLabel = "alternative_document_label"
        case detailsLabel = "details_label"
        case detailsRequired = "details_required"
        case detailsVisibleFor = "details_visible_for"
        case errors
        case id
        case label
        case optional
        case options
        case requirement
        case responseType = "response_type"
        case selectionMode = "selection_mode"
        case supportingDocuments = "supporting_documents"
        case supportingFilesExplanationAllowed = "supporting_files_explanation_allowed"
        case supportingFilesRequired = "supporting_files_required"
        case supportingFilesVisibleFor = "supporting_files_visible_for"
        case type
    }
}
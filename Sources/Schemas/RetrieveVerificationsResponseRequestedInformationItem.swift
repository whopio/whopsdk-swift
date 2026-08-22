import Foundation

public struct RetrieveVerificationsResponseRequestedInformationItem: Codable, Hashable, Sendable {
    /// Present after a rejected submission.
    public let errors: [RetrieveVerificationsResponseRequestedInformationItemErrorsItem]?
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
    /// What to send as the answer, so you never have to infer it: `files` (a document, as a list of its pages), `id_document` (send `documents` with the slot keys for the ID you are uploading), `text`, `date`, `phone` or `select` (send `value`), or `address` (send `address`).
    public let type: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        errors: [RetrieveVerificationsResponseRequestedInformationItemErrorsItem]? = nil,
        id: String,
        label: String,
        optional: Bool? = nil,
        options: [String]? = nil,
        requirement: String,
        type: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.errors = errors
        self.id = id
        self.label = label
        self.optional = optional
        self.options = options
        self.requirement = requirement
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.errors = try container.decodeIfPresent([RetrieveVerificationsResponseRequestedInformationItemErrorsItem].self, forKey: .errors)
        self.id = try container.decode(String.self, forKey: .id)
        self.label = try container.decode(String.self, forKey: .label)
        self.optional = try container.decodeIfPresent(Bool.self, forKey: .optional)
        self.options = try container.decodeIfPresent([String].self, forKey: .options)
        self.requirement = try container.decode(String.self, forKey: .requirement)
        self.type = try container.decode(String.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.errors, forKey: .errors)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
        try container.encodeIfPresent(self.optional, forKey: .optional)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encode(self.requirement, forKey: .requirement)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case errors
        case id
        case label
        case optional
        case options
        case requirement
        case type
    }
}
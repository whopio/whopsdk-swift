import Foundation

public struct FinancingRequirement: Codable, Hashable, Sendable {
    public let acceptedFileFormats: [String]
    /// The information requested, such as business_description or processing_statements.
    public let field: String
    /// Whether the requirement accepts no file, one file, or multiple files.
    public let fileCollectionType: FinancingRequirementFileCollectionType
    public let files: [File]
    /// Requirement ID to use when updating this application's answers.
    public let id: String
    /// Maximum size in bytes for each uploaded document.
    public let maxFileSize: Int
    /// Minimum characters per text answer, when specified.
    public let minimumLength: Nullable<Int>
    /// Saved maximum product price in its original currency. Null when unanswered or the saved legacy answer is invalid.
    public let money: Nullable<Money>
    public let options: [String]
    /// Whether this requirement must be completed before submission.
    public let required: Bool
    /// Whether the requirement accepts no text, one value, or multiple values.
    public let textCollectionType: FinancingRequirementTextCollectionType
    /// Expected text format. max_product_price uses money instead of values.
    public let textFormat: FinancingRequirementTextFormat
    public let values: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        acceptedFileFormats: [String],
        field: String,
        fileCollectionType: FinancingRequirementFileCollectionType,
        files: [File],
        id: String,
        maxFileSize: Int,
        minimumLength: Nullable<Int>,
        money: Nullable<Money>,
        options: [String],
        required: Bool,
        textCollectionType: FinancingRequirementTextCollectionType,
        textFormat: FinancingRequirementTextFormat,
        values: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.acceptedFileFormats = acceptedFileFormats
        self.field = field
        self.fileCollectionType = fileCollectionType
        self.files = files
        self.id = id
        self.maxFileSize = maxFileSize
        self.minimumLength = minimumLength
        self.money = money
        self.options = options
        self.required = required
        self.textCollectionType = textCollectionType
        self.textFormat = textFormat
        self.values = values
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.acceptedFileFormats = try container.decode([String].self, forKey: .acceptedFileFormats)
        self.field = try container.decode(String.self, forKey: .field)
        self.fileCollectionType = try container.decode(FinancingRequirementFileCollectionType.self, forKey: .fileCollectionType)
        self.files = try container.decode([File].self, forKey: .files)
        self.id = try container.decode(String.self, forKey: .id)
        self.maxFileSize = try container.decode(Int.self, forKey: .maxFileSize)
        self.minimumLength = try container.decode(Nullable<Int>.self, forKey: .minimumLength)
        self.money = try container.decode(Nullable<Money>.self, forKey: .money)
        self.options = try container.decode([String].self, forKey: .options)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.textCollectionType = try container.decode(FinancingRequirementTextCollectionType.self, forKey: .textCollectionType)
        self.textFormat = try container.decode(FinancingRequirementTextFormat.self, forKey: .textFormat)
        self.values = try container.decode([String].self, forKey: .values)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.acceptedFileFormats, forKey: .acceptedFileFormats)
        try container.encode(self.field, forKey: .field)
        try container.encode(self.fileCollectionType, forKey: .fileCollectionType)
        try container.encode(self.files, forKey: .files)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.maxFileSize, forKey: .maxFileSize)
        try container.encode(self.minimumLength, forKey: .minimumLength)
        try container.encode(self.money, forKey: .money)
        try container.encode(self.options, forKey: .options)
        try container.encode(self.required, forKey: .required)
        try container.encode(self.textCollectionType, forKey: .textCollectionType)
        try container.encode(self.textFormat, forKey: .textFormat)
        try container.encode(self.values, forKey: .values)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case acceptedFileFormats = "accepted_file_formats"
        case field
        case fileCollectionType = "file_collection_type"
        case files
        case id
        case maxFileSize = "max_file_size"
        case minimumLength = "minimum_length"
        case money
        case options
        case required
        case textCollectionType = "text_collection_type"
        case textFormat = "text_format"
        case values
    }
}
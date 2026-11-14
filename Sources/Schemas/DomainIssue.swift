import Foundation

public struct DomainIssue: Codable, Hashable, Sendable {
    /// The capability the issue is about.
    public let capability: DomainIssueCapability
    /// What needs attention, as a stable code.
    public let code: DomainIssueCode
    /// Code to add to the site to fix the issue, ready to copy. `null` when the issue needs none.
    public let codeBlock: Nullable<String>
    public let dnsRecords: [DomainDnsRecord]
    /// What needs attention and how to fix it.
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        capability: DomainIssueCapability,
        code: DomainIssueCode,
        codeBlock: Nullable<String>,
        dnsRecords: [DomainDnsRecord],
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.capability = capability
        self.code = code
        self.codeBlock = codeBlock
        self.dnsRecords = dnsRecords
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.capability = try container.decode(DomainIssueCapability.self, forKey: .capability)
        self.code = try container.decode(DomainIssueCode.self, forKey: .code)
        self.codeBlock = try container.decode(Nullable<String>.self, forKey: .codeBlock)
        self.dnsRecords = try container.decode([DomainDnsRecord].self, forKey: .dnsRecords)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.capability, forKey: .capability)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.codeBlock, forKey: .codeBlock)
        try container.encode(self.dnsRecords, forKey: .dnsRecords)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case capability
        case code
        case codeBlock = "code_block"
        case dnsRecords = "dns_records"
        case message
    }
}
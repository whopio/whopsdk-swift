import Foundation

extension Requests {
    public struct FormCompanyAccountsRequest: Codable, Hashable, Sendable {
        /// Company mailing address. Required unless `use_registered_agent` is `true`.
        public let businessAddress: FormCompanyAccountsRequestBusinessAddress?
        /// Legal name for the new company.
        public let businessName: String
        /// Business phone number in E.164 format, for example `+12125550100`. Required unless `use_registered_agent` is `true`.
        public let businessPhone: String?
        /// Company website URL.
        public let businessWebsite: String?
        /// Legal entity ending appended to `business_name`. LLC formations accept `LLC`, `L.L.C`, `L.L.C.` or `Limited Liability Company` and default to `LLC`; C-Corp formations accept `Inc`, `Inc.`, `Incorporated`, `Corp.`, `Corporation`, `C Corp`, `C Corporation`, `CCorp` or `Company` and default to `Inc.`. Unrecognized values fall back to the default for the entity type.
        public let entitySuffix: FormCompanyAccountsRequestEntitySuffix?
        /// Legal entity type to form. Defaults to `llc`.
        public let entityType: FormCompanyAccountsRequestEntityType?
        /// Request expedited EIN processing for an additional fee. Available only when no founder supplies an SSN.
        public let expediteEin: Bool?
        /// Two-letter code of the US state (or `DC`) to form the company in. We recommend `WY` because Wyoming formations are completed the same day.
        public let formationState: FormCompanyAccountsRequestFormationState
        /// The company's founders. Exactly one must be marked `is_primary` — the responsible party for the filing.
        public let founders: [FormCompanyAccountsRequestFoundersItem]
        /// Authorized share structure. Required when `entity_type` is `c_corp`; ignored for LLCs.
        public let shareStructure: FormCompanyAccountsRequestShareStructure?
        /// Use the registered agent's address as the company address instead of `business_address`.
        public let useRegisteredAgent: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            businessAddress: FormCompanyAccountsRequestBusinessAddress? = nil,
            businessName: String,
            businessPhone: String? = nil,
            businessWebsite: String? = nil,
            entitySuffix: FormCompanyAccountsRequestEntitySuffix? = nil,
            entityType: FormCompanyAccountsRequestEntityType? = nil,
            expediteEin: Bool? = nil,
            formationState: FormCompanyAccountsRequestFormationState,
            founders: [FormCompanyAccountsRequestFoundersItem],
            shareStructure: FormCompanyAccountsRequestShareStructure? = nil,
            useRegisteredAgent: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.businessAddress = businessAddress
            self.businessName = businessName
            self.businessPhone = businessPhone
            self.businessWebsite = businessWebsite
            self.entitySuffix = entitySuffix
            self.entityType = entityType
            self.expediteEin = expediteEin
            self.formationState = formationState
            self.founders = founders
            self.shareStructure = shareStructure
            self.useRegisteredAgent = useRegisteredAgent
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.businessAddress = try container.decodeIfPresent(FormCompanyAccountsRequestBusinessAddress.self, forKey: .businessAddress)
            self.businessName = try container.decode(String.self, forKey: .businessName)
            self.businessPhone = try container.decodeIfPresent(String.self, forKey: .businessPhone)
            self.businessWebsite = try container.decodeIfPresent(String.self, forKey: .businessWebsite)
            self.entitySuffix = try container.decodeIfPresent(FormCompanyAccountsRequestEntitySuffix.self, forKey: .entitySuffix)
            self.entityType = try container.decodeIfPresent(FormCompanyAccountsRequestEntityType.self, forKey: .entityType)
            self.expediteEin = try container.decodeIfPresent(Bool.self, forKey: .expediteEin)
            self.formationState = try container.decode(FormCompanyAccountsRequestFormationState.self, forKey: .formationState)
            self.founders = try container.decode([FormCompanyAccountsRequestFoundersItem].self, forKey: .founders)
            self.shareStructure = try container.decodeIfPresent(FormCompanyAccountsRequestShareStructure.self, forKey: .shareStructure)
            self.useRegisteredAgent = try container.decodeIfPresent(Bool.self, forKey: .useRegisteredAgent)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.businessAddress, forKey: .businessAddress)
            try container.encode(self.businessName, forKey: .businessName)
            try container.encodeIfPresent(self.businessPhone, forKey: .businessPhone)
            try container.encodeIfPresent(self.businessWebsite, forKey: .businessWebsite)
            try container.encodeIfPresent(self.entitySuffix, forKey: .entitySuffix)
            try container.encodeIfPresent(self.entityType, forKey: .entityType)
            try container.encodeIfPresent(self.expediteEin, forKey: .expediteEin)
            try container.encode(self.formationState, forKey: .formationState)
            try container.encode(self.founders, forKey: .founders)
            try container.encodeIfPresent(self.shareStructure, forKey: .shareStructure)
            try container.encodeIfPresent(self.useRegisteredAgent, forKey: .useRegisteredAgent)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case businessAddress = "business_address"
            case businessName = "business_name"
            case businessPhone = "business_phone"
            case businessWebsite = "business_website"
            case entitySuffix = "entity_suffix"
            case entityType = "entity_type"
            case expediteEin = "expedite_ein"
            case formationState = "formation_state"
            case founders
            case shareStructure = "share_structure"
            case useRegisteredAgent = "use_registered_agent"
        }
    }
}
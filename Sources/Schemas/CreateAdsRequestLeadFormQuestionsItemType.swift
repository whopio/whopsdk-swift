import Foundation

public enum CreateAdsRequestLeadFormQuestionsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case email
    case phone
    case fullName = "full_name"
    case firstName = "first_name"
    case lastName = "last_name"
    case city
    case state
    case zip
    case country
    case streetAddress = "street_address"
    case jobTitle = "job_title"
    case companyName = "company_name"
    case workEmail = "work_email"
    case workPhoneNumber = "work_phone_number"
    case dob
    case gender
    case maritalStatus = "marital_status"
    case relationshipStatus = "relationship_status"
    case militaryStatus = "military_status"
    case dateTime = "date_time"
    case custom
}
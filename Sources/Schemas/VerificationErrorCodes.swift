import Foundation

/// An error code for a verification attempt.
public enum VerificationErrorCodes: String, Codable, Hashable, CaseIterable, Sendable {
    case abandoned
    case consentDeclined = "consent_declined"
    case countryNotSupported = "country_not_supported"
    case deviceNotSupported = "device_not_supported"
    case documentExpired = "document_expired"
    case documentTypeNotSupported = "document_type_not_supported"
    case documentUnverifiedOther = "document_unverified_other"
    case emailUnverifiedOther = "email_unverified_other"
    case emailVerificationDeclined = "email_verification_declined"
    case idNumberInsufficientDocumentData = "id_number_insufficient_document_data"
    case idNumberMismatch = "id_number_mismatch"
    case idNumberUnverifiedOther = "id_number_unverified_other"
    case phoneUnverifiedOther = "phone_unverified_other"
    case phoneVerificationDeclined = "phone_verification_declined"
    case selfieDocumentMissingPhoto = "selfie_document_missing_photo"
    case selfieFaceMismatch = "selfie_face_mismatch"
    case selfieManipulated = "selfie_manipulated"
    case selfieUnverifiedOther = "selfie_unverified_other"
    case underSupportedAge = "under_supported_age"
}
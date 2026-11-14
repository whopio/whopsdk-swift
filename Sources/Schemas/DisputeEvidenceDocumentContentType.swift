import Foundation

/// The uploaded file's MIME type. Uploads are restricted to the types the processor accepts, and rejected without one — never null.
public enum DisputeEvidenceDocumentContentType: String, Codable, Hashable, CaseIterable, Sendable {
    case applicationPdf = "application/pdf"
    case applicationJson = "application/json"
    case imageJpeg = "image/jpeg"
    case imagePng = "image/png"
    case imageWebp = "image/webp"
}
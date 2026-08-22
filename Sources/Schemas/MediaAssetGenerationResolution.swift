import Foundation

/// Requested video resolution. `null` for images. `1080p` is not supported by Seedance 2.0 Fast or Mini; `4k` is only supported by Seedance 2.0.
public enum MediaAssetGenerationResolution: String, Codable, Hashable, CaseIterable, Sendable {
    case fourHundredEightyP = "480p"
    case sevenHundredTwentyP = "720p"
    case oneThousandEightyP = "1080p"
    case fourK = "4k"
}
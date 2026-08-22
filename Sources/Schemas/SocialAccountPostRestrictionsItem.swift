import Foundation

/// Ways this post can't be used on an ad. `lead_form_ineligible`: post can't be used in lead form ads. `promotion_ineligible`: the platform won't promote this post at all — always present when that's true, alongside a reason code when one is identified. `copyrighted_music`: post uses music the platform does not allow for ads. `messenger_destination`, `instagram_destination`, `whatsapp_destination`: the post's own button opens that chat app, so the post can only run in an ad group that sends people to the same one — always accompanied by `lead_form_ineligible`. Empty when the post has no restrictions.
public enum SocialAccountPostRestrictionsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case leadFormIneligible = "lead_form_ineligible"
    case promotionIneligible = "promotion_ineligible"
    case copyrightedMusic = "copyrighted_music"
    case messengerDestination = "messenger_destination"
    case instagramDestination = "instagram_destination"
    case whatsappDestination = "whatsapp_destination"
}
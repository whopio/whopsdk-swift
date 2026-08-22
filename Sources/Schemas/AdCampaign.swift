import Foundation

public struct AdCampaign: Codable, Hashable, Sendable {
    /// USD value attributed to add-to-cart events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let addedToCartValue: Double
    /// Whop pixel-attributed add-to-cart events, last-click.
    public let addedToCarts: Double
    /// How delivery bids in the ad auction: `minimum_cost` gets the most results for the budget, `average_target` holds an average cost per result, and `maximum_target` never bids above a cap.
    public let bidType: Nullable<AdCampaignBidType>?
    /// The campaign's budget, in the ad account's currency. `null` when each ad group sets its own budget instead.
    public let budgetAmount: Nullable<Double>
    /// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`).
    public let budgetOptimization: Nullable<AdCampaignBudgetOptimization>
    /// Whether `budget_amount` is spent per day (`daily`) or over the campaign's full run (`lifetime`).
    public let budgetType: Nullable<AdCampaignBudgetType>
    /// Clicks divided by impressions, between 0 and 1.
    public let clickThroughRate: Double
    /// The number of clicks.
    public let clicks: Double
    /// USD value attributed to complete-registration events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let completedRegistrationValue: Double
    /// Whop pixel-attributed complete-registration events, last-click.
    public let completedRegistrations: Double
    /// USD value attributed to contact events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let contactValue: Double
    /// Whop pixel-attributed contact events, last-click.
    public let contacts: Double
    /// Spend divided by attributed add-to-cart events; null when they are not the goal and none are attributed.
    public let costPerAddedToCart: Nullable<Double>
    /// Spend divided by clicks; 0 when there are no clicks.
    public let costPerClick: Double
    /// Spend divided by attributed complete-registration events; null when they are not the goal and none are attributed.
    public let costPerCompletedRegistration: Nullable<Double>
    /// Spend divided by attributed contact events; null when contacts are not the goal and none are attributed.
    public let costPerContact: Nullable<Double>
    /// Spend divided by attributed leads; null when leads are not a goal and none are attributed.
    public let costPerLead: Nullable<Double>
    /// Spend per 1,000 impressions; 0 when there are no impressions.
    public let costPerMille: Double
    /// Spend divided by attributed purchases; null when purchases are not a goal and none are attributed.
    public let costPerPurchase: Nullable<Double>
    /// Spend divided by Whop pixel-attributed results; null when nothing Whop-attributable is being optimized for.
    public let costPerResult: Nullable<Double>
    /// Spend divided by attributed schedule events; null when schedules are not the goal and none are attributed.
    public let costPerSchedule: Nullable<Double>
    /// Spend divided by attributed submit-application events; null when they are not the goal and none are attributed.
    public let costPerSubmittedApplication: Nullable<Double>
    /// Spend divided by unique clicks; null when there are no unique clicks.
    public let costPerUniqueClick: Nullable<Double>
    /// Spend divided by attributed view-content events; null when they are not the goal and none are attributed.
    public let costPerViewedContent: Nullable<Double>
    /// When the campaign was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Whop pixel-attributed custom (merchant-defined) conversion events, last-click, across all custom event names.
    public let customConversions: Double
    /// Whop pixel-attributed custom conversions, keyed by your event name with its last-click count as the value. Empty when no named custom events are attributed. Custom events fired without a name are counted in custom_conversions but omitted here, so these values sum to at most custom_conversions.
    public let customEventCounts: [String: JSONValue]
    /// Conversion value attributed to each custom event, keyed by event name like custom_event_counts. Sums the value passed to whop.track, normalized to USD; events fired without a value contribute 0.
    public let customEventValues: [String: JSONValue]
    /// Whether the campaign's ads are delivering right now, and if not, why. When several states apply at once, the highest-precedence one is returned.
    public let deliveryStatus: AdCampaignDeliveryStatus
    /// Platform-reported impressions divided by reach.
    public let frequency: Nullable<Double>
    /// Unique identifier for the ad campaign, prefixed `adcamp_`.
    public let id: String
    /// The number of impressions.
    public let impressions: Double
    public let issues: [AdPlatformIssue]
    /// USD value attributed to lead events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let leadValue: Double
    /// Whop pixel-attributed leads, last-click.
    public let leads: Double
    /// The goal the campaign optimizes toward.
    public let objective: Nullable<AdCampaignObjective>
    /// The event the campaign optimizes for when a single goal is set campaign-wide. `null` when each ad group sets its own optimization_goal.
    public let optimizationGoal: Nullable<String>
    /// The ad network the campaign runs on.
    public let platform: AdCampaignPlatform
    /// USD value of pixel-attributed purchases.
    public let purchaseValue: Double
    /// Whop pixel-attributed purchases, last-click.
    public let purchases: Double
    /// The number of unique people who saw this.
    public let reach: Double
    /// The Whop pixel conversion event whose attributed count represents results — the optimization goal, or the highest-volume attributed event for campaigns that budget per ad group. Null when the goal isn't a Whop-attributed event.
    public let resultEvent: Nullable<AdCampaignResultEvent>
    /// The merchant-defined event name when result_event is custom; null for the standard events.
    public let resultEventName: Nullable<String>
    /// The Whop pixel-attributed count behind result_event. When a campaign's ad groups optimize different goals there is no single result_event (it is null), and this is instead the sum of each ad group's own attributed results. Null when nothing Whop-attributable is being optimized for.
    public let results: Nullable<Double>
    /// Purchase value divided by spend, both in USD (a currency-neutral ratio); 0 when there is no spend.
    public let returnOnAdSpend: Double
    /// USD value attributed to schedule events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let scheduleValue: Double
    /// Whop pixel-attributed schedule events, last-click.
    public let schedules: Double
    public let specialAdCategories: [AdCampaignSpecialAdCategoriesItem]
    /// The amount charged, in spend_currency.
    public let spend: Double
    /// The ISO 4217 currency code of all monetary metrics.
    public let spendCurrency: Nullable<String>
    /// The lifecycle status of the ad campaign.
    public let status: AdCampaignStatus
    /// USD value attributed to submit-application events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let submittedApplicationValue: Double
    /// Whop pixel-attributed submit-application events, last-click.
    public let submittedApplications: Double
    /// Display name of the ad campaign.
    public let title: String
    /// Unique clicks divided by impressions, between 0 and 1.
    public let uniqueClickThroughRate: Nullable<Double>
    /// People who clicked, reported by the Whop pixel, counted once per person.
    public let uniqueClicks: Double
    /// When the campaign was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// USD value attributed to view-content events. Sums the value sent with each event, normalized to USD; events without a value contribute 0.
    public let viewedContentValue: Double
    /// Whop pixel-attributed view-content events, last-click.
    public let viewedContents: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        addedToCartValue: Double,
        addedToCarts: Double,
        bidType: Nullable<AdCampaignBidType>? = nil,
        budgetAmount: Nullable<Double>,
        budgetOptimization: Nullable<AdCampaignBudgetOptimization>,
        budgetType: Nullable<AdCampaignBudgetType>,
        clickThroughRate: Double,
        clicks: Double,
        completedRegistrationValue: Double,
        completedRegistrations: Double,
        contactValue: Double,
        contacts: Double,
        costPerAddedToCart: Nullable<Double>,
        costPerClick: Double,
        costPerCompletedRegistration: Nullable<Double>,
        costPerContact: Nullable<Double>,
        costPerLead: Nullable<Double>,
        costPerMille: Double,
        costPerPurchase: Nullable<Double>,
        costPerResult: Nullable<Double>,
        costPerSchedule: Nullable<Double>,
        costPerSubmittedApplication: Nullable<Double>,
        costPerUniqueClick: Nullable<Double>,
        costPerViewedContent: Nullable<Double>,
        createdAt: String,
        customConversions: Double,
        customEventCounts: [String: JSONValue],
        customEventValues: [String: JSONValue],
        deliveryStatus: AdCampaignDeliveryStatus,
        frequency: Nullable<Double>,
        id: String,
        impressions: Double,
        issues: [AdPlatformIssue],
        leadValue: Double,
        leads: Double,
        objective: Nullable<AdCampaignObjective>,
        optimizationGoal: Nullable<String>,
        platform: AdCampaignPlatform,
        purchaseValue: Double,
        purchases: Double,
        reach: Double,
        resultEvent: Nullable<AdCampaignResultEvent>,
        resultEventName: Nullable<String>,
        results: Nullable<Double>,
        returnOnAdSpend: Double,
        scheduleValue: Double,
        schedules: Double,
        specialAdCategories: [AdCampaignSpecialAdCategoriesItem],
        spend: Double,
        spendCurrency: Nullable<String>,
        status: AdCampaignStatus,
        submittedApplicationValue: Double,
        submittedApplications: Double,
        title: String,
        uniqueClickThroughRate: Nullable<Double>,
        uniqueClicks: Double,
        updatedAt: String,
        viewedContentValue: Double,
        viewedContents: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.addedToCartValue = addedToCartValue
        self.addedToCarts = addedToCarts
        self.bidType = bidType
        self.budgetAmount = budgetAmount
        self.budgetOptimization = budgetOptimization
        self.budgetType = budgetType
        self.clickThroughRate = clickThroughRate
        self.clicks = clicks
        self.completedRegistrationValue = completedRegistrationValue
        self.completedRegistrations = completedRegistrations
        self.contactValue = contactValue
        self.contacts = contacts
        self.costPerAddedToCart = costPerAddedToCart
        self.costPerClick = costPerClick
        self.costPerCompletedRegistration = costPerCompletedRegistration
        self.costPerContact = costPerContact
        self.costPerLead = costPerLead
        self.costPerMille = costPerMille
        self.costPerPurchase = costPerPurchase
        self.costPerResult = costPerResult
        self.costPerSchedule = costPerSchedule
        self.costPerSubmittedApplication = costPerSubmittedApplication
        self.costPerUniqueClick = costPerUniqueClick
        self.costPerViewedContent = costPerViewedContent
        self.createdAt = createdAt
        self.customConversions = customConversions
        self.customEventCounts = customEventCounts
        self.customEventValues = customEventValues
        self.deliveryStatus = deliveryStatus
        self.frequency = frequency
        self.id = id
        self.impressions = impressions
        self.issues = issues
        self.leadValue = leadValue
        self.leads = leads
        self.objective = objective
        self.optimizationGoal = optimizationGoal
        self.platform = platform
        self.purchaseValue = purchaseValue
        self.purchases = purchases
        self.reach = reach
        self.resultEvent = resultEvent
        self.resultEventName = resultEventName
        self.results = results
        self.returnOnAdSpend = returnOnAdSpend
        self.scheduleValue = scheduleValue
        self.schedules = schedules
        self.specialAdCategories = specialAdCategories
        self.spend = spend
        self.spendCurrency = spendCurrency
        self.status = status
        self.submittedApplicationValue = submittedApplicationValue
        self.submittedApplications = submittedApplications
        self.title = title
        self.uniqueClickThroughRate = uniqueClickThroughRate
        self.uniqueClicks = uniqueClicks
        self.updatedAt = updatedAt
        self.viewedContentValue = viewedContentValue
        self.viewedContents = viewedContents
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.addedToCartValue = try container.decode(Double.self, forKey: .addedToCartValue)
        self.addedToCarts = try container.decode(Double.self, forKey: .addedToCarts)
        self.bidType = try container.decodeNullableIfPresent(AdCampaignBidType.self, forKey: .bidType)
        self.budgetAmount = try container.decode(Nullable<Double>.self, forKey: .budgetAmount)
        self.budgetOptimization = try container.decode(Nullable<AdCampaignBudgetOptimization>.self, forKey: .budgetOptimization)
        self.budgetType = try container.decode(Nullable<AdCampaignBudgetType>.self, forKey: .budgetType)
        self.clickThroughRate = try container.decode(Double.self, forKey: .clickThroughRate)
        self.clicks = try container.decode(Double.self, forKey: .clicks)
        self.completedRegistrationValue = try container.decode(Double.self, forKey: .completedRegistrationValue)
        self.completedRegistrations = try container.decode(Double.self, forKey: .completedRegistrations)
        self.contactValue = try container.decode(Double.self, forKey: .contactValue)
        self.contacts = try container.decode(Double.self, forKey: .contacts)
        self.costPerAddedToCart = try container.decode(Nullable<Double>.self, forKey: .costPerAddedToCart)
        self.costPerClick = try container.decode(Double.self, forKey: .costPerClick)
        self.costPerCompletedRegistration = try container.decode(Nullable<Double>.self, forKey: .costPerCompletedRegistration)
        self.costPerContact = try container.decode(Nullable<Double>.self, forKey: .costPerContact)
        self.costPerLead = try container.decode(Nullable<Double>.self, forKey: .costPerLead)
        self.costPerMille = try container.decode(Double.self, forKey: .costPerMille)
        self.costPerPurchase = try container.decode(Nullable<Double>.self, forKey: .costPerPurchase)
        self.costPerResult = try container.decode(Nullable<Double>.self, forKey: .costPerResult)
        self.costPerSchedule = try container.decode(Nullable<Double>.self, forKey: .costPerSchedule)
        self.costPerSubmittedApplication = try container.decode(Nullable<Double>.self, forKey: .costPerSubmittedApplication)
        self.costPerUniqueClick = try container.decode(Nullable<Double>.self, forKey: .costPerUniqueClick)
        self.costPerViewedContent = try container.decode(Nullable<Double>.self, forKey: .costPerViewedContent)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customConversions = try container.decode(Double.self, forKey: .customConversions)
        self.customEventCounts = try container.decode([String: JSONValue].self, forKey: .customEventCounts)
        self.customEventValues = try container.decode([String: JSONValue].self, forKey: .customEventValues)
        self.deliveryStatus = try container.decode(AdCampaignDeliveryStatus.self, forKey: .deliveryStatus)
        self.frequency = try container.decode(Nullable<Double>.self, forKey: .frequency)
        self.id = try container.decode(String.self, forKey: .id)
        self.impressions = try container.decode(Double.self, forKey: .impressions)
        self.issues = try container.decode([AdPlatformIssue].self, forKey: .issues)
        self.leadValue = try container.decode(Double.self, forKey: .leadValue)
        self.leads = try container.decode(Double.self, forKey: .leads)
        self.objective = try container.decode(Nullable<AdCampaignObjective>.self, forKey: .objective)
        self.optimizationGoal = try container.decode(Nullable<String>.self, forKey: .optimizationGoal)
        self.platform = try container.decode(AdCampaignPlatform.self, forKey: .platform)
        self.purchaseValue = try container.decode(Double.self, forKey: .purchaseValue)
        self.purchases = try container.decode(Double.self, forKey: .purchases)
        self.reach = try container.decode(Double.self, forKey: .reach)
        self.resultEvent = try container.decode(Nullable<AdCampaignResultEvent>.self, forKey: .resultEvent)
        self.resultEventName = try container.decode(Nullable<String>.self, forKey: .resultEventName)
        self.results = try container.decode(Nullable<Double>.self, forKey: .results)
        self.returnOnAdSpend = try container.decode(Double.self, forKey: .returnOnAdSpend)
        self.scheduleValue = try container.decode(Double.self, forKey: .scheduleValue)
        self.schedules = try container.decode(Double.self, forKey: .schedules)
        self.specialAdCategories = try container.decode([AdCampaignSpecialAdCategoriesItem].self, forKey: .specialAdCategories)
        self.spend = try container.decode(Double.self, forKey: .spend)
        self.spendCurrency = try container.decode(Nullable<String>.self, forKey: .spendCurrency)
        self.status = try container.decode(AdCampaignStatus.self, forKey: .status)
        self.submittedApplicationValue = try container.decode(Double.self, forKey: .submittedApplicationValue)
        self.submittedApplications = try container.decode(Double.self, forKey: .submittedApplications)
        self.title = try container.decode(String.self, forKey: .title)
        self.uniqueClickThroughRate = try container.decode(Nullable<Double>.self, forKey: .uniqueClickThroughRate)
        self.uniqueClicks = try container.decode(Double.self, forKey: .uniqueClicks)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.viewedContentValue = try container.decode(Double.self, forKey: .viewedContentValue)
        self.viewedContents = try container.decode(Double.self, forKey: .viewedContents)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.addedToCartValue, forKey: .addedToCartValue)
        try container.encode(self.addedToCarts, forKey: .addedToCarts)
        try container.encodeNullableIfPresent(self.bidType, forKey: .bidType)
        try container.encode(self.budgetAmount, forKey: .budgetAmount)
        try container.encode(self.budgetOptimization, forKey: .budgetOptimization)
        try container.encode(self.budgetType, forKey: .budgetType)
        try container.encode(self.clickThroughRate, forKey: .clickThroughRate)
        try container.encode(self.clicks, forKey: .clicks)
        try container.encode(self.completedRegistrationValue, forKey: .completedRegistrationValue)
        try container.encode(self.completedRegistrations, forKey: .completedRegistrations)
        try container.encode(self.contactValue, forKey: .contactValue)
        try container.encode(self.contacts, forKey: .contacts)
        try container.encode(self.costPerAddedToCart, forKey: .costPerAddedToCart)
        try container.encode(self.costPerClick, forKey: .costPerClick)
        try container.encode(self.costPerCompletedRegistration, forKey: .costPerCompletedRegistration)
        try container.encode(self.costPerContact, forKey: .costPerContact)
        try container.encode(self.costPerLead, forKey: .costPerLead)
        try container.encode(self.costPerMille, forKey: .costPerMille)
        try container.encode(self.costPerPurchase, forKey: .costPerPurchase)
        try container.encode(self.costPerResult, forKey: .costPerResult)
        try container.encode(self.costPerSchedule, forKey: .costPerSchedule)
        try container.encode(self.costPerSubmittedApplication, forKey: .costPerSubmittedApplication)
        try container.encode(self.costPerUniqueClick, forKey: .costPerUniqueClick)
        try container.encode(self.costPerViewedContent, forKey: .costPerViewedContent)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customConversions, forKey: .customConversions)
        try container.encode(self.customEventCounts, forKey: .customEventCounts)
        try container.encode(self.customEventValues, forKey: .customEventValues)
        try container.encode(self.deliveryStatus, forKey: .deliveryStatus)
        try container.encode(self.frequency, forKey: .frequency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.impressions, forKey: .impressions)
        try container.encode(self.issues, forKey: .issues)
        try container.encode(self.leadValue, forKey: .leadValue)
        try container.encode(self.leads, forKey: .leads)
        try container.encode(self.objective, forKey: .objective)
        try container.encode(self.optimizationGoal, forKey: .optimizationGoal)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.purchaseValue, forKey: .purchaseValue)
        try container.encode(self.purchases, forKey: .purchases)
        try container.encode(self.reach, forKey: .reach)
        try container.encode(self.resultEvent, forKey: .resultEvent)
        try container.encode(self.resultEventName, forKey: .resultEventName)
        try container.encode(self.results, forKey: .results)
        try container.encode(self.returnOnAdSpend, forKey: .returnOnAdSpend)
        try container.encode(self.scheduleValue, forKey: .scheduleValue)
        try container.encode(self.schedules, forKey: .schedules)
        try container.encode(self.specialAdCategories, forKey: .specialAdCategories)
        try container.encode(self.spend, forKey: .spend)
        try container.encode(self.spendCurrency, forKey: .spendCurrency)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.submittedApplicationValue, forKey: .submittedApplicationValue)
        try container.encode(self.submittedApplications, forKey: .submittedApplications)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.uniqueClickThroughRate, forKey: .uniqueClickThroughRate)
        try container.encode(self.uniqueClicks, forKey: .uniqueClicks)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.viewedContentValue, forKey: .viewedContentValue)
        try container.encode(self.viewedContents, forKey: .viewedContents)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case addedToCartValue = "added_to_cart_value"
        case addedToCarts = "added_to_carts"
        case bidType = "bid_type"
        case budgetAmount = "budget_amount"
        case budgetOptimization = "budget_optimization"
        case budgetType = "budget_type"
        case clickThroughRate = "click_through_rate"
        case clicks
        case completedRegistrationValue = "completed_registration_value"
        case completedRegistrations = "completed_registrations"
        case contactValue = "contact_value"
        case contacts
        case costPerAddedToCart = "cost_per_added_to_cart"
        case costPerClick = "cost_per_click"
        case costPerCompletedRegistration = "cost_per_completed_registration"
        case costPerContact = "cost_per_contact"
        case costPerLead = "cost_per_lead"
        case costPerMille = "cost_per_mille"
        case costPerPurchase = "cost_per_purchase"
        case costPerResult = "cost_per_result"
        case costPerSchedule = "cost_per_schedule"
        case costPerSubmittedApplication = "cost_per_submitted_application"
        case costPerUniqueClick = "cost_per_unique_click"
        case costPerViewedContent = "cost_per_viewed_content"
        case createdAt = "created_at"
        case customConversions = "custom_conversions"
        case customEventCounts = "custom_event_counts"
        case customEventValues = "custom_event_values"
        case deliveryStatus = "delivery_status"
        case frequency
        case id
        case impressions
        case issues
        case leadValue = "lead_value"
        case leads
        case objective
        case optimizationGoal = "optimization_goal"
        case platform
        case purchaseValue = "purchase_value"
        case purchases
        case reach
        case resultEvent = "result_event"
        case resultEventName = "result_event_name"
        case results
        case returnOnAdSpend = "return_on_ad_spend"
        case scheduleValue = "schedule_value"
        case schedules
        case specialAdCategories = "special_ad_categories"
        case spend
        case spendCurrency = "spend_currency"
        case status
        case submittedApplicationValue = "submitted_application_value"
        case submittedApplications = "submitted_applications"
        case title
        case uniqueClickThroughRate = "unique_click_through_rate"
        case uniqueClicks = "unique_clicks"
        case updatedAt = "updated_at"
        case viewedContentValue = "viewed_content_value"
        case viewedContents = "viewed_contents"
    }
}
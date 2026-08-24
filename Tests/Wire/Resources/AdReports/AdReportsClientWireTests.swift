import Foundation
import Testing
import WhopSDK

@Suite("AdReportsClient Wire Tests") struct AdReportsClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "breakdown": [
                    {
                      "granularity": [
                        {
                          "bucket_start": "2023-12-01T05:00:00Z",
                          "clicks": 42,
                          "granularity": "hourly",
                          "impressions": 42,
                          "reach": 42,
                          "result_count": 42,
                          "result_label_key": null,
                          "result_label_override": null,
                          "spend": 6.9,
                          "spend_currency": "usd",
                          "stat_date": "2023-12-01T05:00:00Z",
                          "stat_hour": 42
                        }
                      ],
                      "id": "id",
                      "level": "campaign",
                      "name": "name",
                      "summary": {
                        "click_through_rate": 6.9,
                        "clicks": 42,
                        "cost_per_click": 6.9,
                        "cost_per_mille": 6.9,
                        "cost_per_result": 6.9,
                        "frequency": 6.9,
                        "impressions": 42,
                        "reach": 42,
                        "result_count": 42,
                        "result_label_key": null,
                        "result_label_override": null,
                        "return_on_ad_spend": 6.9,
                        "spend": 6.9,
                        "spend_currency": null
                      }
                    }
                  ],
                  "granularity": [
                    {
                      "bucket_start": "2023-12-01T05:00:00Z",
                      "clicks": 42,
                      "granularity": "hourly",
                      "impressions": 42,
                      "reach": 42,
                      "result_count": 42,
                      "result_label_key": "app_installs",
                      "result_label_override": "result_label_override",
                      "spend": 6.9,
                      "spend_currency": "usd",
                      "stat_date": "2023-12-01T05:00:00Z",
                      "stat_hour": 42
                    }
                  ],
                  "summary": {
                    "click_through_rate": 6.9,
                    "clicks": 42,
                    "cost_per_click": 6.9,
                    "cost_per_mille": 6.9,
                    "cost_per_result": 6.9,
                    "frequency": 6.9,
                    "impressions": 42,
                    "reach": 42,
                    "result_count": 42,
                    "result_label_key": "app_installs",
                    "result_label_override": "result_label_override",
                    "return_on_ad_spend": 6.9,
                    "spend": 6.9,
                    "spend_currency": "usd"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AdReport(
            breakdown: Nullable<[AdReportBreakdownItem]>.value([
                AdReportBreakdownItem(
                    granularity: Nullable<[AdReportBreakdownItemGranularityItem]>.value([
                        AdReportBreakdownItemGranularityItem(
                            bucketStart: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                            clicks: 42,
                            granularity: Granularities.hourly,
                            impressions: 42,
                            reach: 42,
                            resultCount: Nullable<Int>.value(42),
                            resultLabelKey: .null,
                            resultLabelOverride: .null,
                            spend: 6.9,
                            spendCurrency: Currencies.usd,
                            statDate: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                            statHour: Nullable<Int>.value(42)
                        )
                    ]),
                    id: "id",
                    level: AdReportBreakdownLevels.campaign,
                    name: Nullable<String>.value("name"),
                    summary: AdReportBreakdownItemSummary(
                        clickThroughRate: 6.9,
                        clicks: 42,
                        costPerClick: 6.9,
                        costPerMille: Nullable<Double>.value(6.9),
                        costPerResult: Nullable<Double>.value(6.9),
                        frequency: Nullable<Double>.value(6.9),
                        impressions: 42,
                        reach: 42,
                        resultCount: Nullable<Int>.value(42),
                        resultLabelKey: .null,
                        resultLabelOverride: .null,
                        returnOnAdSpend: Nullable<Double>.value(6.9),
                        spend: 6.9,
                        spendCurrency: .null
                    )
                )
            ]),
            granularity: Nullable<[AdReportGranularityItem]>.value([
                AdReportGranularityItem(
                    bucketStart: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    clicks: 42,
                    granularity: Granularities.hourly,
                    impressions: 42,
                    reach: 42,
                    resultCount: Nullable<Int>.value(42),
                    resultLabelKey: Nullable<ResultLabelKeys>.value(ResultLabelKeys.appInstalls),
                    resultLabelOverride: Nullable<String>.value("result_label_override"),
                    spend: 6.9,
                    spendCurrency: Currencies.usd,
                    statDate: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    statHour: Nullable<Int>.value(42)
                )
            ]),
            summary: AdReportSummary(
                clickThroughRate: 6.9,
                clicks: 42,
                costPerClick: 6.9,
                costPerMille: Nullable<Double>.value(6.9),
                costPerResult: Nullable<Double>.value(6.9),
                frequency: Nullable<Double>.value(6.9),
                impressions: 42,
                reach: 42,
                resultCount: Nullable<Int>.value(42),
                resultLabelKey: Nullable<ResultLabelKeys>.value(ResultLabelKeys.appInstalls),
                resultLabelOverride: Nullable<String>.value("result_label_override"),
                returnOnAdSpend: Nullable<Double>.value(6.9),
                spend: 6.9,
                spendCurrency: Nullable<Currencies>.value(Currencies.usd)
            )
        )
        let response = try await client.adReports.retrieve(
            companyId: "biz_xxxxxxxxxxxxxx",
            from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}
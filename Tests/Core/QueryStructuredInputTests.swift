import Foundation
import Testing
@testable import WhopSDK

struct QueryStructuredInputTests {
    @Test func allGeneratedDateUnionsKeepStringsAndIntegers() throws {
        let inputs: [(QueryParameter, String)] = [
            (.unknown(ListApiKeysRequestCreatedBefore.string("2026-11-01T00:00:00Z")), "2026-11-01T00:00:00Z"),
            (.unknown(ListApiKeysRequestCreatedBefore.int(123)), "123"),
            (.unknown(ListApiKeysRequestCreatedAfter.string("2026-11-01T00:00:00Z")), "2026-11-01T00:00:00Z"),
            (.unknown(ListApiKeysRequestCreatedAfter.int(123)), "123"),
            (.unknown(ListAppBuildsRequestCreatedBefore.string("2026-11-01T00:00:00Z")), "2026-11-01T00:00:00Z"),
            (.unknown(ListAppBuildsRequestCreatedBefore.int(123)), "123"),
            (.unknown(ListAppBuildsRequestCreatedAfter.string("2026-11-01T00:00:00Z")), "2026-11-01T00:00:00Z"),
            (.unknown(ListAppBuildsRequestCreatedAfter.int(123)), "123"),
        ]
        for (input, value) in inputs {
            #expect(try input.queryItems(name: "created_before") == [URLQueryItem(name: "created_before", value: value)])
        }
    }

    @Test func experimentReferenceUsesDeepObjectBrackets() throws {
        let reference = ExperimentResourceReference(id: "plan_audit", object: .plan)
        let items = try QueryParameter.unknown(reference).queryItems(name: "related_resource")
        #expect(items == [
            URLQueryItem(name: "related_resource[id]", value: "plan_audit"),
            URLQueryItem(name: "related_resource[object]", value: "plan"),
        ])
    }

    @Test func experimentSubjectUsesDeepObjectWireNames() throws {
        let subject = ExposuresExperimentsRequestSubject(accountId: "biz_audit", anonymousId: "anonymous", userId: "user_audit")
        let items = try QueryParameter.unknown(subject).queryItems(name: "subject")
        #expect(items == [
            URLQueryItem(name: "subject[account_id]", value: "biz_audit"),
            URLQueryItem(name: "subject[anonymous_id]", value: "anonymous"),
            URLQueryItem(name: "subject[user_id]", value: "user_audit"),
        ])
    }

    @Test func bothStatsInputsKeepNumberedFunnelSteps() throws {
        let first = FunnelStep(country: "US", event: "pixel.page")
        let second = FunnelStep(event: "payment.completed")
        let inputs: [QueryParameter] = [
            .unknown(RetrieveStatsRequestSteps(_1: first, _2: second)),
            .unknown(RetrieveTimeSeriesRequestSteps(_1: first, _2: second)),
        ]
        for input in inputs {
            #expect(try input.queryItems(name: "steps") == [
                URLQueryItem(name: "steps[1][country]", value: "US"),
                URLQueryItem(name: "steps[1][event]", value: "pixel.page"),
                URLQueryItem(name: "steps[2][event]", value: "payment.completed"),
            ])
        }
    }

    @Test func integerUnionEncodingPreservesFullPrecision() throws {
        #expect(try QueryParameter.unknown(Int64.max).queryItems(name: "value") == [URLQueryItem(name: "value", value: "9223372036854775807")])
    }

    @Test func unsupportedUnknownValuesThrowInsteadOfDroppingTheFilter() throws {
        struct Unsupported {}
        do {
            _ = try QueryParameter.unknown(Unsupported()).queryItems(name: "value")
            Issue.record("Unsupported query value was accepted")
        } catch WhopSDKError.encodingError(_) {
        } catch {
            Issue.record("Unexpected error: \(error)")
        }
    }
}

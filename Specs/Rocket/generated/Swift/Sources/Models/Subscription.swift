//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Subscription: APIModel {

    /** The status of a subscription. */
    public enum Status: String, Codable, Equatable, CaseIterable {
        case active = "Active"
        case cancelled = "Cancelled"
        case lapsed = "Lapsed"
        case expired = "Expired"
        case none = "None"
    }

    /** The unique subscription code. */
    public var code: String

    /** The start date of a subscription. */
    public var startDate: DateTime

    /** True if a subscription is in its trial period, false if not. */
    public var isTrialPeriod: Bool

    /** The plan a subscription belongs to. */
    public var planId: String

    /** The status of a subscription. */
    public var status: Status

    /** The end date of a subscription.
Some subscriptions may not have an end date, in which case this
property will not exist.
 */
    public var endDate: DateTime?

    public init(code: String, startDate: DateTime, isTrialPeriod: Bool, planId: String, status: Status, endDate: DateTime? = nil) {
        self.code = code
        self.startDate = startDate
        self.isTrialPeriod = isTrialPeriod
        self.planId = planId
        self.status = status
        self.endDate = endDate
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        code = try container.decode("code")
        startDate = try container.decode("startDate")
        isTrialPeriod = try container.decode("isTrialPeriod")
        planId = try container.decode("planId")
        status = try container.decode("status")
        endDate = try container.decodeIfPresent("endDate")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(code, forKey: "code")
        try container.encode(startDate, forKey: "startDate")
        try container.encode(isTrialPeriod, forKey: "isTrialPeriod")
        try container.encode(planId, forKey: "planId")
        try container.encode(status, forKey: "status")
        try container.encodeIfPresent(endDate, forKey: "endDate")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Subscription else { return false }
      guard self.code == object.code else { return false }
      guard self.startDate == object.startDate else { return false }
      guard self.isTrialPeriod == object.isTrialPeriod else { return false }
      guard self.planId == object.planId else { return false }
      guard self.status == object.status else { return false }
      guard self.endDate == object.endDate else { return false }
      return true
    }

    public static func == (lhs: Subscription, rhs: Subscription) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

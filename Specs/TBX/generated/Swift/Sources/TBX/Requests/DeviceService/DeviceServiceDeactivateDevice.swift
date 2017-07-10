//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TBX.DeviceService {

    public enum DeviceServiceDeactivateDevice {

      public static let service = APIService<Response>(id: "DeviceService.deactivateDevice", tag: "DeviceService", method: "POST", path: "/DeviceServices/deactivateDevice", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              public var apiKey: String

              public var deviceToken: String

              public var deviceType: String

              public init(apiKey: String, deviceToken: String, deviceType: String) {
                  self.apiKey = apiKey
                  self.deviceToken = deviceToken
                  self.deviceType = deviceType
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: DeviceServiceDeactivateDevice.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(apiKey: String, deviceToken: String, deviceType: String) {
              let options = Options(apiKey: apiKey, deviceToken: deviceToken, deviceType: deviceType)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              params["api_key"] = options.apiKey
              params["deviceToken"] = options.deviceToken
              params["deviceType"] = options.deviceType
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [String: Any]

            /** Request was successful */
            case success200([String: Any])

            public var success: [String: Any]? {
                switch self {
                case .success200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .success200(let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .success200: return 200
              }
            }

            public var successful: Bool {
              switch self {
              case .success200: return true
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .success200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}

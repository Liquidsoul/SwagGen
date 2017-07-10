//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Place {

    public enum PlaceSearch {

      public static let service = APIService<Response>(id: "Place_Search", tag: "Place", method: "GET", path: "/Place/Search", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** The name of the place, you can use the /Place/Types/{types} endpoint to get a list of places for a given type including their names. */
              public var name: String

              /** A comma-separated list of the types to return. Max. approx 12 types. */
              public var types: [String]?

              public init(name: String, types: [String]? = nil) {
                  self.name = name
                  self.types = types
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: PlaceSearch.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(name: String, types: [String]? = nil) {
              let options = Options(name: name, types: types)
              self.init(options: options)
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              params["name"] = options.name
              if let types = options.types?.joined(separator: ",") {
                params["types"] = types
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Place]

            /** OK */
            case success200([Place])

            public var success: [Place]? {
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

import Foundation
import ApolloCore

extension HTTPURLResponse: ApolloCompatible {}

extension ApolloExtension where Base == HTTPURLResponse {
  var isSuccessful: Bool {
    return (200..<300).contains(base.statusCode)
  }

  var statusCodeDescription: String {
    return HTTPURLResponse.localizedString(forStatusCode: base.statusCode)
  }

  var textEncoding: String.Encoding? {
    guard let encodingName = base.textEncodingName else { return nil }

    return String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding(encodingName as CFString)))
  }
}

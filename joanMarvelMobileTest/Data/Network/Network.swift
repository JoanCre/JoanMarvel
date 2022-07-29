//
//  Network.swift
//  joanMarvelMobileTest
//
//  Created by Joan Cremades on 29/7/22.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

enum NetworkError: Error {
    case invalidResponse
    case errorDecodable
    case server
}

struct Network {
    static private func hash() -> (String, String) {
        let ts = Int(Date().timeIntervalSince1970)
        let MD5 = MD5(string: "\(ts)\(Configuration.privateKey)\(Configuration.publicKey)")
        let md5Hex = MD5.map { String(format: "%02hhx", $0) }.joined()
        return (String(ts), md5Hex)
    }

    static func getAuthenticationPath() -> String {
        let (ts, hash) = Network.hash()
        return "apikey=\(Configuration.publicKey)&ts=\(ts)&hash=\(hash)"
    }

    static func load<T: Decodable>(request: URLRequest, of type: T.Type) async throws -> T {
        let (data, urlResponse) = try await URLSession.shared.data(for: request)
        guard let response = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        if response.statusCode > 300 {
            throw NetworkError.server
        }
        let decoder = JSONDecoder()
        var parseData: T!
        do {
            parseData = try decoder.decode(T.self, from: data)
        } catch let errordata {
            print(errordata)
            throw NetworkError.errorDecodable
        }
        return parseData
    }

    static func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using: .utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
}



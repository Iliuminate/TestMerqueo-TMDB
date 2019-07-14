//
//  GeneralBasicResponse.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/12/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation

struct GeneralBasicResponse: Codable {
    
    let statusMessage: String
    let success: Bool
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
        case success
        case statusCode = "status_code"
    }
}

// MARK: Convenience initializers

extension GeneralBasicResponse {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(GeneralBasicResponse.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

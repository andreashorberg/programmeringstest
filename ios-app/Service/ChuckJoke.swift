//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation

struct ChuckJoke: Decodable, Hashable {
    let categories: [String]
    let createdAt: Date
    let updatedAt: Date
    let iconUrl: URL
    let id: String
    let url: URL
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories, id, url, value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case iconUrl = "icon_url"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        categories = try container.decode([String].self, forKey: .categories)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        iconUrl = try container.decode(URL.self, forKey: .iconUrl)
        id = try container.decode(String.self, forKey: .id)
        url = try container.decode(URL.self, forKey: .url)
        value = try container.decode(String.self, forKey: .value)
    }
}

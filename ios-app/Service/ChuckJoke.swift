import Foundation

struct ChuckJoke: Hashable, Identifiable, Joke {
    let id: String = "ChuckJoke"
    let categories: [String]
    let createdAt: Date
    let updatedAt: Date
    let iconUrl: URL
    let identifier: String
    let url: URL
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories, url, value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case iconUrl = "icon_url"
        case identifier = "id"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        categories = try container.decode([String].self, forKey: .categories)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        iconUrl = try container.decode(URL.self, forKey: .iconUrl)
        identifier = try container.decode(String.self, forKey: .identifier)
        url = try container.decode(URL.self, forKey: .url)
        value = try container.decode(String.self, forKey: .value)
    }
}

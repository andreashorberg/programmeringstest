import Foundation

protocol Joke: Decodable {
    var id: String { get }
    var categories: [String] { get }
    var iconUrl: URL { get }
    var identifier: String { get }
    var url: URL { get }
    var value: String { get }
}

extension Joke {
    var createdAt: Date { .distantPast }
    var updatedAt: Date { .distantFuture }
}

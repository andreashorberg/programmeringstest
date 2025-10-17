import Foundation

enum ChuckError: LocalizedError {
    case failed
    case taskCancelled
    case networkError(Error)
    var errorDescription: String? {
        return "“It works on my machine” always holds true for Chuck Norris."
    }
}

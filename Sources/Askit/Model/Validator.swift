import Foundation

public struct Validator: Codable, Equatable {
    public enum Kind: String, Codable {
        case range
        case length
        case format
        case selection
    }
    
    public let type: Kind
    public let min: Double?
    public let max: Double?
    public let maxLength: Int?
    public let format: String?
    public let minSelected: Int?
    public let maxSelected: Int?
}

import Foundation

class DemoSettings {
    
    enum Environment: String {
        case local, sandbox, production
    }
    
    static var sampleMerchantServerURL: URL {
        let environment = UserDefaults.standard.string(forKey: "environment").flatMap( { Environment(rawValue: $0) }) ?? .sandbox
        
        switch environment {
        case .local:
            return URL(string: "http://localhost:5000")!
        case .sandbox:
            return URL(string: "https://ppcp-sample-merchant-sand.herokuapp.com")!
        case .production:
            return URL(string: "https://ppcp-sample-merchant-prod.herokuapp.com")!
        }
    }
    
    static var intent: String {
        UserDefaults.standard.string(forKey: "intent") ?? "capture"
    }
    
    static var countryCode: String {
        UserDefaults.standard.string(forKey: "countryCode") ?? "US"
    }
    
    static var currencyCode: String {
        countryCode == "US" ? "USD" : "GBP"
    }
    
    static var payeeEmailAddress: String {
        if countryCode == "UK" {
            return "native-sdk-gb-merchant-111@paypal.com"
        } else {
            return "ahuang-us-bus-ppcp-approve-seller7@paypal.com"
        }
    }
}

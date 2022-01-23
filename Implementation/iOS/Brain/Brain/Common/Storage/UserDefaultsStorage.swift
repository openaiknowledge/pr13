//
//  Brain
//
//  Created by Miguel Gutierrez on 23/01/22.
//
import Foundation

private enum StorageKeys: String {
    private static let brain = "com.openaiknowledge.Brain"
    
    case hasAreadyLaunched
    case didAcceptTermsAndConditions
    
    var keyValue: String {
        return StorageKeys.brain + self.rawValue
    }
    
}

class UserDefaultsStorage {
    
    static let shared: UserDefaultsStorage = {

        return UserDefaultsStorage()
    }()
    
    public func updateSuite(With name: String) {
        self.suiteName = name
        
    }
    
    private let standard = UserDefaults.standard
    private (set) public var suite = UserDefaults(suiteName: "")
    private var suiteName: String? {
        didSet {
            suite = UserDefaults(suiteName: suiteName)
        }
    }
        
    var hasAreadyLaunched: Bool {
        get {
            return suite?.bool(forKey: StorageKeys.hasAreadyLaunched.keyValue) ?? false
        }
        set {
            suite?.set(newValue, forKey: StorageKeys.hasAreadyLaunched.keyValue)
        }
    }
        
    var didAcceptTermsAndConditions: Bool {
        get {
            return suite?.bool(forKey: StorageKeys.didAcceptTermsAndConditions.keyValue) ?? false
        }
        set {
            suite?.set(newValue, forKey: StorageKeys.didAcceptTermsAndConditions.keyValue)
        }
    }
    
    func cleanUserDefaultsStorage() {
        didAcceptTermsAndConditions = false
    }
}

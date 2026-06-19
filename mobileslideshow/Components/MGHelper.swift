//
//  MGHelper.swift
//  mobileslideshow
//

import Foundation

/// Contains helper functions for interacting with MobileGestalt, an internal system for device characteristics lookup.
///
/// - Warning: Do not use methods in this class for public applications. It is not publicly supported.
class MGHelper {
    /// Returns the value of a given key from MobileGestalt.
    ///
    /// - Parameter key: The key to query as a String.
    ///
    /// - Returns: The value of the key as either a String value or nil.
    ///
    /// - Warning: Do not use this for public applications. It is not publicly supported.
    ///
    /// - Note: Some keys may be inaccessible due to missing entitlements.
    static func read(key: String) -> String? {
        typealias MGCopyAnswer = (@convention(c) (CFString) -> CFTypeRef?)
        var mgCopyAnswer: MGCopyAnswer?
        
        // Initialize
        guard let gestalt = dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_LAZY) else {
            return nil
        }
        
        // Prepare key for use with MGCopyAnswer
        guard let key = CFStringCreateWithCString(nil, key, CFStringBuiltInEncodings.ASCII.rawValue) else {
            return nil
        }
        
        mgCopyAnswer = unsafeBitCast(dlsym(gestalt, "MGCopyAnswer"), to: MGCopyAnswer.self)
        
        // Get answer through MGCopyAnswer
        guard let value = mgCopyAnswer?(key) else {
            return nil
        }
        
        let typeID = CFGetTypeID(value)
        
        // Return answer as a casted String
        switch typeID {
        case CFBooleanGetTypeID():
            let bool = value as! CFBoolean
            return CFBooleanGetValue(bool) ? "true" : "false"
        case CFNumberGetTypeID():
            if let number = value as? NSNumber {
                return number.stringValue
            }
        case CFStringGetTypeID():
            return String(describing: value)
        case CFDictionaryGetTypeID():
            if let dict = value as? [String: Any] {
                return "\(dict)"
            }
        case CFDataGetTypeID():
            let data = value as! Data
            return data.map { String($0) }.joined(separator: " ")
        default:
            return nil
        }
        
        return nil
    }
}

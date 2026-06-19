//
//  UIDevice+Utils.swift
//  mobileslideshow
//

import SwiftUI

extension UIDevice {
    /// A helper function to better simplify key responses that return `String` values.
    ///
    /// - Parameters:
    ///   - key: The key to query.
    ///   - fallback: The default value to fallback to. Set to "" by default.
    ///
    /// - Returns: The `key`'s `String` response or `fallback`'s value if nil.
    private static func MGGetStringAnswer(key: String, fallback: String = "") -> String {
        MGHelper.read(key: key) ?? fallback
    }
    
    /// The current build of the operating system.
    static let buildVersion = MGGetStringAnswer(key: "mZfUC7qo4pURNhyMHZ62RQ")
    
    /// Returns a Bool on whether the host is on a simulator/Mac.
    static let IsSimulated: Bool = {
        if let answer = MGHelper.read(key: "ulMliLomP737aAOJ/w/evA") { // IsSimulator key
            return Bool(answer)!
        }
        
        // Fallback
        return ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] != nil
    }()
    
    /// Experimental runtime path for anyAppleOS 27+ simulators
    private static func newRuntimePath() -> String? {
        let fm = FileManager.default
        let cryptexBase = "/private/var/run/com.apple.security.cryptexd/mnt/"
        
        guard let mounts = try? fm.contentsOfDirectory(atPath: cryptexBase),
              let xrosMount = mounts.first(where: { $0.contains("XROS") }) else {
            return nil
        }
        
        let runtimesDir = "\(cryptexBase)\(xrosMount)/Library/Developer/CoreSimulator/Profiles/Runtimes/"
        
        guard let runtimes = try? fm.contentsOfDirectory(atPath: runtimesDir),
              let runtimeBundle = runtimes.first(where: { $0.hasSuffix(".simruntime") }) else {
            return nil
        }
        
        let fullPath = "\(runtimesDir)\(runtimeBundle)/Contents/Resources/RuntimeRoot"
        
        return fm.fileExists(atPath: fullPath) ? fullPath : nil
    }
    
    private static let legacyRuntimePath: String = {
        "/Library/Developer/CoreSimulator/Volumes/xrOS_\(UIDevice.buildVersion)/Library/Developer/CoreSimulator/Profiles/Runtimes/xrOS \(UIDevice.current.systemVersion).simruntime/Contents/Resources/RuntimeRoot"
    }()
    
    static let RuntimePath: String = {
        guard IsSimulated else { return "" }
        
        if let newPath = newRuntimePath() {
            return newPath
        }
        
        return legacyRuntimePath
    }()
}

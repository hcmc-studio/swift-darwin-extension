//
//  utsname+.swift
//
//
//  Created by Ji-Hwan Kim on 4/9/24.
//

import Darwin.POSIX.sys

extension utsname {
    public static var current: utsname {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        return systemInfo
    }
}

extension utsname {
    public var wrappedSysname: String {
        Mirror(reflecting: sysname).children.reduce("") { partialResult, element in
            if let value = element.value as? CChar, value != 0 {
                partialResult + .init(UnicodeScalar(.init(value)))
            } else {
                partialResult
            }
        }
    }
    
    public var wrappedNodename: String {
        Mirror(reflecting: nodename).children.reduce("") { partialResult, element in
            if let value = element.value as? CChar, value != 0 {
                partialResult + .init(UnicodeScalar(.init(value)))
            } else {
                partialResult
            }
        }
    }
    
    public var wrappedRelease: String {
        Mirror(reflecting: release).children.reduce("") { partialResult, element in
            if let value = element.value as? CChar, value != 0 {
                partialResult + .init(UnicodeScalar(.init(value)))
            } else {
                partialResult
            }
        }
    }
    
    public var wrappedVersion: String {
        Mirror(reflecting: version).children.reduce("") { partialResult, element in
            if let value = element.value as? CChar, value != 0 {
                partialResult + .init(UnicodeScalar(.init(value)))
            } else {
                partialResult
            }
        }
    }
    
    public var wrappedMachine: String {
        Mirror(reflecting: machine).children.reduce("") { partialResult, element in
            if let value = element.value as? CChar, value != 0 {
                partialResult + .init(UnicodeScalar(.init(value)))
            } else {
                partialResult
            }
        }
    }
}

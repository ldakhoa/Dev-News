//
//  Extensions+UserDefaults.swift
//  Dev News
//
//  Created by khoale on 7/5/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import Foundation

extension UserDefaults {
    public var darkModeEnabled: Bool {
        let themeSetting = string(forKey: UserDefaultsKeys.theme.rawValue)
        return themeSetting == "dark"
    }
    
    public func setDarkMode(_ enabled: Bool) {
        set(enabled ? "dark" : "light", forKey: UserDefaultsKeys.theme.rawValue)
    }
    
}

enum UserDefaultsKeys: String {
    case theme
}

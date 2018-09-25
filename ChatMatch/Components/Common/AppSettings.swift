//
//  AppSettings.swift
//  ChatMatch
//
//  Created by Daniel Yo on 9/23/18.
//  Copyright © 2018 Daniel Yo. All rights reserved.
//

import UIKit

class AppSettings {
    let build = Bundle.main.infoDictionary?[kCFBundleVersionKey as String]
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
}

//
//  AppTheme.swift
//  ChatMatch
//
//  Created by Daniel Yo on 9/19/18.
//  Copyright © 2018 Daniel Yo. All rights reserved.
//

import UIKit

class AppTheme: NSObject {
    
    public func mainColor() -> UIColor {
        return UIColor(hexString: "#42859f")
    }
    
    public func secondaryColor() -> UIColor {
        return UIColor(hexString: "#1a546b")
    }
    
    public func mainFontName() -> String {
        return "Helvetica"
    }

}

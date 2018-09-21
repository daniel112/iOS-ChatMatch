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
    
    public func backgroundColor() -> UIColor {
        return UIColor(hexString: "#0e6c85")
    }
    
    public func selectedItemColor() -> UIColor {
        return UIColor(hexString: "#265a88")
    }
    
    public func mainFontName() -> String {
        return "Helvetica"
    }

}

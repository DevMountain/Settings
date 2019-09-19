//
//  SettingsController.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class SettingsController {
    /// Declares a constant named shared and assigns it to an initialized instance of the SettingController class
    static let shared = SettingsController()
    
    /// Source of Truth. Array of Setting objects.
    var mySettings: [Setting]
    
    /**
     Initializes an instance of the SettingController. Takes in no parameters, and assigns the settings property to the mock data provided (music, apps, books, updates).
     */
    init() {
        let music = Setting(name: "Music", isSet: false, image: UIImage(named: "music"))
        let apps = Setting(name: "Apps", isSet: true, image: UIImage(named: "apps"))
        let books = Setting(name: "Books", isSet: false, image: UIImage(named: "books"))
        let updates = Setting(name: "Updates", isSet: false, image: UIImage(named: "apps"))
        
        self.mySettings = [music, apps, books, updates]
    }
}

//
//  Setting.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

/// Custom Setting model object
class Setting {
    /// The String value of the Setting's name
    let name: String
    /// The UIImage of the Setting
    var image: UIImage?
    /// The Boolean value representing the Setting's current state
    var isSet: Bool
    
    /**
     Initailizes a Setting model object from the given parameters
     
     - Parameters:
        - name: String value of the Setting's name
        - isSet: Boolean representing the Setting's current state, sets default value to false
        - image: UIImage of the Setting
     */
    init(name: String, isSet: Bool, image: UIImage?) {
        self.name = name
        self.isSet = isSet
        self.image = image
    }
}

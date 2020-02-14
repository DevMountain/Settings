//
//  Setting.swift
//  Settings
//
//  Created by Karl Pfister on 11/11/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

/**
Creates our Setting Object - *MODEL*
 - Properties:
    - name: The `String` identifer for the Setting
    - icon: The `UIImage` that matches the Setting
    - isOn: The `Bool` to designiate whether the Setting is on or not
 */
class Setting {

    let settingName: String
    let icon: UIImage
    var isOn: Bool

    init(name: String, icon: UIImage, isOn: Bool) {
        self.settingName = name
        self.icon = icon
        self.isOn = isOn
    }
}

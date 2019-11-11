//
//  SettingController.swift
//  Settings
//
//  Created by Karl Pfister on 11/11/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

/// Our Model Controller Class
class SettingController {

    /// Singleton: To ensure that we are interacting with the *SAME* instance of our settings array we created a singleton and will pass around this specific instance of our SettingsController
    static let sharedInstance = SettingController()

    /**
     Source of truth

     We created a computed property named *settings* and delcared the type to be an array of *Setting* objects.

     - Returns: The mock Setting objects we created in an array
     */
    let settings: [Setting] = {

        let music = Setting(name: "iTunes", icon: #imageLiteral(resourceName: "iTunes"), isOn: false)
        let appStore = Setting(name: "App Store", icon: #imageLiteral(resourceName: "appStore"), isOn: false)
        let iBooks = Setting(name: "iBooks", icon: #imageLiteral(resourceName: "iBooks"), isOn: true)

        return[music, appStore, iBooks]
    }()

    /**
     Toggles the *isOn* bool property on a *Setting* object to the opposite state

     - Parameters:
        - setting: The setting object we wish to change the *isOn* of
     */
    func toggleIsOn(for setting: Setting) {
        setting.isOn = !setting.isOn
    }
}

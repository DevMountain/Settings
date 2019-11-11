//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Karl Pfister on 11/11/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit
/**
 The protocol we will use to handle the update of the cell when the *settingSwitch* is toggled
    - class: This protocol can interact with class level objects

 Step One:
    - Define the protocol. This will need to interact with class level objects and define the task we want our delegate to handle.

 Delegate Methods:
    - settingSwtichTapped(for cell: SetttingTableViewCell)

 */
protocol SettingCellDelegate: class {
    /**
     Delegate method for the *SettingCellDelegate*

     Parameters:
        - cell: The cell that that user toggled
     */
    func settingSwitchTapped(for cell: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!

// declare the delegate
    //Step Two
    // Declare the delegate and type. Whom ever is set as this delegate will be the one to perform the protocols task.
    /**
     The delegate or *intern* for the protocol *SettingCellDelegate*

     - weak: We mark this method as weak to not create a retain cycle
     - optional: We do not want to set the value of the delegate here.

     */
    weak var cellDelegate: SettingCellDelegate?


    //MARK: - Actions
    @IBAction func settingSwitchToggled(_ sender: Any) {
        /// This is the call to action for the delegate. Hey intern, go get me a coffee
        cellDelegate?.settingSwitchTapped(for: self)
    }

    //MARK:- UpdateViews
    func updateViews(with setting: Setting) {
        /// Updates the view elements accoring to their values
        settingNameLabel.text = setting.settingName
        settingSwitch.isOn = setting.isOn
        settingImageView.image = setting.icon
        /// Ternary Operator for the background color
        self.backgroundColor = setting.isOn ? .cyan : .white
    }
}

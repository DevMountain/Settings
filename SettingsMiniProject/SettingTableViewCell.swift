//
//  SettingTableViewCell.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

// Step 1 of 5 for Custom Delegate
/**
 Definition of the SettingsTableViewCellDelegate protocol that only classes can conform to.
 
 - Note:
 A class that conforms to SettingTableViewCellDelegate must implement the settingSwitchValueChanged(_ cell:,selected:) method. Where this is named SettingTableViewCellDelegate, it is not a delegate, just proper naming convention. The class that conforms to this protocol is the delegate.
 */
protocol SettingTableViewCellDelegate: class {
	func settingValueChanged(_ cell: SettingTableViewCell, selected: Bool)
}

class SettingTableViewCell: UITableViewCell {
    
    var setting: Setting? {
        didSet {
            updateViews()
        }
    }
    
    // Step 2 of 5 for Custom Delegate
    /**
     Declaration of the delegate variable that will be a class that conforms to SettingTableViewCellDelegate
     
     - Note:
     We declare the delegate and mark it optional similarly to how we delcare a landing pad. This variable will be set where and when we need it to be. It is marked weak for memory management purposes.
     */
    weak var delegate: SettingTableViewCellDelegate?
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    // Step 3 of 5 for Custom Delegate
    /**
     Calling the delegate to perform the SettingTableViewCellDelegate protocol method.
     
     - Parameters:
        - sender: The Switch that is tied to this action
     
     - Note:
     When this action is fired, it will tell the delegate to perform the settingSwitchValueChanged(_ cell,:selected:) passing in self (refering to the UITableViewCell) for the cell parameter, and the current value of the settingSwitch outlet for the selected parameter.
     */
    @IBAction func settingSwitchValueChanged(_ sender: UISwitch) {
        delegate?.settingValueChanged(self, selected: settingSwitch.isOn)
    }
    
    func updateViews() {
        guard let setting = setting else { return }
        iconImageView.image = setting.image
        settingLabel.text = setting.name
        settingSwitch.isOn = setting.isSet
        backgroundColor = setting.isSet ? .yellow : .white
    }
}

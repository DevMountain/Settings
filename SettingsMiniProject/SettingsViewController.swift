//
//  SettingsViewController.swift
//  SettingsMiniProject
//
//  Created by James Pacheco on 4/13/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Eliminate extra cells from the tableView
        tableView.tableFooterView = UIView()
    }
}

// MARK: - TableViewDataSource && TableViewDelegate Conformance
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.shared.mySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as? SettingTableViewCell
        
        let setting = SettingsController.shared.mySettings[(indexPath as NSIndexPath).row]
        cell?.setting = setting
        // Step 5 of 5 for Custom Delegate - set your delegate = self
        /// Assign the SettingTableViewCell property of delegate to self (refering to SettingsViewController). The SettingsViewController can now handle the SettingTableViewCellDelegate methods.
        /// - Requires: Class confromance to the protocol.
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
}

// MARK: - SettingTableViewCellDelegate Conformance
// Step 4 of 5 in Custom Delegate - conform to your custom protocol
extension SettingsViewController: SettingTableViewCellDelegate {
    /**
     Conformance to the SettingTableViewCellDelegate protocol
     
     - Note:
     Here the SettingsViewController is conforming to the SettingTableViewCellDelegate protocol. The class is required to handle its protocol method, settingSwitchValueChanged(_ cell:,selected:). When the method is called, run any required logic.
     
     - Parameters:
        - cell: The cell that is calling the function
        - selected: The current state of the UISwitch on the cell
     */
    func settingValueChanged(_ cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting else {return}
        setting.isSet = selected
        cell.updateViews()
    }
}

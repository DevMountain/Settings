//
//  SettingListTableViewController.swift
//  Settings
//
//  Created by Karl Pfister on 11/11/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

/// TableViewController to display our Setting objects
class SettingListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// We want the number cells to match the number of `Setting` objects in our *source of truth*
        return SettingController.sharedInstance.settings.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Type casting our tableview cell to be a `SettingTableViewCell` and guarding against it failing. If it fails, return a empty UITableViewCell object - initialized
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}
        /// Declaring a constant called `setting`, using the `indexPath` that was passed into the cellForRowAt:,  we asign it to the value of the `Setting` object that matches the row property of the `indexPath`
        let setting = SettingController.sharedInstance.settings[indexPath.row]
        /// accessing the updateViews method on our cell and sending the value of line 29 to that method
        cell.updateViews(with: setting)
        /// Setting the cells delegate to the tableViewController. I.E. Hiring the TBVC to be the intern in this relationship
        //MARK: - Step Four for Protocols and Delegates
        /*
         Assign the tableview to be the delegate for every single cell.
         */
        cell.delegate = self

        return cell
    }

} // End of class

//MARK: - Step Three for Protocols and Delegates
/*
 Have the TableView conform to the `SettingCellDelegate` protocol
*/
extension SettingListTableViewController: SettingCellDelegate {
    /// This is intern now perfoming that task.
    func settingSwitchTapped(for cell: SettingTableViewCell) {
        /// We asked our TBVC to be our delegate because it can tell us what the indexPath is for the cell that triggerd this protocol method
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        /// Find the `setting` in the settings array that matches that `indexpath`
        let setting = SettingController.sharedInstance.settings[indexPath.row]
        /// Tell the Model controller to toggle the `isOn` change on the `Setting`
        SettingController.sharedInstance.toggleIsOn(for: setting)
        /// Inform the cell it is now time to update
        cell.updateViews(with: setting)
    }
}

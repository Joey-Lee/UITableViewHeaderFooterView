//
//  ViewController.swift
//  CustomHeader
//
//  Created by Imanou Petit on 23/02/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

struct Constants {
    static let tableSectionHeaderIdentifier = "TableSectionHeaderView"
    static let tableViewCellIdentifier = "TableViewCell"
}

class TableViewController: UITableViewController {

    let dataArray = [[1, 2, 3], [4, 5], [6, 7, 8]]
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        // Register TableSectionHeaderView
        let nib = UINib(nibName: Constants.tableSectionHeaderIdentifier, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Constants.tableSectionHeaderIdentifier)
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Documentation: This method only works correctly when `tableView(_:heightForHeaderInSection:)` is also implemented
        let sectionHeaderView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.tableSectionHeaderIdentifier) as! TableSectionHeaderView
        sectionHeaderView.titleLabel.text = "Section \(section)"
        return sectionHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.text = "\(dataArray[indexPath.section][indexPath.row])"
        return cell
    }
    
}


/**
 A `UITableViewHeaderFooterView` subclass binded to a xib file
 Note that you must implement a contentView by yourself inside the xib file to make it work properly
*/
class TableSectionHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
}

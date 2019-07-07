//
//  SettingsTableViewController.swift
//  Dev News
//
//  Created by khoale on 7/5/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavBar()
        
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDismiss))
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

    }
    
    fileprivate func setupTableView() {
        tableView.register(SettingsCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1) // lightGray
        tableView.separatorStyle = .none
    }
    
    // MARK: - UITableView Datasource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    var headerLabel = HeaderLabel()
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerLabel = HeaderLabel()
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        switch section {
        case 0:
            headerLabel.text = "APPEARANCE"
        case 1:
            headerLabel.text = "READING"
        default:
            Void()
        }
        
        return headerLabel
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsCell(style: .default, reuseIdentifier: nil)
        
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = "Dark Mode"
            cell.selectionStyle = .none
            cell.switchControl.addTarget(self, action: #selector(handleDarkModeValueChange), for: .valueChanged)
        case 1:
            cell.titleLabel.text = "Open Safari in Reader mode"
            cell.selectionStyle = .none
        default:
            Void()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // MARK: - Handle function
    
    @objc fileprivate func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func handleDarkModeValueChange(_ sender: UISwitch) {
        print("changing theme")
        UserDefaults.standard.setDarkMode(sender.isOn)
        AppThemeProvider.shared.currentTheme = sender.isOn ? .dark : .light

    }
    
}

class HeaderLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 16, dy: 0))
    }
}

//
//  SettingsCell.swift
//  Dev News
//
//  Created by khoale on 7/5/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let switchControl: UISwitch = {
        let s = UISwitch()
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(switchControl)
        switchControl.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        switchControl.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16), size: .zero)
        
        setupTheming()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selected ? setSelectedBackground() : setUnselectedBackground()
    }
    
    fileprivate func setSelectedBackground() {
        backgroundColor = AppThemeProvider.shared.currentTheme.cellHighlightColor
    }
    
    fileprivate func setUnselectedBackground() {
        backgroundColor = AppThemeProvider.shared.currentTheme.backgroundColor
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingsCell: Themed {
    func applyTheme(_ theme: AppTheme) {
        titleLabel.textColor = theme.titleTextColor
        backgroundColor = #colorLiteral(red: 0.2282045484, green: 0.2282429636, blue: 0.2281961739, alpha: 1)
    }
}

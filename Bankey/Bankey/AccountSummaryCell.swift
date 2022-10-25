//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Mukhammadali Khayotov on 25/10/22.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    
    let typeLabel = UILabel()
    let underLineView = UIView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AccountSummaryCell {
    private func setup(){
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = appColor
        
        contentView.addSubview(typeLabel)// make sure you are adding your label to your contentView (as it is in a cell)
        contentView.addSubview(underLineView)
        
    }
    private func layout(){
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2), //16 points below the top
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2), //16 points leading from the right side
            underLineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1), // 8 points
            underLineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2), // 16 points
            underLineView.widthAnchor.constraint(equalToConstant: 60),//60 points width
            underLineView.heightAnchor.constraint(equalToConstant: 4),//4 points hight
        ])
        
    }
    
}

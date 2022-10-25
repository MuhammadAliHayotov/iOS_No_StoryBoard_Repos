//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Mukhammadali Khayotov on 25/10/22.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    //left handside of our cell
    let typeLabel = UILabel()
    let underLineView = UIView()
    let nameLabel = UILabel()
    
    //stackview for right handside
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView() // chevron >
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
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
        //-------------------------- left handside
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Mukhammad Ali "
        //-------------------------- right handside
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0//no additional spacing given, so that labels use their own default spacing
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "My Balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.attributedText = makeFormattedBalance(dollars: "999,999", cents: "99")
        
        //chevron image
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        // make sure you are adding your label to your contentView (as it is in a cell)
        contentView.addSubview(typeLabel)
        contentView.addSubview(underLineView)
        contentView.addSubview(nameLabel)
        
        //add to stackview first
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        //add stackView to our content's subview
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
        
    }
    private func layout(){
        
        NSLayoutConstraint.activate([
            //----------------------- left handside
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2), //16 points below the top
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2), //16 points leading from the right side
            
            underLineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1), // 8 points
            underLineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2), // 16 points
            underLineView.widthAnchor.constraint(equalToConstant: 60),//60 points width
            underLineView.heightAnchor.constraint(equalToConstant: 4),//4 points hight
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underLineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            //----------------------- right handside
            //stackview constraints align it to the right side
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underLineView.bottomAnchor, multiplier: 0), //same level as the bottom of the underlineView
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),//32 points away from the frame end
            //------------------------ chevron image at the rightmost position
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underLineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
        
    }
    //beautifully layout the balance amount with cents looking smaller and dollar itself looking huge
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let cellString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(cellString)
        
        return rootString
    }
    
}


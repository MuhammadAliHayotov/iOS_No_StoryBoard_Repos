//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Mukhammadali Khayotov on 16/10/22.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        commonInit()
    }
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    //loading a nib programmatically
    private func commonInit(){
        let bundle = Bundle(for: AccountSummaryHeaderView.self)//create a bundle and load up store the nib there
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)//load the stored nib from the bundle
        addSubview(contentView)//add it to the main View
        contentView.backgroundColor = appColor
        
        //set up correct constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}

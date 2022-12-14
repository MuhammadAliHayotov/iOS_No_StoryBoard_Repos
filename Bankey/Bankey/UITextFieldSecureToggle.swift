//
//  UITextFieldSecureToggle.swift
//  Bankey
//
//  Created by Mukhammadali Khayotov on 27/10/22.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton //places the image into right side
        rightViewMode = .always // always shows the image on the right side
    }
    @objc func togglePasswordView(_ sender: Any){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}

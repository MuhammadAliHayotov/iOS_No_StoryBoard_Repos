//
//  LoginView.swift
//  Bankey
//
//  Created by A253 on 01/08/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    let stackView = UIStackView()
    
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let deviderView = UIView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LoginView {
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        //user name text field
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.delegate = self
        //password text field
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        //the line that devides username from the password
        deviderView.translatesAutoresizingMaskIntoConstraints = false
        deviderView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout(){
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(deviderView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
        //add the constraints to this subView
        //addSubview(userNameTextField)
        
        NSLayoutConstraint.activate([
            //top anchor
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
            
        ])
        deviderView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1).isActive = true
    }
    
}
//MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}


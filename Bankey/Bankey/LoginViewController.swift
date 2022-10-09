//
//  ViewController.swift
//  Bankey
//
//  Created by A253 on 01/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    let bankeyText = UILabel()
    let aboutText = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //Bankey text
        bankeyText.translatesAutoresizingMaskIntoConstraints = false
        bankeyText.text = "Bankey"
        bankeyText.textColor = .black
        bankeyText.font = .systemFont(ofSize: 30)
        
        //signInButton
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    private func layout(){
        view.addSubview(bankeyText)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        
        //Bankey Text
        NSLayoutConstraint.activate([
            bankeyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankeyText.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 40)
        ])
        //LoginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: bankeyText.bottomAnchor, multiplier: 3), //center vertically (y axis)
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),// multiplier here means 8 pts
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
    }
}
// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton){
        
    }
}


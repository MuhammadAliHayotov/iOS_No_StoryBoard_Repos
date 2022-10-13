//
//  ViewController.swift
//  Bankey
//
//  Created by A253 on 01/08/22.
//

import UIKit

//MARK: LoginViewControllerDelegate
protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

//MARK: LoginViewController
class LoginViewController: UIViewController {

    let bankeyText = UILabel()
    let aboutText = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    //LoginViewcontroller delegate
    weak var delegate: LoginViewControllerDelegate?
    
    var userName : String?{
        return loginView.userNameTextField.text
    }
    var password : String?{
        return loginView.passwordTextField.text
    }
    
    
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
        //About message
        aboutText.translatesAutoresizingMaskIntoConstraints = false
        aboutText.textAlignment = .center
        aboutText.frame.size.width = view.frame.size.width
        aboutText.numberOfLines = 0
        aboutText.text = "Cool Bank Application, Do you agree with me or not like that"
        aboutText.textColor = .systemGray
        
        
        
        //signInButton
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 //for our spinning indicator to have 8 units space from the "Button title"
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        //Error Message Label
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    private func layout(){
        view.addSubview(bankeyText)
        view.addSubview(aboutText)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Bankey Text
        NSLayoutConstraint.activate([
            bankeyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankeyText.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 30)
        ])
        //About Text
        NSLayoutConstraint.activate([
            aboutText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutText.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //aboutText.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 1),
            aboutText.topAnchor.constraint(equalToSystemSpacingBelow: bankeyText.bottomAnchor, multiplier: 3)
        ])
        //LoginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: aboutText.bottomAnchor, multiplier: 3), //center vertically (y axis)
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),// multiplier here means 8 pts
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        //Error Message Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
        
    }
}
// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    private func login(){
        guard let userName = userName, let password = password else {
            assertionFailure("UserName/Password must not be nil")
            return
        }
        signInButton.configuration?.showsActivityIndicator = false
        //temporary solution without a network
        if userName == "" && password == "" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
            
        } else if userName.isEmpty || password.isEmpty {
            configureView(withMessage: "Username/Password cannot be blank")
            return
        }else {
            configureView(withMessage: "Username/Passwprd is incorrect")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}


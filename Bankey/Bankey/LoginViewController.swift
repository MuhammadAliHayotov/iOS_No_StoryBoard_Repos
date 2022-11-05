//
//  ViewController.swift
//  Bankey
//
//  Created by A253 on 01/08/22.
//

import UIKit

// MARK: Logout delegate
protocol LogoutDelegate: AnyObject {
    func didLogout()
}

//MARK: LoginViewControllerDelegate
protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

//MARK: LoginViewController
class LoginViewController: UIViewController {

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
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
    
    //for animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var titleLeadingAnchor: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //Bankey text
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30)
        //About message
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.frame.size.width = view.frame.size.width
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Cool Bank Application, Do you agree with me or not like that"
        subtitleLabel.textColor = .systemGray
        
        
        
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
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title label
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        // Subtitle label
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            view.centerYAnchor.constraint(equalTo: loginView.centerYAnchor)
        ])
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor)
        ])
        // Error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
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


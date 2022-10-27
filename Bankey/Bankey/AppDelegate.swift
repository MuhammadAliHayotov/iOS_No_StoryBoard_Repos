//
//  AppDelegate.swift
//  Bankey
//
//  Created by A253 on 01/08/22.
//
import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self

        
        let vc = mainViewController
        vc.setStatusBar()
        
        displayLogin()
        
        return true
    }
    private func displayLogin(){
        setRootViewController(loginViewController)
    }
    private func displayNextScreen(){
        if LocalState.hasOnboarded {
            setRootViewController(mainViewController)
        } else{
            setRootViewController(onboardingContainerViewController)
        }
    }
    private func prepMainView(){
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}
// MARK: Change Root View Controller
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}



// MARK: LoginViewController Delegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}
// MARK: OnboardingViewController Delegate
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView() //setup nav bar and colors
        setRootViewController(mainViewController)
    }
}
// MARK: LogoutDelegate
extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
    
}


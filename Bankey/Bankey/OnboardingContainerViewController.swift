//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Mukhammadali Khayotov on 09/10/22.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}


class OnboardingContainerViewController: UIViewController {

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    
    //buttons
    var closeButton = UIButton(type: .system)
    var nextButton = UIButton(type: .system)
    var doneButton = UIButton(type: .system)
    
    var currentVC: UIViewController {
        didSet{
            //guard let index = pages.firstIndex(of: currentVC) else {return}
            //nextButton.isHidden = index == pages.count - 1
            //nextButton.isHidden = index == 0
            //doneButton.isHidden = !(index == pages.count - 1)
                
        }
    }
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnBoardingViewController(heroImageName: "delorean", titleText: "This is a simple banking application, and this part is onbaording page 1, some other type of text here")
        let page2 = OnBoardingViewController(heroImageName: "world", titleText: "This is a simple banking application, and this part is onbaording page 2, some other type of text here should go here")
        let page3 = OnBoardingViewController(heroImageName: "thumbs", titleText: "This is a simple banking application, and this part is onbaording page 3, some other type of text here")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
       
    }
    
    private func setup(){
        
        view.backgroundColor = .systemPurple
        //adding child vc s to parent vc
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        //set up current VC as a source for pageVC
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func style(){
        //close button
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        //next button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        nextButton.isHidden = false
        //done button
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: [])
        doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
        doneButton.isHidden = true
        
        if currentVC == pages.last!{
            doneButton.isHidden = false
            nextButton.isHidden = true
        }
        
        view.addSubview(closeButton)
        //view.addSubview(nextButton)
        //view.addSubview(doneButton)
    }
    
    private func layout(){
        //close button constraints
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
        //next button constraints
       /* NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -2),
            nextButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1)
        ])
        //done button constraints
        NSLayoutConstraint.activate([
            doneButton.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -2),
            doneButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: -1)
        ])*/
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}


// MARK: - Actions
extension OnboardingContainerViewController{
    @objc func closeTapped(_ sender: UIButton){
        delegate?.didFinishOnboarding()
        print("close button tapped")
    }
    @objc func nextTapped(_ sender: UIButton){
        
    }
    @objc func doneTapped(_ sender: UIButton){
        
    }
}


// MARK: - ViewControllers
class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

//
//  DelegateDemo.swift
//
//  This demo illustrates the Delegate + Protocol pattern in Swift using UIKit.
//
// BIG PICTURE:
//  This pattern lets one screen (or object) tell another screen what happened.
//  For example: When a user taps a button in a "product picker" screen,
//  we want to notify the main screen to update its label.
//
// WHY USE THIS INSTEAD OF GLOBALS OR CLOSURES?
//  - No messy shared state (globals are hard to track and test).
//  - This is UIKit’s standard way (e.g., UITableViewDelegate).
//  - Keeps communication modular, flexible, and one-to-one.
//
//  ANALOGY:
//  - The “Boss” is the screen that has the data (ProductSelectionViewController).
//  - The “Intern” is waiting to be told what to do (MainViewController).
//  - The “Job Description” is the Protocol (ProductSelectionDelegate).
//

import UIKit

// MARK: - Step 1: Define the Protocol (Job Description)
protocol ProductSelectionDelegate: AnyObject {
    func didSelectProduct(name: String)
}

// MARK: - Step 2: MainViewController (Intern)
class MainViewController: UIViewController, ProductSelectionDelegate {

    let productLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        productLabel.text = "Choose a product"
        productLabel.textAlignment = .center
        productLabel.translatesAutoresizingMaskIntoConstraints = false

        let chooseButton = UIButton(type: .system)
        chooseButton.setTitle("Choose Product", for: .normal)
        chooseButton.addTarget(self, action: #selector(presentSelectionVC), for: .touchUpInside)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(productLabel)
        view.addSubview(chooseButton)

        NSLayoutConstraint.activate([
            productLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseButton.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 20),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func presentSelectionVC() {
        let selectionVC = ProductSelectionViewController()
        selectionVC.delegate = self // MainViewController signs up as the delegate
        present(selectionVC, animated: true, completion: nil)
    }

    // Called by the boss when a product is selected
    func didSelectProduct(name: String) {
        productLabel.text = "You selected: \(name)"
    }
}

// MARK: - Step 3: ProductSelectionViewController (Boss)
class ProductSelectionViewController: UIViewController {

    weak var delegate: ProductSelectionDelegate? // Holds reference to the intern

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        ["iPhone", "iPad", "MacBook"].forEach { product in
            let button = UIButton(type: .system)
            button.setTitle(product, for: .normal)
            button.addTarget(self, action: #selector(productTapped(_:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func productTapped(_ sender: UIButton) {
        guard let name = sender.currentTitle else { return }
        delegate?.didSelectProduct(name: name) // Tells the intern what to do
        dismiss(animated: true)
    }
}

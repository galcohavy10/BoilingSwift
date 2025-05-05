//
//  DelegateDemo.swift
//
//  This demo illustrates the Delegate + Protocol pattern in Swift using UIKit.
//
//  BIG PICTURE:
//  - Delegate pattern: one-to-one communication between objects (or screens). 
//    For instance, a "picker" screen tells the "host" screen which item was chosen.
//  - Recommended over globals or closures when you want a clear separation and reuse.
//
//  FRAMEWORK NOTES:
//  - UIKit view controllers follow a lifecycle: loadView → viewDidLoad → viewWillAppear → viewDidAppear → ...
//  - viewDidLoad is called once when the view hierarchy is loaded into memory. Great for initial setup.
//  - All UI updates must happen on the main thread.
//
//  MEMORY SAFETY:
//  - Delegate references should be weak to avoid retain cycles (view controller A holds B, B holds A).
//  - The pattern below uses `AnyObject` and `weak` to prevent leaks.

import UIKit

// MARK: - Step 1: Define the Protocol (Job Description)
// The protocol defines what methods the delegate must implement.
// It acts like a contract: "If you sign up as a delegate, you promise to handle these calls."
protocol ProductSelectionDelegate: AnyObject {
    /// Called when a product is tapped in the selection screen.
    func didSelectProduct(name: String)
}

// MARK: - Step 2: MainViewController (Intern)
// This controller presents the selection UI and conforms to ProductSelectionDelegate.
class MainViewController: UIViewController, ProductSelectionDelegate {

    // UILabel for showing the chosen product.
    let productLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        /*
         View Setup:
         - Set up subviews and constraints here.
         - viewDidLoad runs once; avoid expensive operations here.
         */
        productLabel.text = "Choose a product"
        productLabel.textAlignment = .center
        productLabel.translatesAutoresizingMaskIntoConstraints = false

        let chooseButton = UIButton(type: .system)
        chooseButton.setTitle("Choose Product", for: .normal)
        // Wire button tap to method
        chooseButton.addTarget(self, action: #selector(presentSelectionVC), for: .touchUpInside)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false

        // Add subviews to the view hierarchy
        view.addSubview(productLabel)
        view.addSubview(chooseButton)

        // Activate Auto Layout constraints
        NSLayoutConstraint.activate([
            productLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseButton.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 20),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    /// Button action: present the selection screen
    @objc func presentSelectionVC() {
        let selectionVC = ProductSelectionViewController()
        // Subscribe as delegate: now this VC will receive `didSelectProduct` calls
        selectionVC.delegate = self
        present(selectionVC, animated: true, completion: nil)
    }

    // MARK: - ProductSelectionDelegate
    /// Called by the ProductSelectionViewController when a choice is made.
    func didSelectProduct(name: String) {
        // Always update UI on the main thread
        DispatchQueue.main.async {
            self.productLabel.text = "You selected: \(name)"
        }
    }
}

// MARK: - Step 3: ProductSelectionViewController (Boss)
// This controller shows options and notifies its delegate when an item is chosen.
class ProductSelectionViewController: UIViewController {

    // Delegate reference: weak to avoid retain cycle
    weak var delegate: ProductSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        /*
         StackView holds buttons vertically:
         - Buttons represent products to choose.
         - When tapped, they inform the delegate.
         */
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        // Create a button per product
        ["iPhone", "iPad", "MacBook"].forEach { product in
            let button = UIButton(type: .system)
            button.setTitle(product, for: .normal)
            button.addTarget(self, action: #selector(productTapped(_:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }

        view.addSubview(stack)
        // Center the stack in the view
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    /// Handle button taps and notify delegate
    @objc func productTapped(_ sender: UIButton) {
        guard let name = sender.currentTitle else { return }
        /*
         Delegate call:
         - Tells the MainViewController which product was selected.
         - Maintains decoupling: this VC doesn’t need to know what happens next.
         */
        delegate?.didSelectProduct(name: name)
        dismiss(animated: true)
    }
}

/*
   Additional Notes:
   --------------------------------
   1. **Delegation vs. Closures**
      - Delegates can define multiple methods; closures are single-call. 
      - Delegates are easy to mock in tests by implementing the protocol.

   2. **View Lifecycle**
      - Heavy tasks (network calls) shouldn’t run in viewDidLoad.
      - UI updates must occur on main thread (DispatchQueue.main).

   3. **Memory Management**
      - Always mark delegate as `weak` to prevent retain cycles.
      - UIKit protocols like UITableViewDelegate follow this pattern.

   4. **Scaling Up**
      - For tableViews, you’d register cells, set dataSource/delegate, and reload data on success.
      - Show/hide an activity indicator during async operations.

   5. **Error Handling**
      - Present UIAlertController on failure with Retry/Cancel actions.
*/


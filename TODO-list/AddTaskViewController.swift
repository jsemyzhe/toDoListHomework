//
//  AddTaskViewController.swift
//  TODO-list
//
//  Created by Julia Semyzhenko on 3/19/22.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func enteredTaskInfo(_ text: String)
}

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    weak var delegate: AddTaskViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddPressed(_ sender: UIButton) {
        delegate?.enteredTaskInfo( (nameTextField.text ?? "") + " - " + (descTextField.text ?? ""))
        
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
}

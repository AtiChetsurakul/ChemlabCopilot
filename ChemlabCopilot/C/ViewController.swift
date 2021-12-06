//
//  ViewController.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SearchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
}



extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let chemical = searchTextField.text {
//            TODO
        }
        
        searchTextField.text = ""
        
    }
    
}

//
//  ViewController.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    var fetchedModel:ChemModel?
    var chemicalMan = ChemicalManager()
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        chemicalMan.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    @IBAction func projectLibPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "testSegueToCollectionView", sender: self)
    }
}
//MARK: ChemicalManager Method
extension SearchViewController: ChemicalManagerDelegate {
    func didLoadChemical(_ chemManager: ChemicalManager, chemModel: ChemModel) {
        DispatchQueue.main.async {
            print(chemModel.iUPACName)
            self.fetchedModel = chemModel
            self.performSegue(withIdentifier: "GoToPresentFetched", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PresentDataFFViewController.segueIdentifier {
            let destinationVC =  segue.destination as! PresentDataFFViewController
            if let modelToPassed = fetchedModel {
                destinationVC.modelToPresent = modelToPassed
            }
        }

    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension SearchViewController:UITextFieldDelegate {
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
            chemicalMan.fetchCompoundForData(name: chemical)
        }
        
        searchTextField.text = ""
        
    }
    
}

//
//  PresentDataFFViewController.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import UIKit

class PresentDataFFViewController: UIViewController {
    static let segueIdentifier = "GoToPresentFetched"
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var canonicalSMILES: UILabel!
    @IBOutlet weak var iUPACName: UILabel!
    @IBOutlet weak var molecularFormula: UILabel!
    @IBOutlet weak var mWeight: UILabel!

    var modelToPresent:ChemModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTextConnecting()
        // Do any additional setup after loading the view.
    }
    

    func labelTextConnecting(){
        titleName.text =        "Name: \(modelToPresent?.titleCompound ?? "404Error")"
        canonicalSMILES.text =  "\(modelToPresent?.canonicalSMILES ?? "404Error")"
        iUPACName.text =        "\(modelToPresent?.iUPACName ?? "404Error")"
        molecularFormula.text = "\(modelToPresent?.MolecularFormula ?? "404Error")"
        mWeight.text =          "\(modelToPresent?.molecularWeight ?? "404Error") Gram/Mole"

    }

}

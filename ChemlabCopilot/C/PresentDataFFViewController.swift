//
//  PresentDataFFViewController.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import UIKit

class PresentDataFFViewController: UIViewController {

    
    var modelToPresent:ChemModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(modelToPresent?.inChI ?? "404")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ChemicalManager.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import Foundation

protocol ChemicalManagerDelegate{
    func didLoadChemical(_ chemManager:ChemicalManager, chemModel:ChemModel)
    func didFailWithError(error:Error)
}
struct ChemicalManager {
    let pubChemUrl = K.ChemURL.firstURL
    let toSearchForData = K.ChemURL.property
    let toSearchForPNG = "/PNG"
    
    var delegate:ChemicalManagerDelegate?
    
    func fetchCompoundForData(name compound:String) {
        let urlString = "\(pubChemUrl)\(compound)\(toSearchForData)"
        print(urlString)
        performRequest(with: urlString)
    }
    func fetchCompoundForPNG(name compound:String) {
        let urlString = "\(pubChemUrl)\(compound)\(toSearchForPNG)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let chemicalProp = self.parseJSON(safeData) {
                        self.delegate?.didLoadChemical(self, chemModel: chemicalProp)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(_ chemData: Data) -> ChemModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ChemPropData.self, from: chemData)
            let pathWay = decodedData.PropertyTable.Properties[0]
            let title = pathWay.Title
            let moleW = pathWay.MolecularWeight
            let canonical = pathWay.CanonicalSMILES
            let inc = pathWay.MolecularFormula
            let iup = pathWay.IUPACName
            let weather = ChemModel(title, mw: moleW, smile: canonical, inchi: inc, iupac: iup)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}


//let molecularWeight:Double
//let canonicalSMILES:String
//let inChI:String
//let iUPACName:String

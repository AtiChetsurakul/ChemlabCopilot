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
//                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
//                        self.delegate?.didUpdateWeather(self, weather: weather)
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
//            let id = decodedData.weather[0].id
//            let temp = decodedData.main.temp
//            let name = decodedData.name
//            
            let weather = ChemModel()//Todo
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}



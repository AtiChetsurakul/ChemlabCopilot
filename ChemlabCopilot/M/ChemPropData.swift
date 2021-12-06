//
//  searchData.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import Foundation
struct ChemPropData:Codable {
    let PropertyTable: PropertyTableS
}

struct PropertyTableS:Codable {
    let Properties: [Property]
}

struct Property: Codable {
    let MolecularWeight:String
    let CanonicalSMILES:String
    let MolecularFormula:String
    let IUPACName:String
    let Title:String
}
    

//PropertyTable.Properties[0].MolecularWeight
//PropertyTable
//PropertyTable.Properties

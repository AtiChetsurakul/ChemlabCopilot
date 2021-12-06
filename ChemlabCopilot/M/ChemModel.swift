//
//  ChemModel.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 6/12/21.
//

import Foundation

struct ChemModel {
    let titleCompound:String
    let molecularWeight:String
    let canonicalSMILES:String
    let MolecularFormula:String
    let iUPACName:String

    init(_ title:String,mw:String,smile:String,inchi:String,iupac:String){
        titleCompound = title
        molecularWeight = mw
        canonicalSMILES = smile
        MolecularFormula = inchi
        iUPACName = iupac
    }
}


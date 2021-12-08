//
//  LabToDoCell.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 8/12/21.
//

import UIKit

class LabToDoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageToSetColor: UIImageView!
    @IBOutlet weak var labelOfProject: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    static let reuseIdentifier = "LabToDoCellIden"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        progressView.progress = Float(Double.random(in: 0...1))

    }

    override func layoutSubviews() {
            // cell rounded section
            self.layer.cornerRadius = 15.0
            self.layer.borderWidth = 5.0
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.masksToBounds = true
            
            // cell shadow section
            self.contentView.layer.cornerRadius = 15.0
            self.contentView.layer.borderWidth = 5.0
            self.contentView.layer.borderColor = UIColor.clear.cgColor
            self.contentView.layer.masksToBounds = true
            self.layer.shadowColor = UIColor.white.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
            self.layer.shadowRadius = 6.0
            self.layer.shadowOpacity = 0.6
            self.layer.cornerRadius = 15.0
            self.layer.masksToBounds = false
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        }
    
    static func nib() -> UINib {
        return UINib(nibName:"LabToDoCellX", bundle: nil)
    }
    
}

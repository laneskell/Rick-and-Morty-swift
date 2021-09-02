//
//  characterCell.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ApplyVisual()
    }
    
    // MARK: - Helpers
    func ApplyVisual(){
        backgroundColor = .primaryColor
        selectionStyle = .none
        containerView.backgroundColor = .secondaryColor
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        CharacterPresenter.LabelStyle(textColor: .accentColor,
                                      fontSize: 20.0,
                                      weight: .bold,
                                      to: nameLabel)
        
        CharacterPresenter.LabelStyle(textColor: .lightColor,
                                      fontSize: 16.0,
                                      weight: .medium,
                                      to: speciesLabel, statusLabel)
        
    }
    
}

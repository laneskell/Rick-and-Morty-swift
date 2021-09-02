//
//  CharacterDetailsVC.swift
//  rickandmorty
//
//  Created by Kell Lanes on 31/08/21.
//

import Foundation
import UIKit

class CharacterDetailsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var character: CharacterModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyVisuals()
        updateInformation()
    }
    
    private func updateInformation() {
        nameLabel.text = character.name
        speciesLabel.text = character.species
        statusLabel.text = character.status
        genderLabel.text = character.gender
        CharacterPresenter.ConvertImageUrl(urlImage: character!.image,
                                          imageView: characterImage)
        
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    private func applyVisuals() {
        CharacterPresenter.LabelStyle(textColor: .accentColor,
                                      fontSize: 28.0,
                                      weight: .bold,
                                      to: nameLabel)
        
        CharacterPresenter.LabelStyle(textColor: .lightColor,
                                      fontSize: 20.0,
                                      weight: .medium,
                                      to: speciesLabel,statusLabel, genderLabel)
        
        CharacterPresenter.StatusColor(status: character.status, label: statusLabel)
             
        view.backgroundColor = .secondaryColor
        characterImage.layer.cornerRadius = 25

    }

}


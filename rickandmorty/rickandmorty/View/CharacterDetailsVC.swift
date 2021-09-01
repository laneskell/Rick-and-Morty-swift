//
//  CharacterDetailsVC.swift
//  rickandmorty
//
//  Created by Kell Lanes on 31/08/21.
//

import Foundation
import UIKit

class CharacterDetailsVC: UIViewController {
    
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
    // MARK: - Helpers
    
    private func updateInformation() {
        
        nameLabel.text = character.name
        speciesLabel.text = character.species
        statusLabel.text = character.status
        genderLabel.text = character.gender
        
        let url = URL(string: character!.image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
            self.characterImage.image = UIImage(data: data!)
            }
        }
        
    }
    
    private func applyVisuals() {
   
        nameLabel.textColor = .red
        
    }
    
    
}


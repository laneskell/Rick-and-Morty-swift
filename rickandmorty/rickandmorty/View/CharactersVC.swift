//
//  CharactersVC.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import Foundation
import UIKit

class CharacterVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var charactersTableView: UITableView!
    
    var selectedRow = 0
    var arrayResult: [CharacterModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersTableView.register(UINib(nibName: "characterCell", bundle: nil),
                                          forCellReuseIdentifier: "idCharacterList")
        
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        loadCharacter()
        title = "Personagens"
        view.backgroundColor = .primaryColor
        
    }
    
    func loadCharacter() {
        APIService.getCharacteres(completionHandler: {data,error,array in
            self.arrayResult = array
            DispatchQueue.main.async {
                self.charactersTableView.reloadData()
            }
        })
    }
}

    // MARK: - UITableView
extension CharacterVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayResult.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = charactersTableView.dequeueReusableCell(withIdentifier: "idCharacterList", for: indexPath) as? CharacterCell {
            let character = self.arrayResult[indexPath.row]
            cell.nameLabel.text = character.name
            cell.speciesLabel.text = character.species
            cell.statusLabel.text = character.status
            CharacterPresenter.ConvertImageUrl(urlImage: character.image,
                                              imageView: cell.characterImage)

            CharacterPresenter.StatusColor(status: character.status, label: cell.statusLabel)
            
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsCharacterVC") as! CharacterDetailsVC
        detailsVC.character = arrayResult[self.selectedRow]
        self.present(detailsVC, animated:true, completion:nil)
    }
    
  
    
}

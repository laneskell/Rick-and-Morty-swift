//
//  CharacterViewModel.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import Foundation
import UIKit

class CharacterViewModel: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    var arrayCharacteres: [CharacterModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.charactersTableView.register(UINib(nibName: "characterCell", bundle: nil), forCellReuseIdentifier: "idCharacterList")
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        loadCharacter()
    }
    
    func loadCharacter() {
        APIService.getCharacteres(completion: {data,error,array in
            self.arrayCharacteres = array
            DispatchQueue.main.async {
                self.charactersTableView.reloadData()
            }
        })
    }
}

extension CharacterViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCharacteres.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = charactersTableView.dequeueReusableCell(withIdentifier: "idCharacterList", for: indexPath) as? characterCell {
            let character = self.arrayCharacteres[indexPath.row]
            cell.nameLabel.text = character.name
            cell.speciesLabel.text = character.species
            cell.statusLabel.text = character.status
            cell.downloadImage(urlImage: character.image)
            return cell
        }
        return UITableViewCell()
    }
    
}


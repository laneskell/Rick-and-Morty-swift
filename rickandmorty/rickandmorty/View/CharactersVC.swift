//
//  CharacterViewModel.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import Foundation
import UIKit

class CharacterVC: UIViewController {

    @IBOutlet weak var charactersTableView: UITableView!
    
    var arrayResult: [CharacterModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersTableView.register(UINib(nibName: "characterCell", bundle: nil), forCellReuseIdentifier: "idCharacterList")
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        loadCharacter()
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

extension CharacterVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayResult.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = charactersTableView.dequeueReusableCell(withIdentifier: "idCharacterList", for: indexPath) as? characterCell {
            let character = self.arrayResult[indexPath.row]
            cell.nameLabel.text = character.name
            cell.speciesLabel.text = character.species
            cell.statusLabel.text = character.status
            cell.downloadImage(urlImage: character.image)
            return cell
        }
        return UITableViewCell()
    }
    
}




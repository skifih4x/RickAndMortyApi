//
//  CharactersTableViewCell.swift
//  RickAndMortyApi
//
//  Created by Артем Орлов on 27.06.2022.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet var imageCharacters: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    func configure(with characters: Characters) {
        nameLabel.text = "name: \(characters.name ?? "")"
        speciesLabel.text = characters.species
        genderLabel.text = characters.gender
        DispatchQueue.global().async {
            guard let url = URL(string: characters.image ?? "") else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                self.imageCharacters.image = UIImage(data: imageData)
            }
        }
    }
}

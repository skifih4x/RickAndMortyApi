//
//  CharacterTableViewCell.swift
//  RickAndMortyApi
//
//  Created by Артем Орлов on 27.06.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    func configure(with character: Characters) {
        nameLabel.text = character.name
    }
}

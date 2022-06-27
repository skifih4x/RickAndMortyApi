//
//  MainTableViewController.swift
//  RickAndMortyApi
//
//  Created by Артем Орлов on 27.06.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let urlString = "https://rickandmortyapi.com/api/character"
    
    var characters = [Characters]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return  characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        let array = characters[indexPath.row]
        cell.configure(with: array)
        return cell
    }
}

//MARK: - Networking
extension MainTableViewController {
    func fetchCharacter() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let character = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self.characters = character.results
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

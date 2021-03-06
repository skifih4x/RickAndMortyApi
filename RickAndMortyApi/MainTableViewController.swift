//
//  MainTableViewController.swift
//  RickAndMortyApi
//
//  Created by Артем Орлов on 27.06.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var characters = [Characters]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
        tableView.rowHeight = 110
        tableView.register(UINib(nibName: "CharactersTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return  characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharactersTableViewCell
        let array = characters[indexPath.row]
        cell.configure(with: array)
        return cell
    }
}

//MARK: - Networking
extension MainTableViewController {
    func fetchCharacter() {
        guard let url = URL(string: Link.urlString.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            print(data)
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

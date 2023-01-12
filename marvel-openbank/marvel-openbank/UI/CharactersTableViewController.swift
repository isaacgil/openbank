//
//  CharactersTableViewController.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import UIKit

class CharactersTableViewController: UITableViewController {

    var data: CharacterDataContainer?{
        didSet{
            if let data = data, let res = data.results {
                offset = (data.offset ?? 0) + (data.count ?? 0)
                results.append(contentsOf: res)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var results:[Character] = []
    var offset = 0
    var loadingData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        self.title = "CHARACTERS"
    }
    private func getData(){
        if loadingData{
            return
        }
        
        loadingData = true
        
        APIManager.instance().getCharacters(offset:offset) { data in
            self.data = data
            self.loadingData = false
        }
    }
    private func loadMore(){
        if let data = data, results.count < data.total ?? 0{
            getData()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return results.count > 0 ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell

        cell.character = results[indexPath.row]
        
        if indexPath.row == results.count - 1{
            loadMore()
        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailSegue", sender: results[indexPath.row])
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"{
            let vc = segue.destination as? CharacterDetailTableViewController
            if let character = sender as? Character{
                vc?.character = character
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

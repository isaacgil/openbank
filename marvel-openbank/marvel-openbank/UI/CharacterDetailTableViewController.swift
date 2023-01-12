//
//  CharacterDetailTableViewController.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 12/1/23.
//

import UIKit

class CharacterDetailTableViewController: UITableViewController {
    
    var character:Character? = nil{
        didSet{
            lists = character?.getLists() ?? []
        }
    }
    
    var lists:[Codable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = lists[section] as? ComicList{
            return list.items?.count ?? 0
        }
        else if let list = lists[section] as? EventList{
            return list.items?.count ?? 0
        }
        else if let list = lists[section] as? SeriesList{
            return list.items?.count ?? 0
        }
        else if let list = lists[section] as? StoryList{
            return list.items?.count ?? 0
        }

        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath)

        if let list = lists[indexPath.section] as? ComicList{
            cell.textLabel?.text = list.items?[indexPath.row].name
        }
        else if let list = lists[indexPath.section] as? EventList{
            cell.textLabel?.text = list.items?[indexPath.row].name
        }
        else if let list = lists[indexPath.section] as? SeriesList{
            cell.textLabel?.text = list.items?[indexPath.row].name
        }
        else if let list = lists[indexPath.section] as? StoryList{
            cell.textLabel?.text = list.items?[indexPath.row].name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let _ = lists[section] as? ComicList{
            return "COMICS"
        }
        else if let _ = lists[section] as? EventList{
            return "EVENTS"
        }
        else if let _ = lists[section] as? SeriesList{
            return "SERIES"
        }
        else if let _ = lists[section] as? StoryList{
            return "STORIES"
        }
        
        return nil
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailHeaderSegue"{
            let vc = segue.destination as? CharacterHeaderDetailViewController
            vc?.character = self.character
        }
    }
    

}

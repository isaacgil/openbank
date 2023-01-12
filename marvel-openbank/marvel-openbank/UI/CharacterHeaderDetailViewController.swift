//
//  CharacterHeaderDetailViewController.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 12/1/23.
//

import UIKit

class CharacterHeaderDetailViewController: UIViewController {
    
    var character:Character? = nil
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.image.load(url: character?.thumbnail?.getUrl())
        self.name.text = character?.name;
        self.desc.text = character?.description
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

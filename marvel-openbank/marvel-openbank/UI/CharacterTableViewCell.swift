//
//  CharacterTableViewCell.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 12/1/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    var character:Character?{
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var presence: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func updateView(){
        guard let character = character else {
            return
        }
        
        self.name.text = character.name;
        self.presence.text = character.description
        self.thumb.load(url: character.thumbnail?.getUrl())
    }
}

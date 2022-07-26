//
//  MenuTableViewCell.swift
//  Test
//
//  Created by Michael Nelson on 25/07/2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var optionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setUpView(with title: String) {
        optionTitle.text = title
    }
}

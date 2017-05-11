//
//  PickFromListTableViewCell.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

protocol CellButtonPressed {

    func didPressCellButton(_ sender: Any)
}

class PickFromListTableViewCell: UITableViewCell {
    
    var id : Int = 0
    
    var myTableViewController : PickFromListViewController?
    
    @IBOutlet weak var itemLabel: UILabel!
    var delegate: CellButtonPressed?
    
    @IBAction func removeButtonIsPressed(_ sender: Any) {
        delegate?.didPressCellButton(sender)
        myTableViewController?.deleteCell(cell: self)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

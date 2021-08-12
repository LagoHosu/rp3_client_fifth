//
//  TableViewCell.swift
//  podTest
//
//  Created by Lago on 2021/08/10.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    var cellDelegate: cellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


protocol cellDelegate : class {
    func didPressButton(_ tag: Int)
}

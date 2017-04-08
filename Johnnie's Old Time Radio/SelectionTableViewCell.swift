//
//  SelectionTableViewCell.swift
//  Johnnie's Old Time Radio
//
//  Created by Johnnie Ruffin on 2/21/17.
//  Copyright © 2017 Johnnie Ruffin. All rights reserved.
//

import UIKit

class SelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnCloud: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

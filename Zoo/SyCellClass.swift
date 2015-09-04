//
//  SyCellClass.swift
//  Zoo
//
//  Created by caole on 15/9/4.
//  Copyright (c) 2015年 pincher. All rights reserved.
//

import UIKit

class SyTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        
        
        
        
    }
    
    
    @IBOutlet weak var SyContentImage: UIImageView!
    @IBOutlet weak var SyContentTitle: UILabel!
    @IBOutlet weak var SyContentTime:  UILabel!
    @IBOutlet weak var SyContentCount: UILabel!

    
}


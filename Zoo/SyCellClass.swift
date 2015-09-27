//
//  SyCellClass.swift
//  Zoo
//
//  Created by caole on 15/9/4.
//  Copyright (c) 2015年 pincher. All rights reserved.
//

import UIKit

class SyTableViewCell: UITableViewCell {
    
    
    
    //屏幕尺寸
    let Screen = UIScreen.mainScreen().bounds

    
    //创建元素
    let SyContentTitle = UILabel()
    let SyContentImage = UIImageView()
    let SyContentTime = UILabel()

    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        
        let ScreenWidth = Screen.width
        
        SyContentTitle.numberOfLines = 2
        SyContentTitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        SyContentTitle.textAlignment = NSTextAlignment.Justified


        
        //屏幕尺寸判断
        
        
        if Screen.width == 320.0{
            
            SyContentImage.frame = CGRectMake(2, 18, 282, 153)
            SyContentTitle.frame = CGRectMake(2, 182, 282, 50)   //  iphone 5  *1.17
            self.frame = CGRectMake(0, 0, ScreenWidth, 180)
        
        }
        
        
        
        if Screen.width == 375.0{
            
            SyContentImage.frame = CGRectMake(26,22,ScreenWidth-48,180) //  iphone 6  331*180
            SyContentTitle.frame = CGRectMake(26,200, ScreenWidth-48,50)
            SyContentTime.frame = CGRectMake(26, 240, ScreenWidth-4, 20)
            self.frame = CGRectMake(0, 0, ScreenWidth, 0)
            
        }
        
        
        
        if Screen.width == 414.0{
            
            SyContentImage.frame = CGRectMake(24, 24, 364, 198)   // iphone 6 plus   1.10
            SyContentTitle.frame = CGRectMake(24, 235,364, 30)
            
        }
        
        

    }
  
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    
            
        
    }
    
  
    
}


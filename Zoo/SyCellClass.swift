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
    let syContentTitle = UILabel()
    let syContentImage = UIImageView()
    let syContentTime = UILabel()
    let syContentSource = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        
        let ScreenWidth = Screen.width
        
        syContentTitle.numberOfLines = 2
        syContentTitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        syContentTitle.textAlignment = NSTextAlignment.Justified


        
        //屏幕尺寸判断
        
        
        if Screen.width == 320.0{
            
            syContentImage.frame = CGRectMake(2, 18, 282, 153)
            syContentTitle.frame = CGRectMake(2, 182, 282, 50)   //  iphone 5  *1.17
            syContentTime.frame  = CGRectMake(2, 182, 282, 50)
             self.frame = CGRectMake(0, 0, ScreenWidth, 180)
        
        }
        

        
        if Screen.width == 375.0{
            
            syContentImage.frame = CGRectMake(235,0,140,95) //  iphone 6  331*180
            syContentTitle.frame = CGRectMake(10,20, 210,50)
            syContentTime.frame  = CGRectMake(190, 70, 100, 20)
            syContentSource.frame = CGRectMake(10, 70, 100, 20)
            
            syContentTitle.font     = UIFont(name:"Arial", size: 15)
            syContentSource.font    = UIFont(name:"Arial", size: 10)
            syContentTime.font      = UIFont(name: "Arial", size: 10)
            syContentSource.textColor = UIColor.grayColor()
            syContentTime.textColor = UIColor.grayColor()
            
        
        }
        
        
        
        if Screen.width == 414.0{
            
            syContentImage.frame = CGRectMake(24, 24, 364, 198)   // iphone 6 plus   1.10
            syContentTitle.frame = CGRectMake(24, 235,364, 30)
            
        }
        
        
        self.addSubview(syContentTitle)
        self.addSubview(syContentImage)
        self.addSubview(syContentTime)
        self.addSubview(syContentSource)
        

    }
  
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    
            
        
    }
    
  
    
}


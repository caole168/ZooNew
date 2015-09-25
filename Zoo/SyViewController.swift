//
//  ViewController.swift
//  Zoo
//
//  Created by Ifeng on 15/9/3.
//  Copyright (c) 2015年 pincher. All rights reserved.
//


import UIKit

class SyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    var plistData:NSString = ""
    var data:NSMutableDictionary = NSMutableDictionary()
    var SendUrl:NSString!
    var SendTitle:NSString!
    //var plist
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //  -----------读取plist文件----------------
        plistData = NSBundle.mainBundle().pathForResource("SyPlist", ofType: "plist")!
        data = NSMutableDictionary(contentsOfFile: plistData as String)!
        
   
        
 

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return data.count
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
   //     var tableCell : SyTableViewCell = tableView.dequeueReusableCellWithIdentifier("SyCell") as! SyTableViewCell
        
        
        let tableCell : SyTableViewCell = tableView.dequeueReusableCellWithIdentifier("SyCell", forIndexPath: indexPath) as! SyTableViewCell
   
        
        
        //屏幕尺寸
        let Screen = UIScreen.mainScreen().bounds
        let ScreenWidth = Screen.width
        let ScreenHeight = Screen.height

  
    
            
        //cell元素
        let SyContnetImage = UIImageView()
        let SyContentTitle = UILabel()
        SyContentTitle.numberOfLines = 2
        SyContentTitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        SyContentTitle.textAlignment = NSTextAlignment.Justified
        
        let SyContentTime = UILabel()
        SyContentTime.font = UIFont(name: "", size: 1)
        
        tableView.rowHeight = 260
        
        //加载数据
        let dataRow = indexPath.row + 1 //数组元素从1开始的，所以+1 ，indexPath默认为0
        let dataGroup = data["\(dataRow)"] as! NSDictionary
        let ImageUrl = dataGroup["image"] as! NSString
        
    
        

        
        //屏幕尺寸判断
        

        if Screen.width == 320.0{
            
            SyContnetImage.frame = CGRectMake(2, 18, 282, 153)
            SyContentTitle.frame = CGRectMake(2, 182, 282, 50)   //  iphone 5  *1.17
            tableCell.frame = CGRectMake(0, 0, ScreenWidth, 180)
          //  print(tableCell.frame)

            
        }

        
        
        if Screen.width == 375.0{
            SyContnetImage.frame = CGRectMake(26,22,ScreenWidth-48,180) //  iphone 6  331*180
            SyContentTitle.frame = CGRectMake(26,200, ScreenWidth-48,50)
            SyContentTime.frame = CGRectMake(26, 240, ScreenWidth-4, 20)
            tableCell.frame = CGRectMake(0, 0, ScreenWidth, 0)
        
           // print(tableCell.frame)

            
                        }
        
        
        
        if Screen.width == 414.0{
            
            SyContnetImage.frame = CGRectMake(24, 24, 364, 198)   // iphone 6 plus   1.10
            SyContentTitle.frame = CGRectMake(24, 235,364, 30)
        }
        
        

        
    
        //添加页面元素
        tableCell.addSubview(SyContnetImage)
        tableCell.addSubview(SyContentTitle)
 //       tableCell.addSubview(SyContentTime)
        
     
        
        //赋值
        SyContnetImage.image = UIImage(named:"\(ImageUrl)")
        SyContentTitle.text = dataGroup["title"] as? String
        SyContentTime.text = dataGroup["time"] as? String
 
            
        
    
        return tableCell
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        return 100
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
    
        
        let dataRow = indexPath.row + 1
        let dataGroup = data["\(dataRow)"] as! NSDictionary
        
        SendUrl = dataGroup["url"] as! NSString
        SendTitle = dataGroup["title"] as! NSString
        
    
        let goDetailContent = DetailViewController()
        
        goDetailContent.ReceiveUrl = SendUrl
        goDetailContent.PageTitle = SendTitle
      //  print(goDetailContent.ReceiveUrl)
      //  print(goDetailContent.PageTitle)
        self.performSegueWithIdentifier("goDetailContentSegue", sender: indexPath)

        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
             //segue 传值
        
                if segue.identifier == "goDetailContentSegue"{
                    
                    let goDetailContent = segue.destinationViewController as! DetailViewController
                   
                    goDetailContent.ReceiveUrl = SendUrl

                }
    
        
    }
    
    
}


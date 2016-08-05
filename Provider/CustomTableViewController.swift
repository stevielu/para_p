//
//  CustomTableViewController.swift
//  Provider
//
//  Created by imac on 4/08/16.
//  Copyright © 2016 newnergy. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    var providersArray = [Provider]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.layoutMargins = UIEdgeInsetsZero
        self.tableView.frame = CGRectMake(0, 25, globalStyle.screenSize.width, globalStyle.screenSize.height)
        self.tableView.rowHeight = 75.0
        self.tableView.separatorColor = globalStyle.backgroundColor
        self.tableView.registerClass(myCell.self, forCellReuseIdentifier: "cellId")
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 37.5, 0)
        loadingContent()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return providersArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! myCell
        
        // Configure the cell...
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
        //cell.separatorInset = UIEdgeInsetsZero
        let provider = providersArray[indexPath.row]
        cell.UserName.text = provider.model
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.stringFromDate(currentDate)
        
        let diffDate = help.differenceDate(lateDate: today, earlierDate: dateFormatter.stringFromDate(provider.date))
        if(diffDate.day == 0){
            cell.postDate.text = "List Today"
        }
        else if(diffDate.day > 7){
            cell.postDate.text = dateFormatter.stringFromDate(provider.date)
        }
        else if(diffDate.day == 1){
            cell.postDate.text = "Yesterday"
        }
        else{
            cell.postDate.text = String(format: "%d Days Ago", diffDate.day)
        }
        cell.subTitle.text = provider.subtitle
        cell.workType.text = provider.type
        cell.UserAvatar.image = UIImage(named: provider.image)
        print("The loaded image: \(provider.image)")

        return cell
    }
    
    func loadingContent(){
        //Load Providers from plist into Array
        let path = NSBundle.mainBundle().pathForResource("Providers", ofType: "plist")
        let dictArray = NSArray(contentsOfFile: path!)
        
        for providerItem in dictArray! {
            let newUser : Provider = Provider(type:(providerItem.objectForKey("type")) as! String, date: (providerItem.objectForKey("date")) as! NSDate, model: (providerItem.objectForKey("model")) as! String, image: (providerItem.objectForKey("image")) as! String,subtitle:(providerItem.objectForKey("subtitle")) as! String)
            providersArray.append(newUser)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class myCell: UITableViewCell {
    
   
    override init(style:UITableViewCellStyle,reuseIdentifier:String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemneted")
    }
    
    let UserName:UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = globalStyle.nameTitleFont
        nameLabel.textColor = globalStyle.nameTextColor
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let postDate:UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = globalStyle.dateTitleFont
        dateLabel.textColor = globalStyle.subTitleColor2
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    
    let subTitle:UILabel = {
        let TitleLabel = UILabel()
        TitleLabel.font = globalStyle.dateTitleFont
        TitleLabel.textColor = globalStyle.subTitleColor2
        TitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return TitleLabel
    }()
    
    let workType:UILabel = {
        let TypeLabel = UILabel()
        TypeLabel.font = globalStyle.nameTitleFont
        TypeLabel.textColor = globalStyle.backgroundColor
        TypeLabel.translatesAutoresizingMaskIntoConstraints = false
        return TypeLabel
    }()
    
    let UserAvatar:UIImageView = {
        let avatar = UIImageView()
        avatar.image = help.reSizeImage(scaledToSize: globalStyle.avatarSize)
        avatar.layer.cornerRadius = 25.0;
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = globalStyle.backgroundColor.CGColor
        avatar.clipsToBounds = true;
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    
    func setupViews(){
        addSubview(UserName)
        addSubview(UserAvatar)
        addSubview(postDate)
        addSubview(subTitle)
        addSubview(workType)
        //auotlayout Username
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-87.5-[v0(>=100)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":UserName]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0(>=25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":UserName]))
        
        //autolayout avatar
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-12.5-[v1(<=50)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":UserAvatar]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-12.5-[v1(<=50)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":UserAvatar]))
        
        //autolayout date
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[v2]-12.5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":postDate]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v2(>=25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":postDate]))
        
        //autolayout subtitle
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-87.5-[v3(<=140)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v3":subTitle]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[v3(>=25)]-12.5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v3":subTitle]))
        
        //autolayout type
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[v4(<=120)]-12.5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v4":workType]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[v4(>=25)]-12.5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v4":workType]))
    }
}

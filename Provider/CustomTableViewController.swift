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
        cell.UserAvatar.image = UIImage(named: provider.image)
        print("The loaded image: \(provider.image)")

        return cell
    }
    
    func loadingContent(){
        //Load Providers from plist into Array
        let path = NSBundle.mainBundle().pathForResource("Providers", ofType: "plist")
        let dictArray = NSArray(contentsOfFile: path!)
        
        for providerItem in dictArray! {
            let newUser : Provider = Provider(type:(providerItem.objectForKey("type")) as! String, maker: (providerItem.objectForKey("maker")) as! String, model: (providerItem.objectForKey("model")) as! String, image: (providerItem.objectForKey("image")) as! String)
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
    
    let UserAvatar:UIImageView = {
        let avatar = UIImageView()
        avatar.image = help.reSizeImage(scaledToSize: globalStyle.avatarSize)
        avatar.layer.cornerRadius = 25.0;
        avatar.clipsToBounds = true;
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    
    func setupViews(){
        addSubview(UserName)
        addSubview(UserAvatar)
        //auotlayout Username
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-87.5-[v0(>=100)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":UserName]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0(>=25)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":UserName]))
        
        //autolayout avatar
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-12.5-[v1(<=50)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":UserAvatar]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-12.5-[v1(<=53)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":UserAvatar]))
    }
}

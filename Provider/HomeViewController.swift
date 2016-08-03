//
//  HomeViewController.swift
//  Provider
//
//  Created by imac on 1/08/16.
//  Copyright © 2016 newnergy. All rights reserved.
//

import UIKit

class HomeViewController: CustomNavgationbarItemsViewController,UISearchBarDelegate, CustomSearchControllerDelegate
{
    
    
    var searchBarController = UISearchController(searchResultsController:nil);
    var customSearchController: CustomSearchControllerViewController!
    
    //locate elements
    let sortViewContainer = UILabel(frame: CGRectMake(0, 0, globalStyle.screenSize.width, 25))
    let sortByTypeButton = UIButton(frame: CGRectMake(50, 0, 75, 25))
    let sortByDateButton = UIButton(frame: CGRectMake(142.5, 0, 75, 25))
    let sortByLocationButton = UIButton(frame: CGRectMake(235, 0, 75, 25))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCustomSearchController()
        setupSortView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
//    func createSearchbar(){
//        searchBarController.searchResultsUpdater = self
//        searchBarController.dimsBackgroundDuringPresentation = false
//        searchBarController.hidesNavigationBarDuringPresentation = false
//        searchBarController.searchBar.tintColor = UIColor.whiteColor()
//        searchBarController.searchBar.placeholder = "Type in any key words"
//        self.definesPresentationContext = true
//        
//        
//        
//        self.navigationItem.titleView = searchBarController.searchBar
//    }
    
    func setupSortView(){
        
        //load buttom images
        defaultSortButtonView()
        
        //add button
        sortByTypeButton.addTarget(self, action: #selector(self.sortBytype), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(sortByTypeButton)
        
        sortByDateButton.addTarget(self, action: #selector(self.sortBydate), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(sortByDateButton)
        
        sortByLocationButton.addTarget(self, action: #selector(self.sortBylocation), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(sortByLocationButton)
        
        //add sort container
        sortViewContainer.layer.addBorder(UIRectEdge.Bottom, color: globalStyle.backgroundColor, thickness: globalStyle.thickness)
        self.view.addSubview(sortViewContainer)
        //sortViewContainer.frame = CGRectMake(12.5, 0, globalStyle.screenSize.width, 25)//= UILabel(frame: CGRectMake(12.5, 0, globalStyle.screenSize.width, 25))
        //sortViewContainer.layer.addBorder(UIRectEdge.Bottom, color: globalStyle.backgroundColor, thickness: globalStyle.thickness)
    }
    
    func recentSearchTap(){
        //create recent search tap
        //let recentTapView = CustomNavgationbarItemsViewController(CGRect(0,0,25,100))
        
        let recentTapView = UILabel(frame: CGRectMake(12.5, 0, globalStyle.screenSize.width, 25))
        recentTapView.textAlignment = NSTextAlignment.Left
        recentTapView.text = "Recent search:"
        recentTapView.textColor = globalStyle.subTitleColor
        recentTapView.font = globalStyle.subTitleFontsize
        addRecentSearchBottomBorder()
        //recentTapView.layer.addBorder(UIRectEdge.Bottom, color: globalStyle.backgroundColor, thickness: globalStyle.thickness)
        self.view.addSubview(recentTapView)
        
    }
    
    func addRecentSearchBottomBorder(){
        let border = UILabel(frame: CGRectMake(0, 0, globalStyle.screenSize.width, 25))
        border.layer.addBorder(UIRectEdge.Bottom, color: globalStyle.backgroundColor, thickness: globalStyle.thickness)
        self.view.addSubview(border)
    }
    
    func defaultSortButtonView(){
        sortByTypeButton.setImage(iconLists.imgBtnType, forState: UIControlState.Normal)
        sortByDateButton.setImage(iconLists.imgBtnDate, forState: UIControlState.Normal)
        sortByLocationButton.setImage(iconLists.imgBtnLocation, forState: UIControlState.Normal)
    }
    
    func sortBytype(){
        defaultSortButtonView()
        
        
    }
    
    func sortBydate(){
        
    }
    
    func sortBylocation(){
        
    }
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchControllerViewController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, 200.0, 25.0), searchBarFont: globalStyle.subTitleFontsize!, searchBarTextColor: globalStyle.subTitleColor, searchBarTintColor: UIColor.whiteColor(),searchbarHeight:25.0,searchbarWidth:280.0)
        
        customSearchController.customSearchBar.placeholder = "Type in any key words"
        customSearchController.searchResultsUpdater = self
        customSearchController.dimsBackgroundDuringPresentation = false
        customSearchController.hidesNavigationBarDuringPresentation = false
        customSearchController.customSearchBar.showsCancelButton = false
        self.definesPresentationContext = true
        self.navigationItem.titleView = customSearchController.customSearchBar
        customSearchController.customDelegate = self
    }
    
    
    // MARK: CustomSearchControllerDelegate functions
    
    func didStartSearching() {
        customSearchController.customSearchBar.showsScopeBar = true
        
        //customSearchController.customSearchBar.sizeToFit()
        customSearchController.customSearchBar.setShowsCancelButton(true, animated: true)
//        shouldShowSearchResults = true
//        tblSearchResults.reloadData()
    }
    
    
    func didTapOnSearchButton() {
//        if !shouldShowSearchResults {
//            shouldShowSearchResults = true
//            tblSearchResults.reloadData()
//        }
    }
    
    
    func didTapOnCancelButton() {
        customSearchController.customSearchBar.showsScopeBar = false
        //customSearchController.customSearchBar.sizeToFit()
        customSearchController.customSearchBar.setShowsCancelButton(false, animated: true)
//        shouldShowSearchResults = false
//        tblSearchResults.reloadData()
    }
    
    
    func didChangeSearchText(searchText: String) {
//        // Filter the data array and get only those countries that match the search text.
//        filteredArray = dataArray.filter({ (country) -> Bool in
//            let countryText: NSString = country
//            
//            return (countryText.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
//        })
//        
//        // Reload the tableview.
//        tblSearchResults.reloadData()
    }
    
//    override func prefersStatusBarHidden() ->Bool
//    {
//        return true;
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController:UISearchResultsUpdating{
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        recentSearchTap()
    }
}

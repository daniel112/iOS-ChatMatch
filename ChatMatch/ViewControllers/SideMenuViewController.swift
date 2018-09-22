//
//  SideMenuViewController.swift
//  SideMenuHUB
//
//  Created by Daniel Yo on 12/17/17.
//  Copyright © 2017 Daniel Yo. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit
import SWRevealViewController
import SafariServices

class SideMenuViewController: UIViewController, ListAdapterDataSource, SideMenuOptionSectionControllerDelegate {
    
    //MARK: variables
    let websiteURL:String = "https://chatmatch.me/"
    var sideMenuObjects:Array = [ListDiffable]()
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = AppTheme().mainColor()
        view.alwaysBounceVertical = true
        return view
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.createSideMenuObjects()
        self.adapter.performUpdates(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Private Methods
    private func setupView() {
        
        //collectionView
        view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
        
        //adapter
        self.adapter.collectionView = self.collectionView
        self.adapter.dataSource = self
    }
    
    private func navigateToWebView(withURLstring urlString:String) {
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            vc.preferredBarTintColor = AppTheme().mainColor()
            self.present(vc, animated: true)
        }
    }
    
    private func createSideMenuObjects() {
        //header
        self.sideMenuObjects.append(SideMenuHeader.init(withName: "ChatMatch", image: nil)!)
        //options
        self.sideMenuObjects.append(SideMenuItem.init(withName: "Home", image: UIImage(named: "sidemenu_home"))!)
        self.sideMenuObjects.append(SideMenuItem.init(withName: "Website", image:UIImage(named: "sidemenu_desktop"))!)
    }
    
    //MARK: Delegates
    // ListAdapterDataSource
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.sideMenuObjects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        //header
        if (object is SideMenuHeader) {
            return SideMenuHeaderSectionController.init(withRevealWidth: self.revealViewController().rearViewRevealWidth)
            
        } else {
            return SideMenuItemSectionController.init(withRevealWidth: self.revealViewController().rearViewRevealWidth, delegate:self)
        }
        
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    // SideMenuOptionSectionControllerDelegate
    func didSelectSideMenuOptionItem(item: SideMenuItem) {
        if (item.name == "Website") {
            self.navigateToWebView(withURLstring: self.websiteURL)
        } else if (item.name == "Home") {
            self.revealViewController().pushFrontViewController(UINavigationController.init(rootViewController: HomeViewController()), animated: true)
        }
        self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
    }
}

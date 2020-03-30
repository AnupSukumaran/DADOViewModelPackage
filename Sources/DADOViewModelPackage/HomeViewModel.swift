//
//  HomeViewModel.swift
//  Dado_App
//
//  Created by Manu Puthoor on 27/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit
import SASLogger
import SASStringAttributePack


public class HomeViewModel: NSObject {
    
    public var table: UITableView!
    
    override init() {
        super.init()
    }
    
    public init(table: UITableView) {
        self.table = table
    }
    
    public func adaptingTableViewCells() {
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 600
    }
    
    public func sectionCount(in tableView: UITableView, count: (tb1Count: Int, tb2Count: Int)) -> Int {
        var sectionCount = 0
        if tableView.tag == 1 {
            sectionCount = count.tb1Count
        } else {
           sectionCount = count.tb2Count
        }
        Logger.p("sectionCount = \(sectionCount)")

        return sectionCount
    }
    
    public func sectionTitle(_ tableView: UITableView,_ section: Int, items: [String]) -> String? {
        var titleString = ""
        if tableView.tag == 2 {
           titleString = items[section]
        }
        return titleString
    }
    
    public func sectionView(_ tableView: UITableView,_ section: Int, items: [String],_ bgClr: UIColor, fontSize: CGFloat) -> UIView? {
        var vi: UIView?
        if tableView.tag == 2 {
           vi = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 28))
           vi!.backgroundColor = bgClr
           
           let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: (vi?.frame.width)!, height: (vi?.frame.height)!))
           vi?.addSubview(titleLabel)
           titleLabel.attributedText = NSMutableAttributedString()
            .newFontSize(stringValue: items[section], fSize: 14)

        } else {
           vi = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
           vi!.backgroundColor = bgClr
        }

        return vi
    }
    
    public func itemsCountForEachSection<key:Comparable,val>(dict: [key:[val]], section: Int) -> Int {
        let itemKeys = dict.map{$0.key}.sorted()
        return dict[itemKeys[section]]!.count
    }
    
    public func numberOfRowsInSection<T,key:Comparable,val>(_ tableView: UITableView,_ section: Int,_ shouldShowSearchResults: Bool, mainArray: [T], filteredArray:[T], dict: [key:[val]]) -> Int {
        var newItemCount = 0
        
        if tableView.tag == 1 {
            newItemCount = shouldShowSearchResults ? filteredArray.count: mainArray.count
        } else {
            newItemCount =  itemsCountForEachSection(dict: dict, section: section)
        }

        return newItemCount
    }
    
    public func cellHeight(_ tableView: UITableView,heigth: (CGFloat,CGFloat)) -> CGFloat {
        if tableView.tag == 1 {
           return heigth.0
        } else {
           return heigth.1
        }
    }
    
    
    
    
    
}

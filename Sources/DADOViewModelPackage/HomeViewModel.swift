//
//  HomeViewModel.swift
//  Dado_App
//
//  Created by Manu Puthoor on 27/02/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit

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
    
}

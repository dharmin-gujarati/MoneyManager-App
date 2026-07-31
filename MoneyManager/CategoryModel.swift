//
//  CategoryModel.swift
//  MoneyManager
//
//  Created by CDMI on 19/03/26.
//

import Foundation

class CategoryModel {
  
    
    var categoryid : Int64
    var maincategory : String
    var categorytype : Int
    
    init(categoryid:Int64, maincategory: String , categorytype : Int) {
        
        self.categoryid = Int64(categoryid)
        self.maincategory = maincategory
        self.categorytype = categorytype
    }
    
}

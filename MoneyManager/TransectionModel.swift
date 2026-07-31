//
//  TransectionModel.swift
//  MoneyManager
//
//  Created by CDMI on 16/03/26.
//

import Foundation

class TransectionModel {
    var id : Int64
    var category : String
    var type : Int
    let date : Date
    let comment : String
    let ammount : Float
    
    
    
    init(id:Int64, category: String , type : Int , date : Date , comment : String , ammount : Float) {
        self.id = Int64(id)
        self.category = category
        self.type = type
        self.date = date
        self.comment = comment
        self.ammount = ammount
        
    }
    
}

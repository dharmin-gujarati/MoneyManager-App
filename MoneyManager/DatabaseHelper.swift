//
//  DatabaseHelper.swift
//  MoneyManager
//
//  Created by CDMI on 16/03/26.
//

import SQLite
import Foundation

class DatabaseHelper {
    static let DIR_TASK_DB = "LectureDB"
    static let STORE_category = "lecture.sqlite3"
    
    private var db: Connection? = nil
    let users = Table("user")
    let id = Expression<Int64>("id")
    let category = Expression<String>("category")
    let type = Expression<Int>("type")
    let date = Expression<Date>("date")
    let comment = Expression<String>("comment")
    let ammount = Expression<Double>("ammount")
    
    let categorys = Table("category")
    let categoryid = Expression<Int64>("categoryid")
    let maincategory = Expression<String>("maincategory")
    let categorytype = Expression<Int>("categorytype")
    
    
    
    init() {
        // get document dir
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            // append LectureDB in document dir
            let dirPath = docDir.appendingPathComponent(Self.DIR_TASK_DB)
            
            do {
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                // append database in folder dir
                let dbPath = dirPath.appendingPathComponent(Self.STORE_category).path
                // start connection
                db = try Connection(dbPath)
                print(" :::::::::::::  SQLiteDataStore init successfully at: \(dbPath) ")
                createTable()
                createTable1()
            } catch {
                db = nil
                print(" :::::::::::::  SQLiteDataStore init error: \(error)")
            }
        } else {
            db = nil
        }
    }
    
    func createTable() {
        guard let database = db else {
            return
        }
        do {
//                        try database.execute("drop table user")
            try database.execute("CREATE TABLE IF NOT EXISTS user(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT , type INTEGER , date DATE , comment TEXT , ammount DOUBLE)")
            print(" :::::::::::::  create table successfully")
        }catch {
            print(" :::::::::::::  create table error: \(error)")
        }
    }
    func createTable1() {
        guard let database = db else {
            return
        }
        do {
//                        try database.execute("drop table category")
            try database.execute("CREATE TABLE IF NOT EXISTS category(categoryid INTEGER PRIMARY KEY AUTOINCREMENT, maincategory TEXT , categorytype INTEGER)")
            print(" :::::::::::::  create table successfully")
        }catch {
            print(" :::::::::::::  create table error: \(error)")
        }
    }
    func addcategory(_ category: String , _ type : Int , _ date : Date , _ comment : String , _ ammount : Double) {
        
        guard let database = db else { return }
        
        do {
            let insert = users.insert(self.category <- category , self.type <- type, self.date <- date, self.comment <- comment , self.ammount <- ammount)
            try database.run(insert)
            print("add category successfully")
            
        } catch {
            print("add category error: \(error)")
        }
    }
    func addmaincategory(_ maincategory: String , _ categorytype : Int) {
        
        guard let database = db else { return }
        
        do {
            let insert = categorys.insert(self.maincategory <- maincategory, self.categorytype <- categorytype)
            try database.run(insert)
                        
            for category in try database.prepare(categorys) {
                
                let categoryid = category[self.categoryid]
                let maincategory = category[self.maincategory]
                let categorytype = category[self.categorytype]
                
                print("====>  \(categoryid)  |  \(maincategory)  |  \(categorytype)")
            }
            
            print("add category successfully")
            
        } catch {
            print("add category error: \(error)")
        }
    }
    func deletecategory(_ id: Int) {
        guard let database = db else {
            return
        }
        do {
            try database.execute("delete from user where id = \(id)")
            print(" :::::::::::::  user deleted successfully")
        }
        catch {
            print("Failed to delete data: \(error)")
        }
    }
    func editcategory(_ id: Int64 , _ category : String) {
        guard let database = db else {
            return
        }
        do {
            try database.execute("update category set category='\(category)' where id=\(id)")
            print(" :::::::::::::  categoru edited successfully")
        }
        catch {
            print("Failed to delete data: \(error)")
        }
    }
    func fetchUser() -> [TransectionModel] {
        var list: [TransectionModel] = []
        
        
        guard let database = db else {
            return list
        }
        
        do {
            for user in try database.prepare(users) {
                
                let id = user[self.id]
                let category = user[self.category]
                let type = user[self.type]
                let date = user[self.date]
                let comment = user[self.comment]
                let ammount = user[self.ammount]
                
                
                
                let model = TransectionModel(id: id, category: category , type: type , date: date , comment : comment , ammount : Float(ammount))
                list.append(model)
            }
            
            print("user fetch successfully")
            
        } catch {
            print("user fetch error: \(error)")
        }
        
        
        
        return list
    }
    func fetchCategory() -> [CategoryModel] {
        
        var categorylist: [CategoryModel] = []
        
        guard let database = db else {
            return categorylist
        }
        
        do{
            for category in try database.prepare(categorys) {
                
                let categoryid = category[self.categoryid]
                let maincategory = category[self.maincategory]
                let categorytype = category[self.categorytype]
                
                let model = CategoryModel(categoryid: categoryid, maincategory: maincategory , categorytype: categorytype)
                categorylist.append(model)
            }
        } catch {
            print("category fetch error: \(error)")
        }
        
        return categorylist
    }
    
}


//
//  DBHelper.swift
//  sqliteDemo
//
//  Created by Mac on 06/12/22.
//

import Foundation
import SQLite3

class DBHelper{
    
    init(){
        db = openDatabase()
        createTable()
    }
    var dbPath : String = "my_database.sqlite"
    var db : OpaquePointer?

// MARK - open the database
    func openDatabase() -> OpaquePointer?{
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        
        print("File URL -- \(fileURL.path)")
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &db) == SQLITE_FAIL{
          print("Error in database creation")
            return nil
        }else{
            print("Database created successfully -- \(dbPath)")
            print("Database is -- \(db)")
            return db
        }
    }
 //MARK - creating a table
    func createTable(){
        let createQueryString = "CREATE TABLE IF NOT EXISTS EMPLOYEE(EmpId INTEGER PRIMARY KEY,EmpName TEXT,EmpCity TEXT);"
        var createTableStatement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, createQueryString, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
                print("Employee table is created")
            }else{
                print("Employee table creation failed")
            }
        }else{
            print("Preparing the create table statement has failed ")
        }
        sqlite3_finalize(createTableStatement)
    }
    
 // MARK - function for insert the record
    func insertEmployeeRecordIntoEmployeeTable(empId : Int,empName : String,empCity : String){
        let insertQueryString = "INSERT INTO EMPLOYEE(EmpId,EmpName,EmpCity) VALUES(?,?,?);"
        var insertStatement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertQueryString, -1, &insertStatement, nil) == SQLITE_OK{
          
            sqlite3_bind_int(insertStatement,1, Int32(empId))
            
            sqlite3_bind_text(insertStatement, 2, (empName as NSString).utf8String, -1, nil)
            
            sqlite3_bind_text(insertStatement, 3, (empCity as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Row inserted successfully")
            }else{
                print("Row insertion failed")
            }
        }else{
            print("Statement could not prepared")
        }
        sqlite3_finalize(insertStatement)
    }
// MARK - function for delete emplpoyee record
    func deleteEmpById(empId : Int){
        let deleteQueryString = "DELETE FROM EMPLOYEE where EmpId =?;"
        var deleteStatement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, deleteQueryString, -1, &deleteStatement, nil) == SQLITE_OK{
            sqlite3_bind_int(deleteStatement, 1, Int32(empId))
            
            if sqlite3_step(deleteStatement) == SQLITE_DONE{
                print("The record of Employee with \(empId) is deleted ")
            }
            else{
                print("Record deletion failed")
            }
        }else{
            print("The  statement preparation for delete statement failed")
        }
        sqlite3_finalize(deleteStatement)
    }
}



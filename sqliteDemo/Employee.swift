//
//  Employee.swift
//  sqliteDemo
//
//  Created by Mac on 06/12/22.
//

import Foundation
class Employee{
    var empId : Int
    var empName : String
    var empCity : String
    
    init(empId : Int,empName : String,empCity : String){
        self.empId = empId
        self.empName = empName
        self.empCity = empCity
    }
    
    deinit{
        
    }
}

//var emp1 = Employee(empId: 10, empName: "sachin", empCity: "pune")

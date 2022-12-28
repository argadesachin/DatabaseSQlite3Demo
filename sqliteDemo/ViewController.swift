//
//  ViewController.swift
//  sqliteDemo
//
//  Created by Mac on 06/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        var dbHelper = DBHelper()
        dbHelper.insertEmployeeRecordIntoEmployeeTable(empId: 101, empName: "Sachin", empCity: "Pune")
        dbHelper.insertEmployeeRecordIntoEmployeeTable(empId: 102, empName: "Sagar", empCity: "Nagar")
        dbHelper.insertEmployeeRecordIntoEmployeeTable(empId: 103, empName: "Sanket", empCity: "Shevgao")
        dbHelper.insertEmployeeRecordIntoEmployeeTable(empId: 104, empName: "Digvijay", empCity: "Newasa")
        dbHelper.insertEmployeeRecordIntoEmployeeTable(empId: 105, empName: "Abhi", empCity: "Spur")
        
        dbHelper.deleteEmpById(empId: 111)
    }

}


//
//  Account.swift
//  GrandCentralDispatch
//
//  Created by PinguMac on 2018/4/16.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class Account {
  var balance: Int = 0
  
  private let queue = DispatchQueue(label: "test")
  
  func withdraw(amount: Int, completed: @escaping () -> ()) {
    queue.async {
      let newBalance = self.balance - amount
      
      if newBalance < 0 {
        print("You don't have enough money to withdraw \(amount)")
        return
      }
      
      // Simulate processing of fraud checks
      sleep(2)
      
      self.balance = newBalance
      
      DispatchQueue.main.async {
        completed()
      }
    }
  }
  
  func deposit(amount: Int, completed: @escaping () -> ()) {
    queue.async {
      let newBalance = self.balance + amount
      self.balance = newBalance
      
      DispatchQueue.main.async {
        completed()
      }
    }
  }
}

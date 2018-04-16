//
//  GCDViewController.swift
//  GrandCentralDispatch
//
//  Created by PinguMac on 2018/4/16.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {
  
  @IBOutlet weak var totalMoneyLabel: UILabel!
  
  let account = Account()
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func add(_ sender: Any) {
    self.account.deposit(amount: 100, completed: updateBalanceLabel)
  }
  
  @IBAction func minus(_ sender: Any) {
    self.account.withdraw(amount: 100, completed: updateBalanceLabel)
  }
  
  func updateBalanceLabel() {
    totalMoneyLabel.text = "Balance: $\(account.balance)"
  }
}

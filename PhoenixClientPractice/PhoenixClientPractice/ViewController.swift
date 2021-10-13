//
//  ViewController.swift
//  PhoenixClientPractice
//
//  Created by beomkey on 2021/10/12.
//

import UIKit
import SwiftPhoenixClient

class ViewController: UIViewController {
    let manager = SocketManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager.connect()
    }
}

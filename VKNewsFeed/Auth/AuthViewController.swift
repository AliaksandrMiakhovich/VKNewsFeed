//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Александр Мехович on 12/10/19.
//  Copyright © 2019 AlexMex. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authService = AppDelegate.shared().authService
    }
    
    @IBAction func singInTouch() {
        authService.wakeUpSession()
    }
    
   

}

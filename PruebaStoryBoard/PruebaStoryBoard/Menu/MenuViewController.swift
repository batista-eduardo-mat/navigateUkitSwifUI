//
//  MenuViewController.swift
//  PruebaStoryBoard
//
//  Created by David Eduardo Batista on 01/11/24.
//

import UIKit
import SwiftUI

class MenuViewController: LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goToViewSUI(_ sender: Any) {
        
        let swiftUIView = SwiftUIView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        self.navigationController?.present(hostingController, animated: true)
        
    }
}

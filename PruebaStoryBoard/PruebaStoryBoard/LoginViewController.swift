//
//  ViewController.swift
//  PruebaStoryBoard
//
//  Created by David Eduardo Batista on 01/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinoViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        navigationController?.pushViewController(destinoViewController, animated: true)
    }
}


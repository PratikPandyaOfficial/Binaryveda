//
//  ViewController.swift
//  BinaryvedaPT
//
//  Created by Pratik Pandya on 01/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRegister.layer.cornerRadius = 10
    }

    //MARK: ACTION
    @IBAction func btnRegister(_ sender: UIButton) {
        let VC = storyboard?.instantiateViewController(identifier: "ProfileView") as! ProfileView
        navigationController?.pushViewController(VC, animated: true)
    }
    
}


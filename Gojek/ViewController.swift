//
//  ViewController.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 17/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureHomeServicesCard()
    }
    
    func configureHomeServicesCard() {
        let vc = HomeServicesViewController()
        vc.view.backgroundColor = .clear
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
    }
}

//
//  HomeServicesView.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 19/07/21.
//

import UIKit

class ServicesView: UIView {
    
    @IBOutlet weak var labelRide: UILabel!
    @IBOutlet weak var labelCar: UILabel!
    @IBOutlet weak var labelFood: UILabel!
    @IBOutlet weak var labelShop:  UILabel!
    
    @IBOutlet weak var imageRide: UIImageView!
    @IBOutlet weak var imageCar: UIImageView!
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var imageShop: UIImageView!
    
    @IBOutlet weak var stackServices: UIStackView!
    
    @IBOutlet weak var viewRide: UIView!
    @IBOutlet weak var viewCar: UIView!
    @IBOutlet weak var viewFood: UIView!
    @IBOutlet weak var viewShop: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    func configureViews() {
        backgroundColor = .none
        
        imageRide.backgroundColor = .green
        imageRide.layer.cornerRadius = imageRide.frame.height / 2
        imageRide.image = UIImage(named: "ico-goride")
        labelRide.text = "GoRide"
        viewRide.onTap { UITapGestureRecognizer in
            print("GORIDE")
        }
        
        imageCar.backgroundColor = .green
        imageCar.layer.cornerRadius = imageRide.frame.height / 2
        imageCar.image = UIImage(named: "ico-gocar")
        labelCar.text = "GoCar"
        viewCar.onTap { UITapGestureRecognizer in
            print("GOCAR")
        }
        
        
        
        imageFood.backgroundColor = .red
        imageFood.layer.cornerRadius = imageRide.frame.height / 2
        imageFood.image = UIImage(named: "ico-gofood")
        labelFood.text = "GoFood"
        viewFood.onTap { UITapGestureRecognizer in
            print("GOFOOD")
        }
        
        imageShop.backgroundColor = .red
        imageShop.layer.cornerRadius = imageRide.frame.height / 2
        imageShop.image = UIImage(named: "ico-goshop")
        labelShop.text = "GoShop"
        viewShop.onTap { UITapGestureRecognizer in
            print("GOSHOP")
        }
    }
    
}

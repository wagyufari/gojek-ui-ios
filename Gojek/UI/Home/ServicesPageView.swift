//
//  ServicesViewController.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 19/07/21.
//

import Foundation
import UIKit

class ServicesPageView: UIView{
    
    
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    @IBOutlet weak var labelFourth: UILabel!
    
    @IBOutlet weak var imageFirst: UIImageView!
    @IBOutlet weak var imageSecond: UIImageView!
    @IBOutlet weak var imageThird: UIImageView!
    @IBOutlet weak var imageFourth: UIImageView!
    
    @IBOutlet weak var viewFirst: UIView!
    @IBOutlet weak var viewSecond: UIView!
    @IBOutlet weak var viewThird: UIView!
    @IBOutlet weak var viewFourth: UIView!
    
    @IBOutlet weak var scroll: UIScrollView!

    @IBOutlet weak var viewEdit: UIView!
    
    @IBOutlet weak var imageMed: UIImageView!
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var imageShop: UIImageView!
    @IBOutlet weak var imageMart: UIImageView!
    @IBOutlet weak var imageRide: UIImageView!
    @IBOutlet weak var imageCar: UIImageView!
    @IBOutlet weak var imageSend: UIImageView!
    @IBOutlet weak var imageGive: UIImageView!
    @IBOutlet weak var imageSure: UIImageView!
    @IBOutlet weak var imageFitness: UIImageView!
    @IBOutlet weak var imageService: UIImageView!
    @IBOutlet weak var imageTix: UIImageView!
    @IBOutlet weak var imagePlay: UIImageView!
    @IBOutlet weak var imageNews: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
        
    }
    
    func configureViews() {
        backgroundColor = .none
        configureButtons()
        configureEdit()
        configureList()
    }
    
    func configureEdit()  {
        (viewEdit.subviews[0] as! UILabel).textColor = .darkgreen
        viewEdit.backgroundColor = .none
        viewEdit.layer.borderWidth = 1.2
        viewEdit.layer.borderColor = UIColor.darkgreen?.cgColor
        viewEdit.layer.cornerRadius = viewEdit.frame.height / 2
    }
    
    func configureButtons() {
        imageFirst.backgroundColor = .green
        imageFirst.layer.cornerRadius = imageFirst.frame.height / 2
        imageFirst.image = UIImage(named: "ico-goride")
        labelFirst.text = "GoRide"
        viewFirst.onTap { UITapGestureRecognizer in
            print("GORIDE")
        }
        
        imageSecond.backgroundColor = .green
        imageSecond.layer.cornerRadius = imageFirst.frame.height / 2
        imageSecond.image = UIImage(named: "ico-gocar")
        labelSecond.text = "GoCar"
        viewSecond.onTap { UITapGestureRecognizer in
            print("GOCAR")
        }
        
        imageThird.backgroundColor = .red
        imageThird.layer.cornerRadius = imageFirst.frame.height / 2
        imageThird.image = UIImage(named: "ico-gofood")
        labelThird.text = "GoFood"
        viewThird.onTap { UITapGestureRecognizer in
            print("GOFOOD")
        }
        
        imageFourth.backgroundColor = .red
        imageFourth.layer.cornerRadius = imageFirst.frame.height / 2
        imageFourth.image = UIImage(named: "ico-goshop")
        labelFourth.text = "GoShop"
        viewFourth.onTap { UITapGestureRecognizer in
            print("GOSHOP")
        }
    }
    
    func configureList() {
        imageMed.layer.cornerRadius = 32 / 2
        imageFood.layer.cornerRadius = 32 / 2
        imageShop.layer.cornerRadius = 32 / 2
        imageMart.layer.cornerRadius = 32 / 2
        imageRide.layer.cornerRadius = 32 / 2
        imageCar.layer.cornerRadius = 32 / 2
        imageSend.layer.cornerRadius = 32 / 2
        imageGive.layer.cornerRadius = 32 / 2
        imageSure.layer.cornerRadius = 32 / 2
        imageFitness.layer.cornerRadius = 32 / 2
        imageService.layer.cornerRadius = 32 / 2
        imageTix.layer.cornerRadius = 32 / 2
        imagePlay.layer.cornerRadius = 32 / 2
        imageNews.layer.cornerRadius = 32 / 2
    }
    
}

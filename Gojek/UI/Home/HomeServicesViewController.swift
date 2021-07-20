//
//  ViewController.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 17/07/21.
//

import UIKit

class HomeServicesViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    
    var gesture: UIPanGestureRecognizer?
    
    var isExpand = false
    
    fileprivate lazy var homeServicesView: ServicesView = {
        let view = ServicesView.viewFromXib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var servicesView: ServicesPageView = {
        let view = ServicesPageView.viewFromXib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var maxHeight:CGFloat = {
        var topPadding = CGFloat(24)
        if #available(iOS 11.0, *) {
            topPadding += UIApplication.shared.keyWindow?.safeAreaInsets.top ?? CGFloat(0)
        } else if #available(iOS 13.0, *){
            topPadding += UIApplication.shared.windows[0].safeAreaInsets.top ?? CGFloat(0)
        }
        return self.view.frame.height - topPadding
    }()
    
    let minHeight = CGFloat(100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
        gesture?.delegate = self
        
        card.addGestureRecognizer(gesture!)
        card.card()
        card.layer.cornerRadius = card.frame.height / 2
        currentCardHeight = cardHeight.constant
        addServicesToCard()
    }
    
    func addServicesToCard() {
        _ = UIView().apply{
            card.addSubview($0)
            $0.backgroundColor = .grey
            $0.heightAnchor.constraint(equalToConstant: 4).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 28).isActive = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: card.topAnchor, constant: 10).isActive = true
            $0.layer.cornerRadius = 4/2
            $0.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
        }
        card.addSubview(self.homeServicesView)
        homeServicesView.topAnchor.constraint(equalTo: self.card.topAnchor).isActive = true
        homeServicesView.bottomAnchor.constraint(equalTo: self.card.bottomAnchor).isActive = true
        homeServicesView.rightAnchor.constraint(equalTo: self.card.rightAnchor).isActive = true
        homeServicesView.leadingAnchor.constraint(equalTo: self.card.leadingAnchor).isActive = true
        card.addSubview(self.servicesView)
        servicesView.topAnchor.constraint(equalTo: self.card.topAnchor).isActive = true
        servicesView.bottomAnchor.constraint(equalTo: self.card.bottomAnchor).isActive = true
        servicesView.rightAnchor.constraint(equalTo: self.card.rightAnchor).isActive = true
        servicesView.leadingAnchor.constraint(equalTo: self.card.leadingAnchor).isActive = true
        servicesView.alpha = 0
    }
    
    @IBOutlet weak var cardBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var cardLeftMargin: NSLayoutConstraint!
    @IBOutlet weak var cardRightMargin: NSLayoutConstraint!
    @IBOutlet weak var cardHeight: NSLayoutConstraint!
    
    
    var currentCardHeight:CGFloat = 0.0
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {

        let expandPercentage = self.cardHeight.constant.isWhatPercentOf(of: maxHeight)
        
        if recognizer.state == .began{
            
        } else if recognizer.state == .changed {
            let translation = recognizer.translation(in: self.card)
            
            if translation.y < 0{
                // Up
                if !isExpand {
                    let translationValue = (translation.y * -1) + self.currentCardHeight
                    self.cardHeight.constant = translationValue
                }
            } else if translation.y > 0{
                // Down
                self.cardHeight.constant = self.currentCardHeight - translation.y
                if self.cardHeight.constant < minHeight {
                    self.cardHeight.constant = minHeight
                }
            }
            
            if self.cardHeight.constant < (maxHeight - 100) {
                UIView.animate(withDuration: 0.2) {
                    self.homeServicesView.alpha = 0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.servicesView.alpha = 0
                }
            }
            
            self.cardLeftMargin.constant = 24 - CGFloat(24).toPercent(percentage: expandPercentage)
            self.cardRightMargin.constant = 24 - CGFloat(24).toPercent(percentage: expandPercentage)
            self.cardBottomMargin.constant = 58 - CGFloat(58).toPercent(percentage: expandPercentage)
            
        } else if recognizer.state == .ended {
            let velocity = recognizer.velocity(in: self.card)
            
            if velocity.y < -500 {
                expand()
            } else if velocity.y > 500{
                collapse()
            } else{
                if self.cardHeight.constant < (maxHeight / 2) {
                    collapse()
                } else{
                    expand()
                }
            }
            
            self.servicesView.scroll.isScrollEnabled = true
            
        }
    }
    
    func collapse(){
        isExpand = false
        currentCardHeight = minHeight
        
        self.card.transform = CGAffineTransform(translationX: 0, y: 15)
        
        self.cardHeight.animateConstant(value: minHeight) {
            UIView.animate(withDuration: 0.2) {
                self.card.transform = CGAffineTransform(translationX: 0, y: -10)
            } completion: { Bool in
                UIView.animate(withDuration: 0.2) {
                    self.card.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            }
        }
        
        self.cardLeftMargin.animateConstant(value: 24 - CGFloat(24).toPercent(percentage: 0))
        self.cardRightMargin.animateConstant(value: 24 - CGFloat(24).toPercent(percentage: 0))
        self.cardBottomMargin.animateConstant(value: 58 - CGFloat(58).toPercent(percentage: 0))
        UIView.animate(withDuration: 0.2) {
            self.card.layer.cornerRadius = self.minHeight / 2
        }
        
        UIView.animate(withDuration: 0.2) {
            self.homeServicesView.alpha = 1
        }
    }
    
    func expand() {
        isExpand = true
        currentCardHeight = maxHeight
        
        self.card.transform = CGAffineTransform(translationX: 0, y: -15)
        
        self.cardHeight.animateConstant(value: maxHeight){
            
            UIView.animate(withDuration: 0.2) {
                self.card.transform = CGAffineTransform(translationX: 0, y: 10)
            } completion: { Bool in
                UIView.animate(withDuration: 0.2) {
                    self.card.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            }
            
        }
        
        self.cardLeftMargin.animateConstant(value: 24 - CGFloat(24).toPercent(percentage: 100))
        self.cardRightMargin.animateConstant(value: 24 - CGFloat(24).toPercent(percentage: 100))
        self.cardBottomMargin.animateConstant(value: 58 - CGFloat(58).toPercent(percentage: 100))
        UIView.animate(withDuration: 0.2) {
            self.card.layer.cornerRadius = 24
        }
        
        UIView.animate(withDuration: 0.2) {
            self.servicesView.alpha = 1
        }
        
    }
}

extension HomeServicesViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y

        if (self.servicesView.scroll.contentOffset.y <= 0 && direction >= 0) {
            self.servicesView.scroll.isScrollEnabled = false
        } else {
            self.servicesView.scroll.isScrollEnabled = true
        }
        
        return false
    }
}


   


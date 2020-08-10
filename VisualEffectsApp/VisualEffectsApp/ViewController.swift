//
//  ViewController.swift
//  VisualEffectsApp
//
//  Created by abdullah on 20/12/1441 AH.
//  Copyright © 1441 abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var effect : UIVisualEffect!
    

    @IBOutlet var AddItemView: UIView!
    
    
    @IBOutlet weak var VisualEffectView: UIVisualEffectView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        effect = VisualEffectView.effect
        VisualEffectView.effect = nil
        
        AddItemView.layer.cornerRadius = 12
    }
    
    private func animateIn() {
        self.view.addSubview(AddItemView)
        AddItemView.center = self.view.center
        
        AddItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        AddItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.VisualEffectView.effect = self.effect
            self.AddItemView.alpha = 1
            self.AddItemView.transform = CGAffineTransform.identity
        }
    }
    
    private func animateOut() {
        
        UIView.animate(withDuration: 0.3 , animations :  {
            self.AddItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.AddItemView.alpha = 0
            self.VisualEffectView.effect = nil
        }) {(success : Bool) in
            self.AddItemView.removeFromSuperview()
        }
        
        
        
    }
    
    
    
    @IBAction func AddItemAction(_ sender: Any) {
        
        animateIn()
    }
    

    @IBAction func DisMissPopUp(_ sender: Any) {
        
        animateOut()
        
    }
    
}


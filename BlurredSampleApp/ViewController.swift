//
//  ViewController.swift
//  BlurredSampleApp
//
//  Created by Hamid Hoseini on 10/22/20.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        imageView.frame = view.bounds
        
        createBlur()
    }

    func createBlur() {
        let blureEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blureEffect)
        visualEffectView.frame = view.bounds
        visualEffectView.alpha = 0
        view.addSubview(visualEffectView)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            UIView.animate(withDuration: 0.5) {
                visualEffectView.alpha = 1
            }
        }
    }
}


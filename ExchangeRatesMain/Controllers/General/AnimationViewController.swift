//
//  AnimationViewController.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 4.11.23.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {

    var animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.animation = LottieAnimation.named("AnimationView")
        animationView.loopMode = .loop
        animationView.play()
        view = animationView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

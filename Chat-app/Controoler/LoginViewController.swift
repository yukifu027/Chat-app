//
//  LoginViewController.swift
//  Chat-app
//
//  Created by 福井祐希 on 2020/07/05.
//  Copyright © 2020 Yuki Fukui. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login(_ sender: Any) {
        startAnimation()
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil{
                
                print(error)
                
            }else{
                
                print("ログイン成功")
                self.stopAnimation()
                self.performSegue(withIdentifier: "chat", sender: nil)
            }
            
        }
    }
    
        func startAnimation(){
            let animation = Animation.named("loading")
            animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 1.5)
    //        中身
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            
    //        プレイして、追加
            animationView.play()
            view.addSubview(animationView)
            
        }
        
        func stopAnimation(){
    //        アニメーションを排除する
            animationView.removeFromSuperview()
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

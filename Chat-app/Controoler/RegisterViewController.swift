//
//  RegisterViewController.swift
//  Chat-app
//
//  Created by 福井祐希 on 2020/07/05.
//  Copyright © 2020 Yuki Fukui. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    
    let animationView = AnimationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func registerNewUser(_ sender: Any) {
        
//        アニメーションのスタート
        startAnimation()
//        新規登録
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordtextField.text!) { (user, error) in
            
            if error != nil {
                
                print(error as Any)
            }else{
                
                print("新規登録完了")
                
//                アニメーションストップ
                self.stopAnimation()
//                チャット画面に遷移
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

//
//  LoginScreenVC.swift
//  CardAlbum
//
//  Created by batuhan on 7.11.2023.
//

import UIKit
import LocalAuthentication

final class LoginScreenVC: UIViewController {
    
    private let welcomeMessage : UILabel = {
       let message = UILabel()
        message.text = "Card\nAlbum"
        message.textAlignment = .left
        message.numberOfLines = 0
        message.textColor = .white
        message.font = UIFont.boldSystemFont(ofSize: 80)
        return message
    }()
    
  private  let logInButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Giriş", for: .normal)
        button.tintColor = .systemPink
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
//    private let passwordTextField:CustomTextField = {
//       let password = CustomTextField()
//        return password
//    }()
//
//    private let barStackView : UIStackView = {
//        let view = UIStackView()
//        view.spacing = 12
//        view.distribution = .fillEqually
//        return view
//    }()
  
    
    var context = LAContext()
    
    enum AuthenticationState {
        case loggedIn
        case loggedOut
    }
    let gLayer = CAGradientLayer()
    

    override func viewDidLoad() {
//        passwordTextField.delegate = self
        super.viewDidLoad()
        gradientLayer()
        
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
//        view.backgroundColor = .white
        setAnchor()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gLayer.frame = view.bounds
    }
    
    private func setAnchor(){
        
        view.addSubviews(welcomeMessage,logInButton)
        welcomeMessage.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: logInButton.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 0)
//        passwordTextField.anchor(top: welcomeMessage.bottomAnchor, bottom: logInButton.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: -88, paddingLeft: 20, paddingRight: -20, width: 0, height: 80)
//        barStackView.anchor(top: passwordTextField.bottomAnchor, bottom: nil, leading: passwordTextField.leadingAnchor, trailing: passwordTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 4)
//
        logInButton.anchor(top: welcomeMessage.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: -88, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        
        
//        for _ in 0..<4{
//            let view = UIView()
//            view.backgroundColor = .white
//            barStackView.addArrangedSubview(view)
//        }
        
    }
    
    @objc func loginButtonTapped(){
        context = LAContext()
        context.localizedCancelTitle = "Enter password"
        var error : NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            return
        }
        Task{
            do {
                try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "log in to your account")
                coordinate()
            }catch _ {
                print("error")
            }
        }
    }

    private func gradientLayer(){
        gLayer.colors = [UIColor.systemPurple.cgColor,UIColor.systemPink.cgColor]
        gLayer.locations = [0,1]
        view.layer.addSublayer(gLayer)
        gLayer.frame = view.frame
    }
    
    var loginViewModel : LoginViewModel?
    
    func coordinate(){
        loginViewModel?.showCardsController()
    }
}
//
//extension LoginScreenVC : UITextFieldDelegate{
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
//        if textField == textField {
//            let component = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
//            let decimalString = component.joined(separator: "") as NSString
//
//            let length = decimalString.length
//
//            if length > 0 {
//                let newlength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
//
//                return newlength > 4 ? false : true
//            }
//        }
//        return true
//    }
//
//}

//
//final class CustomTextField : UITextField {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        tintColor = .white
//        isSecureTextEntry = true
//        font = UIFont.boldSystemFont(ofSize: 40)
//        keyboardType = .numberPad
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: 40, dy: 0)
//    }
//
////    override func editingRect(forBounds bounds: CGRect) -> CGRect {
////        return bounds.
////    }
//
//}

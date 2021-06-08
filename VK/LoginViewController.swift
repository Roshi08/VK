//
//  LoginViewController.swift
//  VK
//
//  Created by Екатерина on 01.06.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginImageView.backgroundColor = .brown
        titleLabel.text = "VK"
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
       }
    
    override func viewDidAppear(_ animated: Bool) {
        viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginTextField.text!
        // Получаем текст-пароль
        let password = passwordTextField.text!
        
        // Проверяем, верны ли они
        if login == "1" && password == "1" {
            print("успешная авторизация")
            return true
        } else {
            print("неуспешная авторизация")
            showAlertError()
            return false
        }
    }
    private func showAlertError(){
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные логин или пароль", preferredStyle: .alert)
        
        let loyaltyAction = UIAlertAction(title: "Исправлюсь", style: .cancel, handler: nil)
        let action = UIAlertAction(title: "Ok", style: .default){_ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
            print("Action tapped")
        }
        
        alert.addAction(loyaltyAction)
        alert.addAction(action)
        self.present(alert, animated: true){
            print("Alert Closed")
        }
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
    }
   
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }

}

//  LoginFormController.swift
//  UI_2
//  Created by Никита Алимпиев on 04.11.2021.

import UIKit

class LoginFormController: UIViewController {
    @IBOutlet weak var logo: UIImageView!
    override func viewDidAppear(_ animated: Bool) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.logo.layer.add(animation, forKey: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    // Жест нажатия
    let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    // Присваиваем его UIScrollVIew
    scrollView?.addGestureRecognizer(hideKeyboardGesture)

    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    // Проверяем данные
    let checkResult = checkUserData()
    // Если данные не верны, покажем ошибку
    if !checkResult {
    showLoginError()
    }
    // Вернем результат
    return checkResult
    }
    func checkUserData() -> Bool {
    guard let login = loginInput.text,
    let password = passwordInput.text else { return false }
    if login == "admin" && password == "123456" {
    return true
    } else {
    return false
    }
    }
    func showLoginError() {
    // Создаем контроллер
    let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
    // Создаем кнопку для UIAlertController
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    // Добавляем кнопку на UIAlertController
    alter.addAction(action)
    // Показываем UIAlertController
    present(alter, animated: true, completion: nil)
    }




    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoName: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func loginButtomPressed(_ sender: Any) {
        guard let token = loginInput.text
               else {return}
               Session.shared.token = token
        // Получаем текст логина
    let login = loginInput.text!
    // Получаем текст-пароль
    let password = passwordInput.text!
    // Проверяем, верны ли они
    if login == "admin" && password == "123456" {
    print("успешная авторизация")
    } else {
    print("неуспешная авторизация")
    }
    }
    // Когда клавиатура появляется
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
    //Теперь надо подписаться на сообщения из центра уведомлений, которые рассылает клавиатура:
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    // Второе — когда она пропадает
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //Центр уведомлений будем рассматривать позже. А сейчас отметим, что от уведомлений надо отписываться, когда они не нужны. Добавим метод отписки при исчезновении контроллера с экрана.
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func hideKeyboard() {
    self.scrollView?.endEditing(true)
    }
    
    func animateTitlesAppearing() {
        let offset = view.bounds.width
        emailLabel.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordLabel.transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 1,
        delay: 1,
        options: .curveEaseOut,
        animations: {
        self.emailLabel.transform = .identity
        self.passwordLabel.transform = .identity
        },
        completion: nil)
    }
    func animateTitleAppearing() {
        self.logoName.transform = CGAffineTransform(translationX: 0,
                                                     y: -self.view.bounds.height/2)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                           self.logoName.transform = .identity
                       },
                       completion: nil)
    }
    func animateFieldsAppearing() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 1
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        self.loginInput.layer.add(fadeInAnimation, forKey: nil)
        self.passwordInput.layer.add(fadeInAnimation, forKey: nil)
    }


//    func animateAuthButton() {
//        let animation = CASpringAnimation(keyPath: "transform.scale")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.stiffness = 200
//        animation.mass = 2
//        animation.duration = 2
//        animation.beginTime = CACurrentMediaTime() + 1
//        animation.fillMode = CAMediaTimingFillMode.backwards
//
//        self.authButton.layer.add(animation, forKey: nil)
//    }

}

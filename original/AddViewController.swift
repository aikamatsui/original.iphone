//
//  AddViewController.swift
//  original
//
//  Created by AIKA MATSUI on 2021/03/28.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate{
    
    let realm = try! Realm()
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var motionLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var contentsTextField: UITextField!
    @IBOutlet var happybutton: UIButton!
    @IBOutlet var smilebutton: UIButton!
    @IBOutlet var goodbutton: UIButton!
    @IBOutlet var sadbutton: UIButton!
    
    var feelingNumber: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.delegate = self
        dateTextField.placeholder = "4/1"
        dateTextField.keyboardType = UIKeyboardType.phonePad
        dateTextField.returnKeyType = UIReturnKeyType.done
        
        contentsTextField.delegate = self
        contentsTextField.placeholder = "今日はバスケした"
        dateTextField.returnKeyType = UIReturnKeyType.done
        dateTextField.keyboardType = UIKeyboardType.emailAddress
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if !contentsTextField.isFirstResponder {
            return
        }
        
        if self.view.frame.origin.y == 0 {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardRect.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func happybuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        feelingNumber = 0
    }
    
    @IBAction func smilebuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        feelingNumber = 1
    }
    
    @IBAction func goodbuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        feelingNumber = 2
    }
    
    @IBAction func sadbuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue"), for: .normal)
        feelingNumber = 3
    }
    
    
    @IBAction func savediary() {
        
        let diary = Diary()
        diary.date = self.dateTextField.text!
        diary.contents = self.contentsTextField.text!
        diary.feelingNumber = self.feelingNumber
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)//Realmのファイルurlを取得
        try! realm.write {
            realm.add(diary.self)//Realmに保存する
        }
        
        let alert: UIAlertController = UIAlertController(title: "保存完了",message: "日記を保存しました！",preferredStyle: .alert)
        
        alert.addAction(
        UIAlertAction(
        title: "OK",
        style: .default,
        handler: { action in//ボタンが押された時の動作
        self.dismiss(animated: true, completion: nil)
        print("OKボタンが押されました！")
        
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    

}


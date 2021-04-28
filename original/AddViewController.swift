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
    
    var diaryArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    
    
    @IBAction func happybuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        
        }
    
    @IBAction func smilebuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        
        }
    
    @IBAction func goodbuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        
        }
    
    @IBAction func sadbuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue"), for: .normal)
        
        }
    
    
    @IBAction func savediary() {
        
        let date: String = dateTextField.text!
        let contents: String = contentsTextField.text!
        
        let diary: diary? = read()
        
        if let diary = diary {
            try! realm.write {
                diary.date = date
                diary.contents = contents
            }
//        } else {
//            let newDiary = diary()
//            newDiary.date = date
//            newDiary.contents = contents
//
//            try! realm.write {
//                realm.add(newDiary)
//            }
            
        }
        
        let diaryDictionary = ["date": dateTextField.text!, "contents": contentsTextField.text!]
        
        diaryArray.append(diaryDictionary)
        saveData.set(diaryDictionary, forKey: "diary")
        
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "日記を追加しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        dateTextField.text = ""
        contentsTextField.text = ""
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                    // 0.5秒後に実行したい処理
//                     self.performSegue(withIdentifier: "セグエのid", sender: nil)
//                    }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
        if saveData.array(forKey: "diary") != nil{
            diaryArray = saveData.array(forKey: "diary") as! [Dictionary<String, String>]
        
            }
        
        dateTextField.delegate = self
        contentsTextField.delegate = self
        
        let diary: diary? = read()
        
        if let diary = diary {
            dateTextField.text = diary.date
            contentsTextField.text = diary.contents
            
        }
        // Do any additional setup after loading the view.
        
        
    }
    
    func read() -> diary? {
        return realm.objects(diary.self).first
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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

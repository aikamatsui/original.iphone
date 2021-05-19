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
        contentsTextField.delegate = self
        
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
        print(Realm.Configuration.defaultConfiguration.fileURL!)
                try! realm.write {
                    realm.add(diary.self)
                }

                self.dismiss(animated: true, completion: nil)
        
    }
}

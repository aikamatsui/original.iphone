//
//  ContentsViewController.swift
//  original
//
//  Created by AIKA MATSUI on 2021/06/09.
//

import UIKit
import RealmSwift

class ContentsViewController: UIViewController, UITextViewDelegate {

//    var date: String = ""
//    var contents: String = ""
      var cellIndexPath: Int = 0
      var results: Results<Diary>! = nil//Diaryclassを取得してデータを格納する変数を作成
    let nameArry = ["orange","pink","green","blue"]
    
    @IBOutlet var fellingImageView: UIImageView!
    @IBOutlet var dateTextView: UITextView!
    @IBOutlet var contentsTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        takeout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextView.delegate = self
        contentsTextView.delegate = self
        // Do any additional setup after loading the view.
        let realm = try! Realm()//realmインスタンスの取得
        results = realm.objects(Diary.self)//realmのデータ全件取り出し
        print(results)
    }
    
    func takeout() {
        dateTextView.text = results[cellIndexPath].date
        contentsTextView.text = results[cellIndexPath].contents
        fellingImageView.image = UIImage(named:nameArry[results[cellIndexPath].feelingNumber])
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
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

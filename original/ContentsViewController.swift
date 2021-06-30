//
//  ContentsViewController.swift
//  original
//
//  Created by AIKA MATSUI on 2021/06/09.
//

import UIKit
import RealmSwift

class ContentsViewController: UIViewController {

//    var date: String = ""
//    var contents: String = ""
      var cellIndexPath: Int = 0
      var results: Results<Diary>! = nil//Diaryclassを取得してデータを格納する変数を作成
    
    
    var fellingImageView: UIImageView!
    var dateTextView: UITextView!
    var contentsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let realm = try! Realm()//realmインスタンスの取得
        results = realm.objects(Diary.self)//realmのデータ全件取り出し
        print(results)
    }
    
    func takeout() {
        dateTextView = results[cellIndexPath.row].date
        contentsTextView = results[cellIndexPath.row].contents
    }
    

    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
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

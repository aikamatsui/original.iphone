//
//  ViewController.swift
//  original
//
//  Created by AIKA MATSUI on 2021/03/28.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    

    var date: String = ""
    var contents: String = ""
    
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var AddButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    var results: Results<Diary>! = nil//Diaryclassを取得してデータを格納する変数を作成
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        collectionView.delegate = self
        let realm = try! Realm()//realmインスタンスの取得
        results = realm.objects(Diary.self)//realmのデータ全件取り出し
    }
    
    @IBAction func back(sender: UIStoryboardSegue){
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                collectionView.collectionViewLayout = layout
    }

    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.AddButton.layer.cornerRadius = 28.0
        
        }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.results.count// 表示するセルの数
        }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DiaryCollectionViewCell//カスタムセルを再利用して使う設定
            let nameArry = ["orange","pink","green","blue"]
        cell.image.image = UIImage(named: nameArry[results[indexPath.row].feelingNumber])
         date = results[indexPath.row].date
         contents = results[indexPath.row].contents
            return cell
        }
     
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let horizontalSpace : CGFloat = 40
            let cellSize : CGFloat = self.view.bounds.width / 4 - horizontalSpace
            return CGSize(width: cellSize, height: cellSize)
        }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContentsView" {
            let ContentsViewController = segue.destination as! ContentsViewController
            ContentsViewController.date = self.date
            ContentsViewController.contents = self.contents
        }
    }
}



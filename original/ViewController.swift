//
//  ViewController.swift
//  original
//
//  Created by AIKA MATSUI on 2021/03/28.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let realm = try! Realm()
    
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var AddButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func back(sender: UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let diary: Diary? = read()
        
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
            return 28// 表示するセルの数
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DiaryCollectionViewCell
            let nameArry = ["orange","blue","green","pink"]
            cell.image.image = UIImage(named: nameArry[Int.random(in: 0...3)])
            
            return cell
        }
     
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let horizontalSpace : CGFloat = 40
            let cellSize : CGFloat = self.view.bounds.width / 4 - horizontalSpace
            return CGSize(width: cellSize, height: cellSize)
        }
    
    
}


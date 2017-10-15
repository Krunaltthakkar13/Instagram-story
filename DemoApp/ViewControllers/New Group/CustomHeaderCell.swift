//
//  CustomHeaderCell.swift
//  DemoApp
//
//  Created by krunal thakkar on 08/10/17.
//  Copyright © 2017 krunal thakkar. All rights reserved.
//

import UIKit

class CustomHeaderCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var stroyImages = ["Pics-1.jpg","Pics-2.jpg","Pics-3.jpg","Pics-4.jpg"]

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
}

extension CustomHeaderCell: UICollectionViewDataSource {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return stroyImages.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageViewCell
            let View=UIView()
            View.backgroundColor=UIColor(patternImage:UIImage(named:stroyImages[indexPath.row])!)
            cell.backgroundView=View
            return cell
        }
    }
    
extension CustomHeaderCell: UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("collectionViewCell selected \(indexPath)")
        }
        
    }



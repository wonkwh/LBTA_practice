//
//  ViewController.swift
//  AppStore
//
//  Created by kwanghyun.won on 2018. 1. 2..
//  Copyright © 2018년 kwanghyun.won. All rights reserved.
//

import UIKit

class FeaturedAppController: UICollectionViewController {
    fileprivate let cellId = "categoryCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self , forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
    }
}

extension FeaturedAppController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}






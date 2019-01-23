//
//  StretchyHeaderController.swift
//  StretchyHeaderCollectionView
//
//  Created by wonkwh on 23/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit


class StretchyHeaderController: UICollectionViewController {

    fileprivate let cellId = "CellId"
    fileprivate let headerId = "headerId"
    
    fileprivate let padding: CGFloat = 16
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 16
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            //layout.minimumLineSpacing = 20
        }
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(CollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }

    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 35
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    
        // Configure the cell
        cell.backgroundColor = .black
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StretchyHeaderController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - (2 * padding), height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
}


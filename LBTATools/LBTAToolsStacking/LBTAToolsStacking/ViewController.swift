//
//  ViewController.swift
//  LBTAToolsStacking
//
//  Created by Brian Voong on 5/10/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit
import LBTATools

class SimpleVerticalStackCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "girl.png"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Girl", textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
//
//        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
//        stackView.distribution = .fillEqually
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.fillSuperview()
//
//        addSubview(stackView)
        
        stack(imageView.withSize(.init(width: 80, height: 80)),
              nameLabel,
              alignment: .center).padTop(8)
        
        layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class HorizontalStackingCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class StackingWithMarginsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let simpleVerticalStackCellId = "SimpleVerticalStackCell"
    let hstackCellId = "hstackCellId"
    let stackingWithMarginsId = "stackingWithMarginsId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SimpleVerticalStackCell.self, forCellWithReuseIdentifier: simpleVerticalStackCellId)
        collectionView.register(HorizontalStackingCell.self, forCellWithReuseIdentifier: hstackCellId)
        collectionView.register(StackingWithMarginsCell.self, forCellWithReuseIdentifier: stackingWithMarginsId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId: String
        if indexPath.section == 0 {
            cellId = simpleVerticalStackCellId
        } else if indexPath.section == 1 {
            cellId = hstackCellId
        } else {
            cellId = stackingWithMarginsId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: (view.frame.width - 16 * 4) / 3, height: 120)
        } else if indexPath.section == 1 {
            return .init(width: view.frame.width - 16 * 2, height: 100)
        } else {
            return .init(width: view.frame.width - 16 * 2, height: 400)
        }
    }

}


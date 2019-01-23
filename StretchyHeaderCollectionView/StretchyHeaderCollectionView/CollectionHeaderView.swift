//
//  CollectionHeaderView.swift
//  StretchyHeaderCollectionView
//
//  Created by wonkwh on 23/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

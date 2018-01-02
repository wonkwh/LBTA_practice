//
//  CategoryCell.swift
//  AppStore
//
//  Created by kwanghyun.won on 2018. 1. 2..
//  Copyright © 2018년 kwanghyun.won. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate let appCellId = "AppCellId"
    fileprivate let appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()

    func setupViews() {
        backgroundColor = .clear

        addSubview(appCollectionView)
        addSubview(dividerLineView)

        appCollectionView.dataSource = self
        appCollectionView.delegate = self
        appCollectionView.register(AppCell.self, forCellWithReuseIdentifier: appCellId)

        appCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        appCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
        appCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        appCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        dividerLineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        dividerLineView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: appCellId , for: indexPath) as! AppCell
    }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: frame.height - 32)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

extension CategoryCell: UICollectionViewDelegate {

}


class AppCell: UICollectionViewCell {
    let thumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Disney Build it: Frozen"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$0.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.backgroundColor = .clear

        addSubview(thumbImageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)

        thumbImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        thumbImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        thumbImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        nameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true


    }

}

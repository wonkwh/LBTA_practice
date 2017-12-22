//
//  ViewController.swift
//  youtube
//
//  Created by kwanghyun.won on 2017. 12. 22..
//  Copyright © 2017년 kwanghyun.won. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self , forCellWithReuseIdentifier: VideoCell.cellID)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.cellID, for: indexPath)
        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}


class VideoCell: UICollectionViewCell {
    static let cellID = "videoCellID"

    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraintViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
    }

    func constraintViews() {

        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        separatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
        separatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

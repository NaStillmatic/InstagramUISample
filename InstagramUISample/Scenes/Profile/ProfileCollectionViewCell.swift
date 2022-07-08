//
//  ProfileCollectionViewCell.swift
//  InstagramUISample
//
//  Created by HwangByungJo  on 2022/07/08.
//

import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .tertiaryLabel
    return imageView
  }()
  
  func setup(with image: UIImage) {
    contentView.addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
  }
}

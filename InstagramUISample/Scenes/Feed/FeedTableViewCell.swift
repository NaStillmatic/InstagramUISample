//
//  FeedTableViewCell.swift
//  InstagramUISample
//
//  Created by HwangByungJo  on 2022/07/08.
//

import UIKit

final class FeedTableViewCell: UITableViewCell {
  
  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .tertiaryLabel
    imageView.layer.cornerRadius = 15
    return imageView
  }()
  
  private lazy var userNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 15.0, weight: .bold)
    label.text = "userName"
    return label
  }()
  
  private lazy var moreButton: UIButton = {
    let button = UIButton()
    button.setImage(systemName: "ellipsis")
    return button
  }()
  

  private lazy var postImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .tertiaryLabel
    return imageView
  }()
  
  private lazy var likeButton: UIButton = {
    let button = UIButton()
    button.setImage(systemName: "heart.fill")
    return button
  }()
  
  private lazy var commnetButton: UIButton = {
    let button = UIButton()
    button.setImage(systemName: "message")
    return button
  }()
  
  private lazy var directMessageButton: UIButton = {
    let button = UIButton()
    button.setImage(systemName: "paperplane")
    return button
  }()
  
  private lazy var bookmarkButton: UIButton = {
    let button = UIButton()
    button.setImage(systemName: "bookmark")
    return button
  }()
  
  private lazy var currentLikedCountLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 13.0, weight: .semibold)
    label.text = "홍길동님 외 32명이 좋아합니다."
    return label
  }()
  
  private lazy var contentsLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 13.0, weight: .medium)
    label.numberOfLines = 5
    label.text = "이 게시글은 영국에서 시작되 글을 본 10일 이내에 100곳에 글을 옮기지 않으면, 인스타그램 세상에서 행복할 수 없을지도 모른다.이 게시물의 내용을 무시하고, 옮기지 않은 김아무개는 그 이후로 좋아요를 받지 못했으며 결국 팔로워도 0이 되었다."
    return label
  }()
  
  private lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 13.0, weight: .semibold)
    label.text = "1일전"
    return label
  }()
  
  func setup() {
    [
      profileImageView,
      userNameLabel,
      moreButton,
      postImageView,
      likeButton,
      commnetButton,
      directMessageButton,
      bookmarkButton,
      currentLikedCountLabel,
      contentsLabel,
      dateLabel
    ].forEach { contentView.addSubview($0) }
    
    let buttonWidth: CGFloat = 24.0
    let buttonInset: CGFloat = 16.0
    
    profileImageView.snp.makeConstraints {
      $0.top
        .leading.equalToSuperview().inset(10)
      $0.width.height.equalTo(30)
    }
    
    userNameLabel.snp.makeConstraints {
      
      $0.centerY.equalTo(profileImageView)
      $0.leading.equalTo(profileImageView.snp.trailing).offset(5)
    }
    
    moreButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(buttonInset)
      $0.centerY.equalTo(profileImageView)
      $0.width
        .height
        .equalTo(buttonWidth)
    }
    
    
    
    postImageView.snp.makeConstraints {
      $0.top.equalTo(profileImageView.snp.bottom).offset(5)
      $0.leading
        .trailing
        .equalToSuperview()
      $0.height.equalTo(postImageView.snp.width)
    }
    
    
    
    likeButton.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(buttonInset)
      $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
      $0.width
        .height
        .equalTo(buttonWidth)
    }
    
    commnetButton.snp.makeConstraints {
      $0.leading.equalTo(likeButton.snp.trailing).offset(12)
      $0.top.equalTo(likeButton.snp.top)
      $0.width
        .height
        .equalTo(buttonWidth)
    }
    
    directMessageButton.snp.makeConstraints {
      $0.leading.equalTo(commnetButton.snp.trailing).offset(12.0)
      $0.top.equalTo(likeButton.snp.top)
      $0.width
        .height
        .equalTo(buttonWidth)
    }
    
    bookmarkButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(buttonInset)
      $0.top.equalTo(likeButton.snp.top)
      $0.width
        .height
        .equalTo(buttonWidth)
    }
    
    currentLikedCountLabel.snp.makeConstraints {
      $0.leading.equalTo(likeButton.snp.leading)
      $0.trailing.equalTo(bookmarkButton.snp.trailing)
      $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
    }
    
    contentsLabel.snp.makeConstraints {
      $0.leading.equalTo(likeButton.snp.leading)
      $0.trailing.equalTo(bookmarkButton.snp.trailing)
      $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
    }
    
    dateLabel.snp.makeConstraints {
      $0.leading.equalTo(likeButton.snp.leading)
      $0.trailing.equalTo(bookmarkButton.snp.trailing)
      $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
      $0.bottom.equalToSuperview().inset(16)
    }
    
  }
}

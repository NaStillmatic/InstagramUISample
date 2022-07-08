//
//  UploadViewController.swift
//  InstagramUISample
//
//  Created by HwangByungJo  on 2022/07/08.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
  
  private let imageView = UIImageView()
  
  private lazy var textView: UITextView = {
    
    let textView = UITextView()
    textView.font = .systemFont(ofSize: 15)
    textView.text = "문구입력..."
    textView.textColor = .secondaryLabel
    textView.delegate = self
    return textView
  }()
  
  init(image: UIImage?) {
    imageView.image = image    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    setupNavigationItem()
    setupLayout()
  }
}

extension UploadViewController: UITextViewDelegate {
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    guard textView.textColor == .secondaryLabel else { return }
    textView.text = nil
    textView.textColor = .label
  }    
}

extension UploadViewController {
  
  func setupNavigationItem() {
    navigationItem.title = "새 개시물"
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소",
                                                       style: .plain,
                                                       target: self,
                                                       action: #selector(didTabNaviButton))
    
    let rightBarItem = UIBarButtonItem(title: "공유",
                                       style: .plain,
                                       target: self,
                                       action: #selector(didTabNaviButton))
    rightBarItem.tag = 1
    navigationItem.rightBarButtonItem = rightBarItem
  }
  
  @objc
  func didTabNaviButton(item: UIBarButtonItem) {
    if item.tag ==  0 {
      
      textView.becomeFirstResponder()
      
    } else {
      
    }
//    dismiss(animated: true)
  }
  
  func setupLayout() {
    
    [imageView, textView].forEach { view.addSubview($0) }
    
    let imageViewInset: CGFloat = 16.0
    
    imageView.snp.makeConstraints {
                  
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(imageViewInset)
      $0.left.equalToSuperview().inset(16)
      $0.width.equalTo(100.0)
      $0.height.equalTo(imageView.snp.width)
    }
    
    textView.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
      $0.trailing.equalToSuperview().inset(imageViewInset)
      $0.top.equalTo(imageView.snp.top)
      $0.bottom.equalTo(imageView.snp.bottom)
    }
  }
}

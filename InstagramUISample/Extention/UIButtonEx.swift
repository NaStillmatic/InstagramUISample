//
//  UIButtonEx.swift
//  InstagramUISample
//
//  Created by HwangByungJo  on 2022/07/08.
//

import UIKit

extension UIButton {
  
  func setImage(systemName: String) {
    contentHorizontalAlignment = .fill
    contentVerticalAlignment = .fill
    imageView?.contentMode = .scaleAspectFit
    imageEdgeInsets = .zero
    setImage(UIImage(systemName: systemName), for: .normal)
  }
}

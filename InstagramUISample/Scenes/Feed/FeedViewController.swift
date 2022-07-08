//
//  ViewController.swift
//  InstagramUISample
//
//  Created by HwangByungJo  on 2022/07/08.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
  
  private lazy var tableView: UITableView =  {
    
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .systemBackground
    tableView.separatorStyle = .none
    tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
    return tableView
    
  }()
  
  private lazy var imagePickerController: UIImagePickerController = {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.allowsEditing = true
    imagePickerController.delegate = self
    return imagePickerController
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigationBar()
    setupTableView()
  }
}

extension FeedViewController {
  
  private func setupNavigationBar() {
    navigationItem.title = "Instagram"
    
    let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(didTapUploadButton))
    
    navigationItem.rightBarButtonItem = uploadButton
  }
  
  func setupTableView() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  @objc func didTapUploadButton() {
    present(imagePickerController, animated: true)
  }
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    var selectImage: UIImage?
    
    if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      selectImage = editedImage
    } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      selectImage = originalImage
    }
        
    picker.dismiss(animated: true) {
      let uploadViewController = UploadViewController(image: selectImage)
      let navigationController = UINavigationController(rootViewController: uploadViewController)
      navigationController.modalPresentationStyle = .fullScreen
      self.present(navigationController, animated: true)
    }
  }
}

extension FeedViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
    cell.selectionStyle = .none
    cell.setup()
    return cell
  }
}

extension FeedViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}


//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Melody Davis on 7/14/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))

        if let imageToLoad = selectedImage?.lowercased() {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareFlag() {
        guard (imageView.image?.jpegData(compressionQuality: 0.8)) != nil else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [imageView.image!, selectedImage!], applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}

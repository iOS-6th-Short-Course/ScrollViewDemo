//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Chhaileng Peng on 12/29/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add scroll view
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1
        
        // add image view to scroll view
        imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "marina_bay_at_night_singapore_4k_8k-7680x4320")
        imageView.sizeToFit()
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.frame.size
        
        let tapGuester = UITapGestureRecognizer(target: self, action: #selector(zoomImage))
        tapGuester.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapGuester)
        imageView.isUserInteractionEnabled = true

        
//        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
//            self.scrollView.setContentOffset(CGPoint(x: 1000, y: 1000), animated: true)
//        }
        
        
    }
    
    @objc func zoomImage() {
        if scrollView.zoomScale < 0.5 {
            scrollView.setZoomScale(1, animated: true)
        } else {
            scrollView.setZoomScale(0.1, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Did Scroll to point", scrollView.contentOffset)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    


}


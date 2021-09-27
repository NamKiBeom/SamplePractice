//
//  NextViewController.swift
//  ScrollViewTest
//
//  Created by 남기범 on 2021/09/27.
//

import UIKit

class NextViewController: UIViewController {
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    
    var imageTopConstraint: NSLayoutConstraint!
    var imageBottomConstraint: NSLayoutConstraint!
    var imageLeadingConstraint: NSLayoutConstraint!
    var imageTrailingConstraint: NSLayoutConstraint!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupLayout()
        setupStyling()
    }
}

extension NextViewController {
    func setupLayout() {
        var constraints: [NSLayoutConstraint] = []
        
        let naviView = UIView()
        naviView.backgroundColor = .blue
        
        naviView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(naviView)
        
        constraints += [
            naviView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            naviView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            naviView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            naviView.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        
        constraints += [
            scrollView.leadingAnchor.constraint(equalTo: naviView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
    
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageView)
        
        imageTopConstraint = imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        imageBottomConstraint = imageView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        imageTrailingConstraint = imageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        imageLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        
        constraints += [
            imageTopConstraint,
            imageBottomConstraint,
            imageTrailingConstraint,
            imageLeadingConstraint,
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupStyling() {
        scrollView.minimumZoomScale = 1.0
        scrollView.zoomScale = 2.0
        scrollView.maximumZoomScale = 3.0
        scrollView.delegate = self
        imageView.contentMode = .scaleAspectFit
        
        let hunterImage = UIImage(named: "hunter")
        imageView.image = hunterImage
    }
}

extension NextViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }

    func updateConstraintsForSize(_ size: CGSize) {
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageTopConstraint.constant = yOffset
        imageBottomConstraint.constant = yOffset

        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageLeadingConstraint.constant = xOffset
        imageTrailingConstraint.constant = xOffset

        view.layoutIfNeeded()
    }
}

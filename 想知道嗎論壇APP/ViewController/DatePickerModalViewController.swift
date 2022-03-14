//
//  DatePickerModalViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/14.
//

import UIKit

class DatePickerModalViewController: UIViewController {
    
    lazy var containerView:UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()

    lazy var dimmedView:UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    let maxDimmedAlpha:CGFloat = 0.6
    
    let defaultHeight:CGFloat = 300
    
    let dismissibleHeight:CGFloat = 200
    
    let maximumContainerHeight:CGFloat = UIScreen.main.bounds.height - 64
    
    var currentContainerHeight:CGFloat = 300
    
    var containerViewHeightConstraint:NSLayoutConstraint?
    
    var containerViewBottomConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setPanGesture()
        
    }
    
    func setupView(){
        view.backgroundColor = .clear
    }
    
    func setupConstraints(){
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dimmedView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
        
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
    }
    
    func animatePresentContainer(){
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView(){
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDissmissView(){
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        }completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    func animateContainerHeight(_ height:CGFloat){
        UIView.animate(withDuration: 0.4) {
            self.containerViewHeightConstraint?.constant = height
            self.view.layoutIfNeeded()
        }
        currentContainerHeight = height
    }
    
    func setPanGesture(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
        
    }
    
    @objc func panGesture(gesture:UIPanGestureRecognizer){
        let translation = gesture.translation(in:view)
        let isDraggingDown = translation.y > 0
        let newHeight = currentContainerHeight - translation.y
        
        switch gesture.state {
        case .changed:
            if newHeight < maximumContainerHeight {
                containerViewHeightConstraint?.constant = newHeight
                view.layoutIfNeeded()
            }
        case .ended:
            if newHeight < dismissibleHeight{
                self.animateDissmissView()
            }else if newHeight < defaultHeight {
                animateContainerHeight(defaultHeight)
            }else if newHeight < maximumContainerHeight && isDraggingDown {
                animateContainerHeight(defaultHeight)
            }else if newHeight > defaultHeight && !isDraggingDown {
                animateContainerHeight(maximumContainerHeight)
            }
        default:
            break
        }
    }
}

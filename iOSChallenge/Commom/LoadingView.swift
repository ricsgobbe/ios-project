//
//  LoadingView.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit

protocol LoadingView {
    var loadingView: UIView! {get}
    var tapGesture: UITapGestureRecognizer! {get set}
    
    func startLoading()
    func stopLoading()
    func showError(message: String)
    func handleTap(sender: UITapGestureRecognizer?)
}

extension LoadingView where Self: UIViewController {
    func startLoading() {
        if !view.subviews.contains(loadingView) {
            view.addSubview(loadingView)
        }
        activityIndicatorSetup(view: loadingView)
        if loadingView.isHidden {
            loadingView.isHidden = false
            view.bringSubview(toFront: loadingView)
        }
        loadingView.setNeedsUpdateConstraints()
    }
    
    fileprivate func activityIndicatorSetup(view: UIView) {
        removeSubviews(views: view.subviews)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = .zero
        activityIndicator.activityIndicatorViewStyle = .white
        activityIndicator.color = UIColor.red
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = activityIndicator.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = activityIndicator.heightAnchor.constraint(equalToConstant: 100)
        view.addConstraints([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
        
    }
    
    fileprivate func removeSubviews(views: [UIView]) {
        views.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    func stopLoading() {
        if !loadingView.isHidden {
            loadingView.isHidden = true
        }
        loadingView.setNeedsUpdateConstraints()
    }
    
    func showError(message: String) {
        removeSubviews(views: loadingView.subviews)
        let errorLabel = UILabel()
        errorLabel.frame = .zero
        errorLabel.text = message
        loadingView.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = errorLabel.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor)
        let verticalConstraint = errorLabel.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        loadingView.addConstraints([horizontalConstraint, verticalConstraint])
    }
}

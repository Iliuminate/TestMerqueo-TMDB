//
//  LoadingIndicator.swift
//  TestMerqueoTMDB
//
//  Created by Usuario on 7/14/19.
//  Copyright © 2019 Ilmint. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicator {
    
    var _uiView:UIView?
    var constraints = [NSLayoutConstraint]()
    
    var container: UIView?
    var loadingView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     
     @param uiView - add activity indicator to this view
     */
    func show(uiView: UIViewController) {
        
        container = UIView()
        loadingView = UIView()
        activityIndicator = UIActivityIndicatorView()
        
        _uiView = uiView.view
//        _uiView?.frame = UIScreen.main.bounds
        container!.frame = _uiView!.bounds
        container!.center = _uiView!.center
        container!.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.5)
        
        loadingView!.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView!.center = _uiView!.center
        loadingView!.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView!.clipsToBounds = true
        loadingView!.layer.cornerRadius = 10
        
        activityIndicator!.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator!.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator!.center = CGPoint(x: loadingView!.frame.size.width / 2, y: loadingView!.frame.size.height / 2);
        
        loadingView!.addSubview(activityIndicator!)
        container!.addSubview(loadingView!)
        uiView.view.addSubview(container!)
        activityIndicator!.startAnimating()
        
        addContraints()
    }
    
    func addContraints(){
        
        container!.translatesAutoresizingMaskIntoConstraints = false
        
        //        let views = ["content" : container]
        //
        //        let kTxtHeight:Double = 45
        //        let kWidth:CGFloat = 0.85
        //
        //        let metrics = ["kTxtHeight" : kTxtHeight, "btnHeight":HeightButton]
        
        
        constraints.append(NSLayoutConstraint(item: container,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: _uiView,
                                              attribute: .centerX,
                                              multiplier: 1,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: container,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: _uiView,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: container,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: _uiView,
                                              attribute: .width,
                                              multiplier: 1,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: container,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: _uiView,
                                              attribute: .height,
                                              multiplier: 1,
                                              constant: 0))
        
        _uiView!.addConstraints(constraints)
    }
    
    
    func removeConstrains(){
        
        //_uiView?.removeConstraints(constraints)
        DispatchQueue.main.async { // Correct
            self._uiView?.removeConstraints(self.constraints)
        }
    }
    
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its super view
     
     @param uiView - remove activity indicator from this view
     */
    func hide() {
        DispatchQueue.main.async {
            // Update UI
            //self.removeConstrains()
            self._uiView?.removeConstraints(self.constraints)
            self.activityIndicator!.stopAnimating()
            self.container!.removeFromSuperview()
        }
        
    }
    
    /*
     Define UIColor from hex value
     
     @param rgbValue - hex color value
     @param alpha - transparency level
     */
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

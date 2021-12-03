//
//  VersionConfig.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import Foundation

/// Singleton class with helper functions to show version label in the application.
final class VersionConfig {
    
    private static var instance: VersionConfig?
    /// `VersionConfig` singleton instance.
    class var shared: VersionConfig? {
        if instance == nil {
            instance = VersionConfig()
        }
        return instance
    }
    
    private var versionLabel: UILabel
    
    private init?() {
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        let build = Bundle.main.infoDictionary?["CFBundleVersion"]
        
        versionLabel = UILabel()
        versionLabel.frame = CGRect(x: 0, y: 40, width: 250, height: 30)
        versionLabel.text = " v.\(version ?? "N/A")(\(build ?? "N/A")) "
        versionLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        versionLabel.textColor = UIColor.white
        versionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        versionLabel.sizeToFit()
        UIApplication.shared.delegate?.window??.addSubview(versionLabel)
    }
    
    /// Brings already created version label to the front of the current window.
    func show() {
        #if DEV
            UIApplication.shared.delegate?.window??.bringSubviewToFront(self.versionLabel)
            versionLabel.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        #endif
    }
    
}

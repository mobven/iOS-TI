//
//  SFSafariViewController.swift
//  MobvenIOSTI
//
//  Created by apple on 24.04.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import UIKit
import WebKit

class SFSafariViewController: UIViewController {

    var parentNavigationController: UINavigationController?
    @IBOutlet weak var webView: WKWebView!
    
    var targetUrl: String = "" {
        didSet {
            presentWebUrl()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    func presentWebUrl() {
        if let url = URL(string: self.targetUrl) {
        let request = URLRequest(url: url)
            webView.load(request)
            view.addSubview(webView)
        }
    }
}

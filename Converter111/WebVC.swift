//  WebVC.swift
//  Created by Nekokoatl on 19/06/16.

import UIKit
import WebKit

class WebVC: UIViewController {
    

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let url = URL(string: "http://ya.ru")
        
        let request = URLRequest(url: url!)
        
        webView.loadRequest(request)
        
    }
    
}

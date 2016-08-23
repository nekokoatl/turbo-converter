//  WebVC.swift
//  Created by Nekokoatl on 19/06/16.

import UIKit
import WebKit

class WebVC: UIViewController {
    

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let url = NSURL(string: "http://ya.ru")
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
    }
    
}
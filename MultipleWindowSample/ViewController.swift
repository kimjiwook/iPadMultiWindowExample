//
//  ViewController.swift
//  MultipleWindowSample
//
//  Created by JW_Macbook on 2019/10/11.
//  Copyright © 2019 JW_Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var multiWindowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dragInteraction = UIDragInteraction(delegate: self)
        multiWindowView.addInteraction(dragInteraction)
    }
}


extension ViewController: UIDragInteractionDelegate {
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        let userActivity = NSUserActivity(activityType: "com.sample")
        userActivity.title = "Sample"
        userActivity.userInfo = ["key":"value"]
        
        let provider = NSItemProvider(object: "Sample" as NSString)
        provider.registerObject(userActivity, visibility: .all)
        let item = UIDragItem(itemProvider: provider)
        
        
        return [item]
    }
}


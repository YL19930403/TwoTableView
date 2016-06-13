//
//  ViewController.swift
//  TwoTableView
//
//  Created by 余亮 on 16/6/13.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func configureNavBar(){
        self.title = "welCome"
        let dic = [NSFontAttributeName : UIFont.systemFontOfSize(18) ,
                   NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = dic
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private lazy var btn : UIButton = {
        let btn = UIButton(frame:CGRectMake(100,100,100,50))
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("点我", forState: UIControlState.Normal)
        btn.addTarget(self , action: #selector(ViewController.btnClick), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    func btnClick(){
        let categoryVC = YLCategoryVC()
        self.navigationController?.pushViewController(categoryVC, animated: true )
    }
    
}









































//
//  YLCategoryVC.swift
//  TwoTableView
//
//  Created by 余亮 on 16/6/13.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit


class YLCategoryVC: UIViewController {
    var categoriesArr = [String]()
    var productVC = YLProductVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TestDemo"
        ConfigureData()
        CreateTableView()
        CreateProductVC()
    }
    
    func ConfigureData(){
        if (categoriesArr.count == 0) {
            let numArr = ["一","二","三","四","五","六","七","八","九","十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十"]
            var tempArr = [String]()
            for i in 0..<(numArr.count){
                let tmpStr = NSString.localizedStringWithFormat("第%@类", numArr[i])
                
                tempArr.append(tmpStr as String)
            }
            categoriesArr = tempArr
        }
    }
    
    func CreateTableView(){
        self.view.addSubview(self.categoryTableView)
        self.categoryTableView.snp_makeConstraints { (make) in
            make.width.equalTo(self.view.frame.size.width*0.25)
            make.height.equalTo(self.view.snp_height)
            
        }
        
    }
    
    func CreateProductVC(){
        productVC.delegate = self
        self.addChildViewController(productVC)
        self.view.addSubview(productVC.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private lazy var categoryTableView : UITableView = {
        let tableV = UITableView()
        tableV.delegate = self
        tableV.dataSource = self
        tableV.backgroundColor = UIColor.orangeColor()
        tableV.showsVerticalScrollIndicator = false
        return tableV
    }()
    
}

extension YLCategoryVC : UITableViewDelegate , UITableViewDataSource,ProductsDelegate {
    //MARK: TableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("categoryCell")
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "categoryCell")
            
        }
        cell?.textLabel?.text = categoriesArr[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFontOfSize(13)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        productVC.scrollToSelectedIndexPath(indexPath)
    }
    
    
    //MARK: ProductsDelegate
    func willDisplayHeaderView(section : NSInteger) -> Void  {
        self.categoryTableView.selectRowAtIndexPath(NSIndexPath.init(forRow: section , inSection: 0), animated: true , scrollPosition: UITableViewScrollPosition.Middle)
    }
    
    func didEndDisplayingHeaderView(section : NSInteger) -> Void  {
        self.categoryTableView.selectRowAtIndexPath(NSIndexPath.init(forRow: section + 1, inSection: 0), animated: true , scrollPosition: UITableViewScrollPosition.Middle)
    }
}


















































//
//  YLProductVC.swift
//  TwoTableView
//
//  Created by 余亮 on 16/6/13.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit
import SnapKit

protocol ProductsDelegate {
    func willDisplayHeaderView (section : NSInteger) -> Void
    
    func didEndDisplayingHeaderView(section : NSInteger) -> Void
}

class YLProductVC: UIViewController {
    var delegate : ProductsDelegate?
    var productsArr = [String]()
    var sectionsArr = [String]()
    var isScrollUp : Bool = false
    var lastOffsetY : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        createTableView()
    }
    
    func configureData(){
        if (sectionsArr.count == 0 ){
            var numArr = ["一","二","三","四","五","六","七","八","九","十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十"]
            var  tmpArr = [String]()
            for i in 0..<(numArr.count){
                let tmpStr = NSString.localizedStringWithFormat("第%@类", numArr[i])
                tmpArr.append(tmpStr as String)
            }
            sectionsArr = tmpArr
        }
        
        if (productsArr.count == 0){
            productsArr = ["鞋子","衣服","化妆品","饮用水","副食品","小吃","鞋子","衣服","化妆品","饮用水"]
        }
    }
    
    func createTableView(){
        self.view = UIView(frame:CGRectMake(self.view.frame.size.width*0.25 , 64, self.view.frame.size.width*0.75 , self.view.frame.size.height ))
        self.view.addSubview(productTableV)
        self.productTableV.snp_makeConstraints { (make) in
            make.left.equalTo(self.view.snp_left).offset(0)
            make.right.equalTo(self.view.snp_right).offset(0)
            make.bottom.equalTo(self.view.snp_bottom).offset(0)
            make.top.equalTo(self.view.snp_top).offset(0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //MARK:懒加载
    private lazy var productTableV : UITableView = {
        let tableV = UITableView()
        tableV.delegate = self
        tableV.dataSource = self
        return tableV
    }()
    
}


extension YLProductVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if (self.delegate != nil ) {
            self.delegate?.willDisplayHeaderView(section)
        }
    }
    
    func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        if (self.delegate != nil ){
            self.delegate?.didEndDisplayingHeaderView(section)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArr.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionsArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("productCell")
        if (cell == nil){
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "productCell")
            
        }
        cell?.textLabel?.text = productsArr[indexPath.row]
        return cell!
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsArr[section]
    }
    
    //MARK:  scrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        isScrollUp = lastOffsetY  < scrollView.contentOffset.y
        lastOffsetY = scrollView.contentOffset.y
        
    }
    
    //MARK: 一级tableView滚动时 实现当前类tableView的联动
    func scrollToSelectedIndexPath(indexPath : NSIndexPath) {
        self.productTableV.selectRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: indexPath.row), animated: true , scrollPosition: UITableViewScrollPosition.Top)
    }
    
}


















































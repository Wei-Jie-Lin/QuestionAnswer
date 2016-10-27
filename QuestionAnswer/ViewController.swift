//
//  ViewController.swift
//  QuestionAnswer
//
//  Created by 林暐潔 on 2016/10/23.
//  Copyright © 2016年 林暐潔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qusLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    
    class QA {
        var qus: String
        var ans: String
        
        init(qus: String, ans: String) {
            self.qus = qus
            self.ans = ans
        }
    }
    
    var QAArray = [QA]()
    var index = 0
    
    //存放Array的容器。
    func qaInArray() {
        
        QAArray.append(QA(qus: "現在來問問題，請問這是第幾題", ans: "痾...第一題..."))
        QAArray.append(QA(qus: "全世界最棒的公司！？", ans: "Apple"))
        QAArray.append(QA(qus: "想換新手機我應該買哪一隻！？", ans: "I PHONE 無誤"))
        QAArray.append(QA(qus: "十二星座中，哪個星座最棒！？", ans: "水瓶座"))
        QAArray.append(QA(qus: "承上題，為什麼！？", ans: "因為彼得潘是水瓶座"))
        QAArray.append(QA(qus: "彼得潘最愛的歌手是！？", ans: "戴佩妮"))
        QAArray.append(QA(qus: "每週一跟週四最開心的是什麼事！？", ans: "上彼得潘的課"))
        QAArray.append(QA(qus: "如果要學app一定要學！？", ans: "ＩＯＳ ＡＰＰ"))
        QAArray.append(QA(qus: "承上題，如果要學要找誰學！？", ans: "廢話！當然是彼得潘。"))
        QAArray.append(QA(qus: "世界上除了自己最帥以外，免強排第二的是誰！？", ans: "在說是彼得潘...我就要閃退了。"))
    }

    //計算index數量＆下一題時更換題目順便清除上一題答案。
    func nextQus() {
        if index < 9 {
            index += 1
        } else {
            index = 0
        }
        qusLabel.text = QAArray[index].qus
        ansLabel.text = ""
    }
    
    @IBAction func nextButton(_ sender: AnyObject) {
        nextQus()
    }
    
    
    //趣味增加個Alert來玩。
    @IBAction func ansButton(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Answer", message: "\(QAArray[index].ans)", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "ok", style: .default) { (UIAlertAction) in
            self.ansLabel.text = "\(self.QAArray[self.index].ans)"
        }
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion:nil)
        
    }
    

    //執行時 預先顯示第一題題目。以及載入Array。
    override func viewDidLoad() {
        super.viewDidLoad()

        qaInArray()
        qusLabel.text = QAArray[index].qus

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


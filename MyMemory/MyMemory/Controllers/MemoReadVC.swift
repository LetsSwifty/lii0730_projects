//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by LeeHsss on 2022/08/05.
//

import Foundation
import UIKit

class MemoReadVC: UIViewController {
    
    var param: MemoData?
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm:ss에 작성됨"
        
        let dateString = formatter.string(from: (param?.regDate)!)
        self.navigationItem.title = dateString
    }
}

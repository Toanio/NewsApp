//
//  NotificationViewController.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit
import SnapKit

class NotificationViewController: UIViewController {
    
    let labelTest: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(labelTest)
        labelTest.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(view).offset(50)
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        

        // Do any additional setup after loading the view.
    }
    

    

}

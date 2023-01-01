//
//  MyInfoSettingController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/21.
//

import UIKit

final class MyInfoSettingController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    var db = dbManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        let us = db.getUserInfo()
        idLabel.text = us.id
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

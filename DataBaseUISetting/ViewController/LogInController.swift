//
//  LogInController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/26.
//

import UIKit
//enum phpString {
//    case user = "http://localhost/service.php"
//    case movieList = "http://localhost/service.php"
//    case cinemaList = "http://localhost/service.php"
//}

final class LogInController: UIViewController {
    
    private var db = dbManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        db.fetchUser(searchTerm: "http://localhost/service.php") { data in
            dump(data)
        }
        
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

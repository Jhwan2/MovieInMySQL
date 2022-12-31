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
    @IBOutlet weak var idTextFld: UITextField!
    @IBOutlet weak var pwTextFld: UITextField!
    
    private var db = dbManager.shared
    var array:Users = [] {
        didSet {
            userCheck()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userCheckList()
//        userCheck()
        // Do any additional setup after loading the view.
    }
    
    func userCheckList() {
        db.fetchUser(searchTerm: "http://localhost/MovieApp/service.php") { result in
//            dump(data)
            switch result {
            case .success(let data):
                self.array = data as! Users
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func userCheck() {
        
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

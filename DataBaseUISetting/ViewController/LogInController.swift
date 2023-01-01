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
    override func viewDidLoad() {
        super.viewDidLoad()
        userCheckList()
//        userCheck()
        // Do any additional setup after loading the view.
    }
    
    func userCheckList() {
        db.fetchUser(searchTerm: "http://localhost/MovieApp/service.php") { result in
            dump(result)
        }
    }
    
    @IBAction func logInCheckBtn(_ sender: UIButton) {
        if idTextFld.text != "" || pwTextFld.text != "" {
            print("둘다 안비었음")
            guard let Id = idTextFld.text else { return }
            guard let Pw = pwTextFld.text else { return }
            if db.userCheck(id: Id, pw: Pw) {
                print("유저 정보 확인 완료")
                guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? UITabBarController else { return }
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
            } else {
                let alert = UIAlertController(title: "로그인 실패", message: "비밀번호나 아이디를 확인하세요!", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        }
                alert.addAction(okAction)
                present(alert, animated: false, completion: nil)
                print("유저 정보 다름")
            }
        }
        else {
            let alert = UIAlertController(title: "입력 확인", message: "비밀번호나 아이디를 입력해 주세요!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
            print("둘다 비었음")
        }
                
    }

}


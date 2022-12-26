//
//  LogInController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/26.
//

import UIKit

class LogInController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        networkingExam()

        // Do any additional setup after loading the view.
    }
    
    func networkingExam(){
        print("@@@@@@@@@네트워크 시작")
        let movieURL = "http://localhost/service.php"

        guard let url = URL(string: movieURL) else { return  }
        URLSession.shared.dataTask(with: url) { data, responde, error in
            // code editting
            dump(data)
            
        }.resume()
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

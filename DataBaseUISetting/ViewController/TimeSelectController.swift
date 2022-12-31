//
//  TimeSelectController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/23.
//

import UIKit

class TimeSelectController: UIViewController {
    @IBOutlet weak var timePickerView: UIPickerView!
    let db = dbManager.shared
    var array:Times = [] {
        didSet{
            DispatchQueue.main.async {
                self.timePickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePickerView.delegate = self
        timePickerView.dataSource = self
        TimeArrGet()
        // Do any additional setup after loading the view.
    }
    
    func TimeArrGet() {
        db.fetchUser(searchTerm: "http://localhost/MovieApp/scedule.php") { result in
//            dump(data)
            switch result {
            case .success(let Datas):
                self.array = Datas as! Times
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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

extension TimeSelectController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row].screeningDate
    }
}

extension TimeSelectController: UIPickerViewDelegate{
    
}

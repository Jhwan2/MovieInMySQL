//
//  CinemaSelectController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/23.
//

import UIKit

final class CinemaSelectController: UIViewController {
    
    @IBOutlet weak var cinemaPickerView: UIPickerView!
    let db = dbManager.shared
    var array:Cinemas = [] {
        didSet{
            DispatchQueue.main.async {
                self.cinemaPickerView.reloadAllComponents()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cinemaPickerView.delegate = self
        cinemaPickerView.dataSource = self
        // Do any additional setup after loading the view.
        cinemaArrGet()
    }
    func cinemaArrGet() {
        db.fetchUser(searchTerm: "http://localhost/MovieApp/cinema.php") { result in
//            dump(data)
            switch result {
            case .success(let Datas):
                self.array = Datas as! Cinemas
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

extension CinemaSelectController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row].movieCinemaName
    }
    
}

extension CinemaSelectController: UIPickerViewDelegate {
    
}

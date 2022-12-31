//
//  MovieSelectController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/23.
//

import UIKit

class MovieSelectController: UIViewController {
    let db = dbManager.shared
    var array:Movies = [] {
        didSet{
            DispatchQueue.main.async {
                self.moviePickerView.reloadAllComponents()
            }
        }
    }

    @IBOutlet weak var moviePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePickerView.delegate = self
        moviePickerView.dataSource = self
        MovieArrGet()
        // Do any additional setup after loading the view.
    }
    
    func MovieArrGet() {
        db.fetchUser(searchTerm: "http://localhost/MovieApp/movie.php") { result in
//            dump(data)
            switch result {
            case .success(let Datas):
                self.array = Datas as! Movies
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

extension MovieSelectController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(array.count)
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row].movieTitle
    }
    
}

extension MovieSelectController: UIPickerViewDelegate{
    
}


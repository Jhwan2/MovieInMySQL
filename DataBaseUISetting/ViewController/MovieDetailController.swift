//
//  MovieDetailController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/21.
//

import UIKit

final class MovieDetailController: UIViewController {
    
    @IBOutlet var movieImgView: UIImageView!{
        didSet{
            movieImgView.image = movieImg
        }
    }
    var movieImg: UIImage?
    @IBOutlet var movieTitleLabel: UILabel! {
        didSet{
            movieTitleLabel.text = movieTitle
        }
    }
    var movieTitle: String?
    @IBOutlet var movieSubLabel: UILabel! {
        didSet{
            movieSubLabel.text = movieSub
        }
    }
    var movieSub: String?
    
    @IBOutlet var movieDetailLabel: UILabel! {
        didSet{
            movieDetailLabel.text = movieDetail
        }
    }
    var movieDetail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
}

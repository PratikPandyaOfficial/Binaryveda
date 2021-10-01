//
//  ProfileView.swift
//  BinaryvedaPT
//
//  Created by Pratik Pandya on 01/10/21.
//

import UIKit

class ProfileView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: OUTLETS
    
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var btnUploadsBottomBorder: UIView!
    @IBOutlet weak var btnExhibitionsBottomBorder: UIView!
    @IBOutlet weak var btnRevanueBottomBorder: UIView!
    @IBOutlet weak var imgCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    //MARK: VARIABLES
    var imgArray = [UIImage(named: "Barbell"), UIImage(named: "Beach"), UIImage(named: "Running"),UIImage(named: "Barbell"), UIImage(named: "Beach"), UIImage(named: "Running"),UIImage(named: "Barbell"), UIImage(named: "Beach"), UIImage(named: "Running"),UIImage(named: "Barbell"), UIImage(named: "Beach"), UIImage(named: "Running")]
    var indexpart = [0,1,2,3,4,5,6,7,8,9,10,11]
    var flag = [false,false,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnProfile.layer.cornerRadius = btnProfile.frame.size.height / 2
        
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
        
        for i in 0...(imgArray.count - 1){
            indexpart[i] = Int.random(in: 0...11)
        }
        
        flag[0] = true
        
        self.btnUploadsBottomBorder.backgroundColor = UIColor(red: 255.0, green: 181.0, blue: 0.0, alpha: 1.0)
        let height = imgCollectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.view.setNeedsLayout() //Or self.view.layoutIfNeeded()
        
        imgCollectionView.reloadData()
        
    }
    
    
    //MARK:ACTIONS
    @IBAction func btnUpload(_ sender: UIButton) {
        if flag[0] == false {
        self.btnUploadsBottomBorder.backgroundColor = UIColor(red: 255.0, green: 181.0, blue: 0.0, alpha: 1.0)
        self.btnRevanueBottomBorder.backgroundColor = UIColor.clear
        self.btnExhibitionsBottomBorder.backgroundColor = UIColor.clear
        
        for i in 0...imgArray.count - 1{
            indexpart[i] = Int.random(in: 0..<11)
        }
        self.imgCollectionView.reloadData()
        flag[0] = true
        flag[1] = false
        flag[2] = false
        }
        
    }
    
    
    @IBAction func btnExhibitions(_ sender: UIButton) {
        if flag[1] == false{
        self.btnUploadsBottomBorder.backgroundColor = UIColor.clear
        self.btnRevanueBottomBorder.backgroundColor = UIColor.clear
        self.btnExhibitionsBottomBorder.backgroundColor = UIColor(red: 255.0, green: 181.0, blue: 0.0, alpha: 1.0)
        
        for i in 0...imgArray.count - 1{
            indexpart[i] = Int.random(in: 0..<11)
        }
        self.imgCollectionView.reloadData()
            flag[0] = false
            flag[1] = true
            flag[2] = false
            
        }
    }
    
    
    @IBAction func btnRevanue(_ sender: UIButton) {
        if flag[2] == false{
        self.btnUploadsBottomBorder.backgroundColor = UIColor.clear
        self.btnRevanueBottomBorder.backgroundColor = UIColor(red: 255.0, green: 181.0, blue: 0.0, alpha: 1.0)
        self.btnExhibitionsBottomBorder.backgroundColor = UIColor.clear
        
        for i in 0...imgArray.count - 1{
            indexpart[i] = Int.random(in: 0..<11)
        }
        self.imgCollectionView.reloadData()
            flag[0] = false
            flag[1] = false
            flag[2] = true
        }
    }
    
    
    //MARK: COLLECTIONVIEW DELEGATES AND DATASOURCE
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileViewImageCell", for: indexPath) as? ProfileViewImageCell else {
            return UICollectionViewCell()
        }
        
        cell.img.image = self.imgArray[self.indexpart[indexPath.row]]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 5, height: UIScreen.main.bounds.width / 2 - 5)
    }
}

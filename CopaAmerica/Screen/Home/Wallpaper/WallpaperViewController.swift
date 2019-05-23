//
//  WallpaperViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
import Gemini
protocol WallpaperView {
    func refreshClWallpaper()
}
class WallpaperViewController: UIViewController,WallpaperView {
    
    @IBOutlet weak var clWallpaper: GeminiCollectionView!
    @IBOutlet weak var viewDownload: UIView!
    
    var presenter: WallpaperPresent?
    var wallpaperConfig: WallpaperConfiguaration = WallpaperConfiguarationImplementation()
    
    private(set) var scrollDirection: UICollectionView.ScrollDirection = .horizontal
    private(set) var rotationEffect: RollRotationEffect = .rollUp
    
    static func make(scrollDirection: UICollectionView.ScrollDirection, effect: RollRotationEffect) -> WallpaperViewController {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WallpaperViewController") as! WallpaperViewController
        viewController.rotationEffect = effect
        viewController.scrollDirection = scrollDirection
        return viewController
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wallpaperConfig.configuration(wallpaperViewController: self)
        presenter!.viewDidLoad()
        let nib = UINib(nibName: "WallpaperCollectionViewCell", bundle: nil)
        clWallpaper.register(nib, forCellWithReuseIdentifier: "WallpaperCollectionViewCell")
        clWallpaper.backgroundColor = .clear
        clWallpaper.delegate = self
        clWallpaper.dataSource = self
        if #available(iOS 11.0, *) {
            clWallpaper.contentInsetAdjustmentBehavior = .never
        }
        
        clWallpaper.gemini
            .rollRotationAnimation()
            .rollEffect(rotationEffect)
            .scale(0.7)
        setupGemini()
        
    }
    func setupGemini() {
        let layout = UICollectionViewPagingFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.sectionInset = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -30)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        clWallpaper.collectionViewLayout = layout
        clWallpaper.decelerationRate = UIScrollView.DecelerationRate.fast
        clWallpaper.layer.cornerRadius = 5
        let startColor = UIColor(red: 29 / 255, green: 44 / 255, blue: 76 / 255, alpha: 1)
        let endColor = UIColor(red: 3 / 255, green: 7 / 255, blue: 20 / 255, alpha: 1)
        let colors: [CGColor] = [startColor.cgColor, endColor.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame.size = view.bounds.size
        view.layer.insertSublayer(gradientLayer, at: 0)
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func refreshClWallpaper(){
        clWallpaper.reloadData()
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        self.downloadWallpaper?()
    }
    
    func saveWallpaper(row:Int) {
        
        let image = UIImageView()
        image.setCustomImage((self.presenter?.getUrlDownload(row: row))!, defaultAvatar: nil)
        UIImageWriteToSavedPhotosAlbum(image.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    var downloadWallpaper:(()->())?
}
extension WallpaperViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? GeminiCell {
            self.clWallpaper.animateCell(cell)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.numberOfList)!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clWallpaper.dequeueReusableCell(withReuseIdentifier: "WallpaperCollectionViewCell", for: indexPath) as! WallpaperCollectionViewCell
        presenter?.setData(cell: cell, row: indexPath.row)
        self.downloadWallpaper = {[weak self] in
            self!.saveWallpaper(row: indexPath.row)
        }
        
        self.clWallpaper.animateCell(cell)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        clWallpaper.animateVisibleCells()
    }
    
    
}

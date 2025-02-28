//
//  AlbumDetailsViewController.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import UIKit
import Combine
import CombineCocoa

class AlbumDetailsViewController: UIViewController {
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    // MARK: - PROPERITES
    
    var albumTitle: String?
    var viewModel = AlbumsDetailsViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    //MARK: - VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindCollectionViewInteractions()
        
    }
}

//MARK: - EXTENSIONS

extension AlbumDetailsViewController {
    
    //MARK: - SETUP VIEW
    
    func setupView() {
        setupNavigationBar()
        setupCollectionView()
        registerCell()
        bindViewModel()
    }
    
    func setupNavigationBar() {
        self.title = albumTitle ?? AlbumsDetailsConstants.navigationBarTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AlbumsDetailsConstants.searchBarPlaceholder
        
        searchController.searchBar.textDidChangePublisher
            .sink { [weak self] searchText in
                self?.viewModel.updateSearchQuery(searchText)
            }
            .store(in: &cancellables)
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupCollectionView() {
        imagesCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        let itemWidth = UIScreen.main.bounds.width / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        imagesCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    func registerCell() {
        imagesCollectionView.register(UINib(nibName: imagesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: imagesCollectionViewCell.identifier)
    }
}

//MARK: - COLLECTION VIEW

extension AlbumDetailsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCollectionViewCell.identifier, for: indexPath) as! imagesCollectionViewCell
        let image = viewModel.filteredImages[indexPath.row]
        cell.setupCell(images: image)
        return cell
    }
    
    //MARK: - COLLECTION VIEW INTERACTIONS
    
    func bindCollectionViewInteractions() {
        imagesCollectionView.didSelectItemPublisher
            .sink { [weak self] indexPath in
                guard let self = self else { return }
                let selectedImageModel = self.viewModel.filteredImages[indexPath.row]
                self.viewModel.fetchFullSizeImage(for: selectedImageModel)
            }
            .store(in: &cancellables)
        
        viewModel.selectedImageSubject
            .sink { [weak self] image in
                self?.navigateToSelectedImageViewController(with: image)
            }
            .store(in: &cancellables)
    }
    
    func navigateToSelectedImageViewController(with image: UIImage) {
        let selectedImageVC = ImageViewerViewController()
        let ImageViewerVM = ImageViewerViewModel()
        selectedImageVC.viewModel = ImageViewerVM
        selectedImageVC.viewModel.selectedImage = image
        self.navigationController?.pushViewController(selectedImageVC, animated: true)
    }
}

//MARK: - VIEW MODEL

private extension AlbumDetailsViewController {
    
    //MARK: - BIND VIEW MODEL
    
    func bindViewModel() {
        bindIsLoading()
        bindErrorState()
        bindAlbums()
    }
    
    func bindIsLoading() {
        viewModel.isLoading.sink { [weak self] isLoading in
            guard let self else { return }
            if isLoading {
                self.showLoader()
            } else {
                self.hideLoader()
            }
        }.store(in: &cancellables)
    }
    
    func bindErrorState() {
        viewModel.errorMessage
            .sink { [weak self] errorMessage in
                guard let self = self, let _ = errorMessage else { return }
                AlertManager.showAlert(on: self, title: AlbumsDetailsConstants.errorAlertTitle, message: AlbumsDetailsConstants.errorAlertMessage)
            }
            .store(in: &cancellables)
    }
    
    func bindAlbums() {
        viewModel.$filteredImages
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.imagesCollectionView.reloadData()
            }
            .store(in: &cancellables)
    }
}

//MARK: - CONSTANTS

fileprivate struct AlbumsDetailsConstants {
    static let collectionViewItemsPerRow: CGFloat = 3
    static let collectionViewMinimumSpacing: CGFloat = 0
    static let searchBarPlaceholder = "Search in images..."
    static let navigationBarTitle = "Albums"
    static let errorAlertTitle = "Error"
    static let errorAlertMessage = "Something went wrong"
}

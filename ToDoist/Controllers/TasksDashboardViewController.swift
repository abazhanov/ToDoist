//
//  TasksDashboardViewController.swift
//  ToDoist
//
//  Created by Mac on 19.04.2021.
//

import UIKit

class TasksDashboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var tasksCollection: UICollectionView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    private let taskData = TaskDataManagerImpl.shared
    
    override func viewDidLayoutSubviews() {
        prepareUI()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        taskData.getTotalCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "taskCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "importantsTaskHeader", for: indexPath)
        return header
    }
}

extension TasksDashboardViewController {
    private func prepareUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        addTaskButton.layer.cornerRadius = addTaskButton.frame.size.height / 2
    }
}

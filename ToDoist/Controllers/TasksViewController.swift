//
//  TasksViewController.swift
//  ToDoist
//
//  Created by Mac on 16.04.2021.
//

import UIKit

class TasksViewController: UICollectionViewController {
    let names = ["Emergency", "Normal", "Low"]
    
    private let sectionInsets = UIEdgeInsets(
        top: 16.0,
        left: 16.0,
        bottom: 16.0,
        right: 16.0)

    private let reuseIndentifier = "taskIdent"
    private let statusHeaderIdentifier = "statusHeader"
    private let itemsPerRow: CGFloat = 3

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: statusHeaderIdentifier, for: indexPath) as? StatusHeaderCollectionReusableView
        sectionHeader?.headerLabel.text = names[indexPath.section]
        return sectionHeader!
    }
}

extension TasksViewController: UICollectionViewDelegateFlowLayout {
   

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return sectionInsets.left
    }
}

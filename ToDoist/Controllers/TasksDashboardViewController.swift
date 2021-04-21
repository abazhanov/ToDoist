//
//  TasksDashboardViewController.swift
//  ToDoist
//
//  Created by Mac on 19.04.2021.
//

import UIKit

class TasksDashboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet var tasksCollection: UICollectionView!
    @IBOutlet var addTaskButton: UIButton!

    //private let taskData = TaskDataManagerImpl.shared
    private var tasks: [ImportantStatus: [Task]] = [
        .emergency: [
            Task(name: "Buy milk", description: "Buy milk in nearest store", estimateDate: Date(), status: .undone, importantStatus: .emergency),
            Task(name: "Send email", description: "Send email for John", estimateDate: Date(), status: .undone, importantStatus: .emergency)
        ],
        .normal: [
            Task(name: "Buy soda", description: "Buy soda in nearest store", estimateDate: Date(), status: .undone, importantStatus: .normal),
            Task(name: "Call grandma", description: "Call grandma", estimateDate: Date(), status: .undone, importantStatus: .normal),
            Task(name: "Write an app", description: "With xcode", estimateDate: Date(), status: .undone, importantStatus: .normal)
        ],
        .low: [
            Task(name: "Take a nap", description: "On this beautiful sofa", estimateDate: Date(), status: .undone, importantStatus: .normal),
        ]
    ]

    override func viewDidLayoutSubviews() {
        prepareUI()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        tasks.keys.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return tasks[.emergency]?.count ?? 0
        case 1:
            return tasks[.normal]?.count ?? 0
        default:
            return tasks[.low]?.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "taskCell", for: indexPath) as? TaskCollectionViewCell else { fatalError("Couldn't cast to TaskCollectionView") }
        
        cell.layer.borderWidth = 0.3
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        
        switch indexPath.section {
        case 0:
            let task = tasks[.emergency]?[indexPath.row]
            cell.statusLabel.text = "Emergency"
            cell.backView.backgroundColor = .red
            cell.estimateLabel.text = String((task?.estimateDate.description)!)
            cell.nameLabel.text = task?.name
        case 1:
            let task = tasks[.normal]?[indexPath.row]
            cell.statusLabel.text = "Normal"
            cell.backView.backgroundColor = .green
            cell.estimateLabel.text = String((task?.estimateDate.description)!)
            cell.nameLabel.text = task?.name
        default:
            let task = tasks[.low]?[indexPath.row]
            cell.statusLabel.text = "Low"
            cell.backView.backgroundColor = .gray
            cell.estimateLabel.text = String((task?.estimateDate.description)!)
            cell.nameLabel.text = task?.name
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "importantsTaskHeader", for: indexPath) as? HeaderSectionView else { fatalError("Couldn't cast to HeaderSectionView")}
        switch indexPath.section {
        case 0:
            header.headerTitle.text = "Emergency"
            header.backgroundColor = .red
        case 1:
            header.headerTitle.text = "Normal"
            header.backgroundColor = .green
        default:
            header.headerTitle.text = "Low"
            header.backgroundColor = .gray
        }
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 20, height: 200)
    }
}

extension TasksDashboardViewController {
    private func prepareUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        addTaskButton.layer.cornerRadius = addTaskButton.frame.size.height / 2
    }
}

//
//  ProjectManagerCollectController.swift
//  ChemlabCopilot
//
//  Created by ati chetsurakul on 8/12/21.
//

import UIKit
import CoreData

class ProjectManagerCollectController: UICollectionViewController {
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var labProjects = [LabProject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        self.collectionView.register(LabToDoCell.nib(), forCellWithReuseIdentifier: LabToDoCell.reuseIdentifier)
        loadLabProjects()
        // Do any additional setup after loading the view.

    }

    @IBAction func addProjectPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "add New TODO", message: "", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "ProjectName"
        }
        let action = UIAlertAction(title: "Add", style: .default) { _ in
            let newProject = LabProject(context: self.context)
            if let userTypingName = alert.textFields?[0] {
                newProject.name = userTypingName.text
                newProject.color = "red"
                newProject.progress = 0.05
                self.labProjects.append(newProject)
                self.saveLabProject()
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return labProjects.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabToDoCell.reuseIdentifier, for: indexPath) as! LabToDoCell
        // Configure the cell
        cell.labelOfProject.text = labProjects[indexPath.row].name
        cell.progressView.progress = labProjects[indexPath.row].progress

        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        context.delete(labProjects[indexPath.row])
        labProjects.remove(at: indexPath.row)
        saveLabProject()
        
        collectionView.deselectItem(at: indexPath, animated: true )
    }


}


extension ProjectManagerCollectController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}


//MARK: CoreData Save and Load Method
extension ProjectManagerCollectController {
    func saveLabProject() {
        do {
            try context.save()
        } catch {
            print("Error saving Lab \(error)")
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
       
    }
    
    func loadLabProjects() {
        
        let request : NSFetchRequest<LabProject> = LabProject.fetchRequest()
        
        do{
            self.labProjects = try context.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }
       
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    
}



/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// MARK: UICollectionViewDelegate

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return true
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return true
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
    return false
}

override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
    return false
}

override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

}
*/

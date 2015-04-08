import UIKit

var categoryManager: CategoryManager = CategoryManager()

struct category {
    var name = "To do today"
    var color = UIColor.cyanColor()
    var tasks: TaskManager = TaskManager()
    
}


class CategoryManager: NSObject {
    
    var categories = [category]()
    
    func addCategory(name: String, color: UIColor, tasks: TaskManager) {
        categories.append(category(name: name, color: color, tasks: tasks))
    }
    
}

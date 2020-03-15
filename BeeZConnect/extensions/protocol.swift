
import Foundation


protocol BZGetItDoneDelegate {
    func didAddNewVC()
}

protocol GDWelcomeView {
    func didTapButton()
}

protocol GDPopupMenuDelegate {
    func didOpenPopupMenu()
}

protocol GDListCellDelegate {
    func toggleBox(_ updatedToDo: ToDo)
}

protocol GDNewItemDelegate {
    func addItemToList(_ text: String)
}


import UIKit

struct Book {
    var author: String
    var title: String
    var minAge: Int
    var count: Int
}

struct Member {
    var name: String
    var age: Int
}

enum BorrowError: ErrorType {
    case NoSuchBook
    case NoneAvailable
    case MemberTooYoung
    case NoSuchMember
}

class Library {
    var books = [
        "Swift 2.0": Book(author: "Apple", title: "Swift 2.0", minAge: 12, count: 1),
        "The Cat In The Hat": Book(author: "Dr. Zeuss", title: "The Cat In The Hat", minAge: 1, count: 2),
        "Harry Potter": Book(author: "J. K. Rowling", title: "Harry Potter", minAge: 16, count: 0)
    ]
    
    var members = [
        "Mr. Smith": Member(name: "Mr. Smith", age: 32),
        "Billy": Member(name: "Billy", age: 2),
        "Kate": Member(name: "Kate", age: 15)
    ]
 
    func borrowBookNoGuard(bookNamed name: String, memberName:String) throws {
        if let member = members[memberName] {
            // member was found
            if var book = books[name] {
                if book.count > 0 {
                    if member.age >= book.minAge {
                        // We finally made it!
                        --book.count
                        books[name] = book
                        lendBook(name)
                    }
                    else {
                        throw BorrowError.MemberTooYoung
                    }
                }
                else {
                    throw BorrowError.NoneAvailable
                }
            }
            else {
                throw BorrowError.NoSuchBook
            }
        }
        else {
            throw BorrowError.NoSuchMember
        }
    }
    
    func borrowBook(bookNamed name: String, memberName:String) throws {
        guard let member = members[memberName] else {
            throw BorrowError.NoSuchMember
        }
        guard var book = books[name] else {
            throw BorrowError.NoSuchBook
        }
        guard member.age >= book.minAge else {
            throw BorrowError.MemberTooYoung
        }
        guard book.count > 0 else {
            throw BorrowError.NoneAvailable
        }
        
        --book.count
        books[name] = book
        lendBook(name)
    }
    
    func lendBook(name: String) {
        print("Lent out the book \(name)")
    }
}


var library = Library()

do {
    try library.borrowBook(bookNamed: "Swift 2.0", memberName: "Billy")
} catch BorrowError.NoSuchMember {
    print("No such member at this library.")
} catch BorrowError.NoneAvailable {
    print("All copies are currently on loan.")
} catch BorrowError.MemberTooYoung {
    print("Member is too young for the book.")
} catch BorrowError.NoSuchBook {
    print("Book not stocked at this library.")
}


do {
    try library.borrowBook(bookNamed: "The Cat In The Hat", memberName: "Kate")
} catch BorrowError.NoSuchMember {
    print("No such member at this library.")
} catch BorrowError.NoneAvailable {
    print("All copies are currently on loan.")
} catch BorrowError.MemberTooYoung {
    print("Member is too young for the book.")
} catch BorrowError.NoSuchBook {
    print("Book not stocked at this library.")
}

do {
    try library.borrowBookNoGuard(bookNamed: "Harry Potter", memberName: "Kate")
} catch BorrowError.NoSuchMember {
    print("No such member at this library.")
} catch BorrowError.NoneAvailable {
    print("All copies are currently on loan.")
} catch BorrowError.MemberTooYoung {
    print("Member is too young for the book.")
} catch BorrowError.NoSuchBook {
    print("Book not stocked at this library.")
}


do {
    try library.borrowBookNoGuard(bookNamed: "Java 1.0", memberName: "Kate")
} catch BorrowError.NoSuchMember {
    print("No such member at this library.")
} catch BorrowError.NoneAvailable {
    print("All copies are currently on loan.")
} catch BorrowError.MemberTooYoung {
    print("Member is too young for the book.")
} catch BorrowError.NoSuchBook {
    print("Book not stocked at this library.")
}


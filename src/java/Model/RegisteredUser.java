package Model;
// Generated Dec 5, 2014 5:29:36 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * RegisteredUser generated by hbm2java
 */
public class RegisteredUser  implements java.io.Serializable {


     private String registeredUserId;
     private Person person;
     private String libraryCardNumber;
     private boolean active;
     private Set checkedOutBooks = new HashSet(0);
     private Set reservedBooks = new HashSet(0);

    public RegisteredUser() {
    }

	
    public RegisteredUser(Person person, String libraryCardNumber, boolean active) {
        this.person = person;
        this.libraryCardNumber = libraryCardNumber;
        this.active = active;
    }
    public RegisteredUser(Person person, String libraryCardNumber, boolean active, Set checkedOutBooks, Set reservedBooks) {
       this.person = person;
       this.libraryCardNumber = libraryCardNumber;
       this.active = active;
       this.checkedOutBooks = checkedOutBooks;
       this.reservedBooks = reservedBooks;
    }
   
    public String getRegisteredUserId() {
        return this.registeredUserId;
    }
    
    public void setRegisteredUserId(String registeredUserId) {
        this.registeredUserId = registeredUserId;
    }
    public Person getPerson() {
        return this.person;
    }
    
    public void setPerson(Person person) {
        this.person = person;
    }
    public String getLibraryCardNumber() {
        return this.libraryCardNumber;
    }
    
    public void setLibraryCardNumber(String libraryCardNumber) {
        this.libraryCardNumber = libraryCardNumber;
    }
    public boolean isActive() {
        return this.active;
    }
    
    public void setActive(boolean active) {
        this.active = active;
    }
    public Set getCheckedOutBooks() {
        return this.checkedOutBooks;
    }
    
    public void setCheckedOutBooks(Set checkedOutBooks) {
        this.checkedOutBooks = checkedOutBooks;
    }
    public Set getReservedBooks() {
        return this.reservedBooks;
    }
    
    public void setReservedBooks(Set reservedBooks) {
        this.reservedBooks = reservedBooks;
    }




}


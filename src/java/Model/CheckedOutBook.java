package Model;
// Generated Dec 5, 2014 5:29:36 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * CheckedOutBook generated by hbm2java
 */
public class CheckedOutBook  implements java.io.Serializable {


     private int checkedOutBooksId;
     private Book book;
     private RegisteredUser registeredUser;
     private Date expirationDate;

    public CheckedOutBook() {
    }

    public CheckedOutBook(int checkedOutBooksId, Book book, RegisteredUser registeredUser, Date expirationDate) {
       this.checkedOutBooksId = checkedOutBooksId;
       this.book = book;
       this.registeredUser = registeredUser;
       this.expirationDate = expirationDate;
    }
   
    public int getCheckedOutBooksId() {
        return this.checkedOutBooksId;
    }
    
    public void setCheckedOutBooksId(int checkedOutBooksId) {
        this.checkedOutBooksId = checkedOutBooksId;
    }
    public Book getBook() {
        return this.book;
    }
    
    public void setBook(Book book) {
        this.book = book;
    }
    public RegisteredUser getRegisteredUser() {
        return this.registeredUser;
    }
    
    public void setRegisteredUser(RegisteredUser registeredUser) {
        this.registeredUser = registeredUser;
    }
    public Date getExpirationDate() {
        return this.expirationDate;
    }
    
    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }




}



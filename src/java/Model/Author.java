package Model;
// Generated Dec 5, 2014 5:29:36 PM by Hibernate Tools 4.3.1



/**
 * Author generated by hbm2java
 */
public class Author  implements java.io.Serializable {


     private int authorId;
     private Book book;
     private String author;

    public Author() {
    }

    public Author(int authorId, Book book, String author) {
       this.authorId = authorId;
       this.book = book;
       this.author = author;
    }
   
    public int getAuthorId() {
        return this.authorId;
    }
    
    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }
    public Book getBook() {
        return this.book;
    }
    
    public void setBook(Book book) {
        this.book = book;
    }
    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }




}


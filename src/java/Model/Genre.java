package Model;
// Generated Dec 5, 2014 5:29:36 PM by Hibernate Tools 4.3.1



/**
 * Genre generated by hbm2java
 */
public class Genre  implements java.io.Serializable {


     private int genreId;
     private Book book;
     private String genre;

    public Genre() {
    }

    public Genre(int genreId, Book book, String genre) {
       this.genreId = genreId;
       this.book = book;
       this.genre = genre;
    }
   
    public int getGenreId() {
        return this.genreId;
    }
    
    public void setGenreId(int genreId) {
        this.genreId = genreId;
    }
    public Book getBook() {
        return this.book;
    }
    
    public void setBook(Book book) {
        this.book = book;
    }
    public String getGenre() {
        return this.genre;
    }
    
    public void setGenre(String genre) {
        this.genre = genre;
    }




}



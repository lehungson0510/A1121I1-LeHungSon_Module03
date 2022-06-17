package repository;

import model.Book;

import java.sql.SQLException;
import java.util.List;

public interface IBookRepo {
    List<Book> selectAllBook();
    List<Book> searchBook(String name);


}

package repository;

import model.Book;
import model.CardBorrowBook;

import java.util.List;

public interface IBorrowRepo {
    CardBorrowBook selectBorrowBook(int id);
}

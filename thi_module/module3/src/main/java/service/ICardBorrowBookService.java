package service;

import model.Book;
import model.CardBorrowBook;

import java.util.List;

public interface ICardBorrowBookService {
    public CardBorrowBook selectCardBorrowBook(int id);
}

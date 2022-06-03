package model.repository;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public boolean insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUser();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> selectUserByCountry(String country);

    public List<User> sort(String sortProperty);

    public User getUserById(int id);

    public boolean insertUserStore(User user) throws SQLException;
}

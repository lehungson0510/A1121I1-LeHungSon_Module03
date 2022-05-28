package model.service.impl;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.impl.UserRepository;
import model.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    public IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return  userRepository.selectUserByCountry(country);
    }

    @Override
    public List<User> sort() {
        return userRepository.sort();
    }
}

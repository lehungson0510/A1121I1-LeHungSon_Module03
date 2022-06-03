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
    public boolean insertUser(User user) throws SQLException {
        return  userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUserProcedure();
    }

    @Override
    public boolean deleteUserProcedure(int id) throws SQLException {
        return userRepository.deleteUserProcedure(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUserProcedure(user);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return  userRepository.selectUserByCountry(country);
    }

    @Override
    public List<User> sort(String sortProperty) {
        return userRepository.sort(sortProperty);
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public boolean insertUserProcedure(User user) throws SQLException {
        return userRepository.insertUserProcedure(user);
    }
}

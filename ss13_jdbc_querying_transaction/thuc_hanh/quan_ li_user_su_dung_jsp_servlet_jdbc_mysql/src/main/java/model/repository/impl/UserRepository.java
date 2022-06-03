package model.repository.impl;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo1?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "016367699433a";

    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USERS_BY_COUNTRY = "select * from users where country like ?";
    private static final String ORDER_BY_NAME = "select * from users order by `name`";
    private static final String ORDER_BY_EMAIL = "select * from users order by `email`";
    private static final String ORDER_BY_COUNTRY = "select * from users order by `country`";
    private static final String CALL_GET_BY_ID_PROCEDURE = "CALL get_user_by_id(?)";
    private static final String CALL_INSERT_USER_PROCEDURE = "CALL insert_user(?,?,?)";

    public UserRepository() {
    }


    @Override
    public boolean insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            int check = preparedStatement.executeUpdate();
            if (check != 0) {
                return true;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

//    *************** Xoá cũng được*******************

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnect();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public List<User> selectUserByCountry(String country) {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_COUNTRY);) {
            preparedStatement.setString(1, country);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                country= rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> sort(String sortProperty) {
        List<User> users = new ArrayList<>();
        switch (sortProperty){
            case "name":
                try (Connection connection = BaseRepository.getConnect();
//           kiểu như câu lệnh truy vấn
                     PreparedStatement preparedStatement = connection.prepareStatement(ORDER_BY_NAME);) {
                    System.out.println(preparedStatement);
//           đọc từ database
                    ResultSet rs = preparedStatement.executeQuery();

                    // Step 4: Process the ResultSet object.
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String country = rs.getString("country");
                        users.add(new User(id, name, email, country));
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
                return users;
            case "email":
                try (Connection connection = BaseRepository.getConnect();

//           kiểu như câu lệnh truy vấn
                     PreparedStatement preparedStatement = connection.prepareStatement(ORDER_BY_EMAIL);) {
                    System.out.println(preparedStatement);

//           đọc từ database
                    ResultSet rs = preparedStatement.executeQuery();

                    // Step 4: Process the ResultSet object.
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String country = rs.getString("country");
                        users.add(new User(id, name, email, country));
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
                return users;
            case "country":
                try (Connection connection = BaseRepository.getConnect();

//           kiểu như câu lệnh truy vấn
                     PreparedStatement preparedStatement = connection.prepareStatement(ORDER_BY_COUNTRY);) {
                    System.out.println(preparedStatement);

//           đọc từ database
                    ResultSet rs = preparedStatement.executeQuery();

                    // Step 4: Process the ResultSet object.
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String country = rs.getString("country");
                        users.add(new User(id, name, email, country));
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
                return users;
        }
        return selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnect(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnect(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


    @Override
    public User getUserById(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnect();
        try {
            CallableStatement callableStatement = connection.prepareCall(CALL_GET_BY_ID_PROCEDURE);{
                callableStatement.setInt(1,id);
                ResultSet rs = callableStatement.executeQuery();
                while (rs.next()){
                    String name = rs.getString("name");

                    String email = rs.getString("email");

                    String country = rs.getString("country");

                    user = new User(id, name, email, country);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean insertUserStore(User user) throws SQLException {
        Connection connection = BaseRepository.getConnect();
        CallableStatement callableStatement = connection.prepareCall(CALL_INSERT_USER_PROCEDURE);
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2,user.getEmail());
        callableStatement.setString(3,user.getCountry());
        boolean flag = callableStatement.executeUpdate() > 0;
        return flag ;
    }
}

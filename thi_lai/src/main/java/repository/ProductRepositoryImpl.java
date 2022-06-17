package repository;

import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository{
    public final static String SELECT_ALL_PRODUCT = "select * from product;";
    public final static String SELECT_PRODUCT_BY_ID = "select * from product where id = ? ;";
    public final static String SELECT_ALL_CATEGORY = "select * from category ;";
    public final static String INSERT_PRODUCT = "insert into product (`name`, price, quantity, color, `description`, category_id) values (?,?,?,?,?,?)";
    public final static String UPDATE = "update product set name = ?, price = ?, quantity = ?, color = ?, `description` = ?, category_id = ? where id = ?;";
    public final static String SEARCH = "select * from product where name like ?";
    public final static String DELETE = "delete from product where id = ?";

    @Override
    public List<Category> selectAllCategory() {
        List<Category> categoryList = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnect()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("name");

                Category category = new Category(id,name);
                categoryList.add(category);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> productList = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnect()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("category_id");


                Product product = new Product(id, name, price, quantity, color, description, categoryId);
                productList.add(product);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean insertProduct(Product product) {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setInt(6, product.getCategoryId());
            int check = preparedStatement.executeUpdate();
            if (check != 0) {
                return true;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("category_id");
                product = new Product(id, name, price, quantity, color, description, categoryId);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    @Override
    public boolean updateProduct(Product product) {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setInt(6, product.getCategoryId());
            preparedStatement.setInt(7, product.getId());
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

    @Override
    public List<Product> searchProduct(String nameSearch) {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);) {
            preparedStatement.setString(1,"%" + nameSearch +"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("category_id");

                productList.add(new Product(id, name, price, quantity, color, description, categoryId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productList;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement statement = connection.prepareStatement(DELETE);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

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
}

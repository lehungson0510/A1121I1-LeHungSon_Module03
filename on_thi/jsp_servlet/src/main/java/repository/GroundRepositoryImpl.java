package repository;

import common.Validation;
import model.Ground;
import model.Status;
import model.TypeOffice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroundRepositoryImpl implements IGroundRepository {

public final static String SELECT_ALL_GROUND = "select * from ground order by area ASC ;";
public final static String SELECT_GROUND_BY_ID = "select * from ground where id = ? order by area ASC ;";
public final static String SELECT_ALL_TYPE_OFFICE = "select * from type_office;";
public final static String SELECT_ALL_STATUS = "select * from status;";
public final static String INSERT_GROUND = "insert into ground (id, area, status_id, floors, type_office_id, `description`, rental_price, start_date, end_date) \n" +
        "values (?,?,?,?,?,?,?,?,?)";
public final static String DELETE = "delete from ground where id = ?";
public final static String SEARCH = "select * from ground where type_office_id like ? and floors like ?  and rental_price like ? order by area;";
public final static String UPDATE = "update ground set area = ?, status_id = ?, floors = ?, type_office_id = ?, `description` = ?, rental_price = ?, start_date = ?, end_date = ? where id = ?;";
    @Override
    public List<TypeOffice> selectAllTypeOffice() {
        List<TypeOffice> typeOfficeList = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnect()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE_OFFICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int typeOfficeId = resultSet.getInt("type_office_id");
                String name = resultSet.getString("name");

                TypeOffice typeOffice = new TypeOffice(typeOfficeId,name);
                typeOfficeList.add(typeOffice);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return typeOfficeList;
    }

    @Override
    public List<Status> selectAllStatus() {
        List<Status> statusList = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnect()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STATUS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int statusId = resultSet.getInt("status_id");
                String name = resultSet.getString("name");

                Status status = new Status(statusId,name);
                statusList.add(status);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return statusList;
    }

    @Override
    public List<Ground> selectAllGround() {
        List<Ground> groundList = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnect()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GROUND);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String id = rs.getString("id");
                double area = rs.getDouble("area");
                int statusId = rs.getInt("status_id");
                int floors = rs.getInt("floors");
                int typeOfficeId = rs.getInt("type_office_id");
                String description = rs.getString("description");
                double rentalPrice = rs.getDouble("rental_price");
                String startDate = rs.getString("start_date");
                startDate = Validation.formatDate(startDate);
                String endDate = rs.getString("end_date");
                endDate = Validation.formatDate(endDate);
                Ground ground = new Ground(id,area,statusId,floors,typeOfficeId,description,rentalPrice,startDate,endDate);
                groundList.add(ground);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return groundList;
    }

    @Override
    public boolean insertGround(Ground ground) throws SQLException {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_GROUND)) {
            preparedStatement.setString(1, ground.getId());
            preparedStatement.setDouble(2, ground.getArea());
            preparedStatement.setInt(3, ground.getStatusId());
            preparedStatement.setInt(4, ground.getFloors());
            preparedStatement.setInt(5, ground.getTypeOfficeId());
            preparedStatement.setString(6, ground.getDescription());
            preparedStatement.setDouble(7, ground.getRentalPrice());
            preparedStatement.setString(8, ground.getStartDate());
            preparedStatement.setString(9, ground.getEndDate());
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
    public Ground selectGround(String id) {
        Ground ground = null;
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GROUND_BY_ID);) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                id = rs.getString("id");
                double area = rs.getDouble("area");
                int statusId = rs.getInt("status_id");
                int floors = rs.getInt("floors");
                int typeOfficeId = rs.getInt("type_office_id");
                String description = rs.getString("description");
                double rentalPrice = rs.getDouble("rental_price");
                String startDate = rs.getString("start_date");
                String endDate = rs.getString("end_date");
                ground = new Ground(id,area,statusId,floors,typeOfficeId,description,rentalPrice,startDate,endDate);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ground;
    }

    @Override
    public boolean updateGround(Ground ground) throws SQLException {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE)) {
            preparedStatement.setDouble(1, ground.getArea());
            preparedStatement.setInt(2, ground.getStatusId());
            preparedStatement.setInt(3, ground.getFloors());
            preparedStatement.setInt(4, ground.getTypeOfficeId());
            preparedStatement.setString(5, ground.getDescription());
            preparedStatement.setDouble(6, ground.getRentalPrice());
            preparedStatement.setString(7, ground.getStartDate());
            preparedStatement.setString(8, ground.getEndDate());
            preparedStatement.setString(9, ground.getId());
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
    public boolean deleteGround(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement statement = connection.prepareStatement(DELETE);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Ground> search(String typeOffice, String floors, String price) {
        List<Ground> groundList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);) {
            preparedStatement.setString(1,"%" + typeOffice +"%");
            preparedStatement.setString(2,"%" + floors +"%");
            preparedStatement.setString(3,"%" + price +"%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                double area = rs.getDouble("area");
                int statusId = rs.getInt("status_id");
                int floors1 = rs.getInt("floors");
                int typeOfficeId = rs.getInt("type_office_id");
                String description = rs.getString("description");
                double rentalPrice = rs.getDouble("rental_price");
                String startDate = rs.getString("start_date");
                startDate = Validation.formatDate(startDate);
                String endDate = rs.getString("end_date");
                endDate = Validation.formatDate(endDate);
                groundList.add(new Ground(id, area, statusId, floors1,typeOfficeId,description,rentalPrice,startDate,endDate));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return groundList;
    }

    public List<Integer> listFloors (){
        List<Integer> list = new ArrayList<>();
        for (int i =1; i<=15; i++){
            list.add(i);
        }
        return list;
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

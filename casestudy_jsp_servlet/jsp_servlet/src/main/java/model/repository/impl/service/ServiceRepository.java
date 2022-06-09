package model.repository.impl.service;

import model.bean.Service;
import model.repository.BaseRepository;
import model.repository.iservice.IServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {
    private static final String SELECT_ALL_SERVICE = "select * from service";
    private static final String INSERT_SERVICE_SQL = "insert into service(service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,description_other_convenience,pool_area,number_of_floors) values (?,?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Service> selectAllService() {
        List<Service> serviceList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("service_id");
                String serviceName = rs.getString("service_name");
                double serviceArea = rs.getDouble("service_area");
                double serviceCost = rs.getDouble("service_cost");
                int serviceMaxPeople = rs.getInt("service_max_people");
                int rentTypeId = rs.getInt("rent_type_id");
                int serviceTypeId = rs.getInt("service_type_id");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloor = rs.getInt("number_of_floors");
                serviceList.add(new Service(id, serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId, serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return serviceList;
    }

    @Override
    public boolean insertService(Service service) throws SQLException {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE_SQL)) {
            preparedStatement.setString(1, service.getServiceName());
            preparedStatement.setDouble(2, service.getServiceArea());
            preparedStatement.setDouble(3, service.getServiceCost());
            preparedStatement.setInt(4, service.getServiceMaxPeople());
            preparedStatement.setInt(5, service.getRentTypeId());
            preparedStatement.setInt(6, service.getServiceTypeId());
            preparedStatement.setString(7, service.getStandardRoom());
            preparedStatement.setString(8, service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, service.getPoolArea());
            preparedStatement.setInt(10, service.getNumberOfFloors());
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
    public Service selectService(int id) {
        return null;
    }

    @Override
    public boolean updateService(Service service) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteService(int id) throws SQLException {
        return false;
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

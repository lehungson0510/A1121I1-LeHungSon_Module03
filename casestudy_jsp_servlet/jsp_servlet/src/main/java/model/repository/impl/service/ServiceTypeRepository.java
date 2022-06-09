package model.repository.impl.service;

import model.bean.ServiceType;
import model.repository.BaseRepository;
import model.repository.iservice.IServiceTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepository implements IServiceTypeRepository {
    private static final String SELECT_ALL_SERVICE_TYPE = "select * from service_type";

    @Override
    public List<ServiceType> selectAllServiceType() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("service_type_id");
                String serviceTypeName = rs.getString("service_type_name");
                serviceTypeList.add(new ServiceType(id, serviceTypeName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return serviceTypeList;
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

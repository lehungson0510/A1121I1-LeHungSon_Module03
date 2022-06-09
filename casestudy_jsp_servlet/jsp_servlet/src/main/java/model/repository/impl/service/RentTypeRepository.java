package model.repository.impl.service;

import model.bean.RentType;
import model.repository.BaseRepository;
import model.repository.iservice.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private static final String SELECT_ALL_RENT_TYPE = "select * from rent_type";

    @Override
    public List<RentType> selectAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("rent_type_id");
                String rentTypeName = rs.getString("rent_type_name");
                double rentTypeCost = rs.getDouble("rent_type_cost");
                rentTypeList.add(new RentType(id, rentTypeName,rentTypeCost));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rentTypeList;
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

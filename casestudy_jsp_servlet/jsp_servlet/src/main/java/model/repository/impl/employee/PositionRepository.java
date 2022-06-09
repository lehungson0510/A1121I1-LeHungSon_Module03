package model.repository.impl.employee;

import model.bean.EducationDegree;
import model.bean.Position;
import model.repository.BaseRepository;
import model.repository.iemployee.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository  implements IPositionRepository {
    private static final String SELECT_ALL_POSITION = "select * from position";

    @Override
    public List<Position> selectAllPosition() {
        List<Position> positionList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("position_id");
                String name = rs.getString("position_name");
                positionList.add(new Position(id, name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return positionList;
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

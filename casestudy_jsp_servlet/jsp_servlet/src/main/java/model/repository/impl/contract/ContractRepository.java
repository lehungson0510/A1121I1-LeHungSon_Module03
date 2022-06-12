package model.repository.impl.contract;

import model.bean.Contract;
import model.bean.Customer;
import model.bean.Service;
import model.repository.BaseRepository;
import model.repository.icontract.IContractRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL_CONTRACT = "select * from contract";
    private static final String INSERT_CONTRACT_SQL = "insert into contract(contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id,customer_id,service_id) values (?,?,?,?,?,?,?);";



    @Override
    public List<Contract> selectAllContract() {
        List<Contract> contractList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("contract_id");
                String startDate = rs.getString("contract_start_date");
                String endDate = rs.getString("contract_end_date");
                double deposit = rs.getDouble("contract_deposit");
                double totalMoney = rs.getDouble("contract_total_money");
                int employeeId = rs.getInt("employee_id");
                int customerId = rs.getInt("customer_id");
                int serviceId = rs.getInt("service_id");
                contractList.add(new Contract(id,startDate,endDate,deposit,totalMoney,employeeId,customerId,serviceId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return contractList;
    }

    @Override
    public boolean insertContract(Contract contract) throws SQLException {
        try (Connection connection = BaseRepository.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT_SQL)) {
            preparedStatement.setString(1, contract.getContractStartDate());
            preparedStatement.setString(2, contract.getContractEndDate());
            preparedStatement.setDouble(3, contract.getContractDeposit());
            preparedStatement.setDouble(4, contract.getContractTotalMoney());
            preparedStatement.setInt(5, contract.getEmployeeId());
            preparedStatement.setInt(6, contract.getCustomerId());
            preparedStatement.setInt(7, contract.getServiceId());
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
    public Customer selectContract(int id) {
        return null;
    }

    @Override
    public boolean updateContract(Contract contract) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteContract(int id) throws SQLException {
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

package model.service.icontract;

import model.bean.Contract;
import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IContractService {
    List<Contract> selectAllContract();

    public Map<String,String> insertContract(Contract contract) throws SQLException;

    public Customer selectContract(int id);

    public boolean updateContract(Contract contract) throws SQLException;

    public boolean deleteContract(int id) throws SQLException;
}

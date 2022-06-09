package model.repository.impl.contract;

import model.bean.Contract;
import model.bean.Customer;
import model.repository.icontract.IContractRepository;

import java.sql.SQLException;
import java.util.List;

public class ContractRepository implements IContractRepository {

    @Override
    public List<Contract> selectAllContract() {
        return null;
    }

    @Override
    public boolean insertContract(Contract contract) throws SQLException {
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
}

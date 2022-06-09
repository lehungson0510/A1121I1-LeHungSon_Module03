package model.service.impl.contract;

import model.bean.Contract;
import model.bean.Customer;
import model.repository.icontract.IContractRepository;
import model.repository.impl.contract.ContractRepository;
import model.service.icontract.IContractService;

import java.sql.SQLException;
import java.util.List;

public class ContractService implements IContractService {
    public IContractRepository contractRepository = new ContractRepository();

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

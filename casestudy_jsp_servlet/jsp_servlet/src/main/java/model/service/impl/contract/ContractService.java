package model.service.impl.contract;

import common.Validation;
import model.bean.Contract;
import model.bean.Customer;
import model.repository.icontract.IContractRepository;
import model.repository.impl.contract.ContractRepository;
import model.service.icontract.IContractService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractService implements IContractService {
    public IContractRepository contractRepository = new ContractRepository();

    @Override
    public List<Contract> selectAllContract() {
        return contractRepository.selectAllContract();
    }

    @Override
    public Map<String,String> insertContract(Contract contract) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!Validation.checkNumber((float) contract.getContractDeposit())) {
            map.put("deposit", "Số tiền đặt cọc phải > 0");
        }
        if (!Validation.checkNumber((float) contract.getContractTotalMoney())) {
            map.put("totalMoney", "Tổng tiền phải > 0");
        }
//        if (!Validation.checkDate(contract.getContractStartDate())){
//            map.put("startDate","Thời gian không đúng định dạng");
//        }
//        if (!Validation.checkDate(contract.getContractEndDate())){
//            map.put("endDate","Thời gian không đúng định dạng");
//        }
        if (map.isEmpty()) {
            contractRepository.insertContract(contract);
        }
        return map;
    }

    @Override
    public Customer selectContract(int id) {
        return contractRepository.selectContract(id);
    }

    @Override
    public boolean updateContract(Contract contract) throws SQLException {
        return contractRepository.updateContract(contract);
    }

    @Override
    public boolean deleteContract(int id) throws SQLException {
        return contractRepository.deleteContract(id);
    }
}

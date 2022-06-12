package model.service.impl.service;

import common.Validation;
import model.bean.Service;
import model.repository.iservice.IServiceRepository;
import model.repository.impl.service.ServiceRepository;
import model.service.iservice.IServiceService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceService implements IServiceService {
    public IServiceRepository serviceRepository = new ServiceRepository();
    @Override
    public List<Service> selectAllService() {
        return serviceRepository.selectAllService();
    }

    @Override
    public Map<String, String> insertService(Service service) throws SQLException {

        Map<String, String> map = new HashMap<>();
        if (!Validation.checkNumber(service.getNumberOfFloors())) {
            map.put("floors", "Số tầng phải là số nguyên dương");
        }
        if (!Validation.checkNumber((float) service.getServiceCost())) {
            map.put("cost", "Giá phải > 0");
        }

//        if (!Validation.checkDate(customer.getCustomerBirthday())){
//            map.put("birthday","Ngày sinh không đúng định dạng");
//        }
        if (map.isEmpty()) {
            serviceRepository.insertService(service);
        }
        return map;
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
}

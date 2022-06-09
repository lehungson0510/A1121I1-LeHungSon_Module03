package model.service.impl.service;

import model.bean.Service;
import model.repository.iservice.IServiceRepository;
import model.repository.impl.service.ServiceRepository;
import model.service.iservice.IServiceService;

import java.sql.SQLException;
import java.util.List;

public class ServiceService implements IServiceService {
    public IServiceRepository serviceRepository = new ServiceRepository();
    @Override
    public List<Service> selectAllService() {
        return serviceRepository.selectAllService();
    }

    @Override
    public boolean insertService(Service service) throws SQLException {
        return serviceRepository.insertService(service);
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

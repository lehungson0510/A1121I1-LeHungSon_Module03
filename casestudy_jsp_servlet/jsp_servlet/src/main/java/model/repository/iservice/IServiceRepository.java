package model.repository.iservice;

import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface IServiceRepository {
    List<Service> selectAllService();

    public boolean insertService(Service service) throws SQLException;

    public Service selectService(int id);

    public boolean updateService(Service service) throws SQLException;

    public boolean deleteService(int id) throws SQLException;
}

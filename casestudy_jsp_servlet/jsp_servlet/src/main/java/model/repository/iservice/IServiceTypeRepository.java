package model.repository.iservice;

import model.bean.ServiceType;

import java.util.List;

public interface IServiceTypeRepository {
    List<ServiceType> selectAllServiceType();
}

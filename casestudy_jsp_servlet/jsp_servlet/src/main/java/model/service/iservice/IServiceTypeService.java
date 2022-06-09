package model.service.iservice;

import model.bean.ServiceType;

import java.util.List;

public interface IServiceTypeService {
    List<ServiceType> selectAllServiceType();
}

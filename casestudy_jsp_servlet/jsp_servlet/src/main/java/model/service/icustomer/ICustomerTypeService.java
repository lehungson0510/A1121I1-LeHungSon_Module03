package model.service.icustomer;

import model.bean.CustomerType;

import java.util.List;

public interface ICustomerTypeService {
    List<CustomerType> selectAllCustomerType();
}

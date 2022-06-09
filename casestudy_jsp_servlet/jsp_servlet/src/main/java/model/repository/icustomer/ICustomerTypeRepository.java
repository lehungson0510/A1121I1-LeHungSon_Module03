package model.repository.icustomer;

import model.bean.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> selectAllCustomerType();
}

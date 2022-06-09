package model.repository.iservice;

import model.bean.RentType;

import java.util.List;

public interface IRentTypeRepository {
        List<RentType> selectAllRentType();
}

package model.service.impl.service;

import model.bean.RentType;
import model.repository.iservice.IRentTypeRepository;
import model.repository.impl.service.RentTypeRepository;
import model.service.iservice.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> selectAllRentType() {
        return rentTypeRepository.selectAllRentType();
    }
}

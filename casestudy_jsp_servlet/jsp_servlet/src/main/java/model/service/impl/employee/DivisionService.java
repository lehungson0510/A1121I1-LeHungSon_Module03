package model.service.impl.employee;

import model.bean.Division;
import model.repository.iemployee.IDivisionRepository;
import model.repository.impl.employee.DivisionRepository;
import model.service.iemployee.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> selectAllDivision() {
        return divisionRepository.selectAllDivision();
    }
}

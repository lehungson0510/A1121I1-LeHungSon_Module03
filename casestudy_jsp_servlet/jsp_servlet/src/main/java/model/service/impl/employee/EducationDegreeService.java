package model.service.impl.employee;

import model.bean.EducationDegree;
import model.repository.iemployee.IEducationDegreeRepository;
import model.repository.impl.employee.EducationDegreeRepository;
import model.service.iemployee.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        return educationDegreeRepository.selectAllEducationDegree();
    }
}

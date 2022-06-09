package model.repository.iemployee;

import model.bean.EducationDegree;

import java.util.List;

public interface IEducationDegreeRepository {
    List<EducationDegree> selectAllEducationDegree ();
}

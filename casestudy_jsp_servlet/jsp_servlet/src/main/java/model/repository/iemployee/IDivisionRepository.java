package model.repository.iemployee;

import model.bean.Division;

import java.util.List;

public interface IDivisionRepository {
    List<Division> selectAllDivision();
}

package model.service.impl.employee;

import model.bean.Position;
import model.repository.iemployee.IPositionRepository;
import model.repository.impl.employee.PositionRepository;
import model.service.iemployee.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    IPositionRepository positionRepository = new PositionRepository();
    @Override
    public List<Position> selectAllPosition() {
        return positionRepository.selectAllPosition();
    }
}

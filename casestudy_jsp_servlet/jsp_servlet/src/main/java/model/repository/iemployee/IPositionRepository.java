package model.repository.iemployee;

import model.bean.Position;

import java.util.List;

public interface IPositionRepository {
    List<Position> selectAllPosition();
}

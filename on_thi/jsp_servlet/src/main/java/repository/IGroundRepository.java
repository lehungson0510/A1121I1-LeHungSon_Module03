package repository;

import model.Ground;
import model.Status;
import model.TypeOffice;

import java.sql.SQLException;
import java.util.List;

public interface IGroundRepository {
    List<TypeOffice> selectAllTypeOffice();

    List<Status> selectAllStatus();

    List<Ground> selectAllGround();

    public boolean insertGround(Ground ground) throws SQLException;

    public Ground selectGround(String id);

    public boolean updateGround(Ground ground) throws SQLException;

    public boolean deleteGround(String id) throws SQLException;

    public List<Ground> search(String typeOffice, String floors, String price);

    public List<Integer> listFloors ();
}

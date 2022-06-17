package service;

import model.Ground;
import model.Status;
import model.TypeOffice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IGroundService {
    List<TypeOffice> selectAllTypeOffice();

    List<Status> selectAllStatus();

    List<Ground> selectAllGround();

    public Map<String , String> insertGround(Ground ground) throws SQLException;

    public Ground selectGround(String id);

    public Map<String , String> updateGround(Ground ground) throws SQLException;

    public boolean deleteGround(String id) throws SQLException;

    public List<Ground> search(String typeOffice, String floors, String price);

    public List<Integer> listFloors ();
}


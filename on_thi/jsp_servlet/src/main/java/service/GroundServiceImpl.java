package service;

import common.Validation;
import model.Ground;
import model.Status;
import model.TypeOffice;
import repository.GroundRepositoryImpl;
import repository.IGroundRepository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GroundServiceImpl implements IGroundService{
    IGroundRepository groundRepository = new GroundRepositoryImpl();
    @Override
    public List<TypeOffice> selectAllTypeOffice() {
        return groundRepository.selectAllTypeOffice();
    }

    @Override
    public List<Status> selectAllStatus() {
        return groundRepository.selectAllStatus();
    }

    @Override
    public List<Ground> selectAllGround() {
        return groundRepository.selectAllGround();
    }

    @Override
    public Map<String , String> insertGround(Ground ground) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!Validation.checkIdGround(ground.getId())){
            map.put("id","Mã mặt bẳng không đúng định dạng");
        }

        if (ground.getArea() <= 20){
            map.put("area","Diện tích phải lớn hơn 20");
        }

        if (ground.getRentalPrice() <= 1000000){
            map.put("rentalPrice","Giá tiền phải lớn hơn 1000000");
        }

        if (!Validation.existsId(ground.getId())){
            map.put("id","Mã mặt bẳng đã tồn tại");
        }
//
        if (!Validation.differentDate(ground.getStartDate(),ground.getEndDate())){
            map.put("date","Ngày kết thúc phải lơn hơn ngày bắt đầu 6 tháng");
        }

        if (map.isEmpty()){
            groundRepository.insertGround(ground);
        }
        return map;
    }

    @Override
    public Ground selectGround(String id) {
        return groundRepository.selectGround(id);
    }

    @Override
    public Map<String , String> updateGround(Ground ground) throws SQLException {
        Map<String, String> map = new HashMap<>();
        List<Ground> groundList = new ArrayList<>();
        if (!Validation.checkIdGround(ground.getId())){
            map.put("id","Mã mặt bẳng không đúng định dạng");
        }

        if (ground.getArea() <= 20){
            map.put("area","Diện tích phải lớn hơn 20");
        }

        if (ground.getRentalPrice() <= 1000000){
            map.put("rentalPrice","Giá tiền phải lớn hơn 1000000");
        }
//
        if (!Validation.differentDate(ground.getStartDate(),ground.getEndDate())){
            map.put("date","Ngày kết thúc phải lơn hơn ngày bắt đầu 6 tháng");
        }

        if (map.isEmpty()){
            groundRepository.updateGround(ground);
        }
        return map;
    }

    @Override
    public boolean deleteGround(String id) throws SQLException {
        return groundRepository.deleteGround(id);
    }

    @Override
    public List<Ground> search(String typeOffice, String floors, String price) {
        return groundRepository.search(typeOffice,floors,price);
    }

    public List<Integer> listFloors (){
         return groundRepository.listFloors();
    }
}

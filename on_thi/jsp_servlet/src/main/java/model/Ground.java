package model;

public class Ground {
    private String id;
    private double area;
    private int statusId;
    private int floors;
    private int typeOfficeId;
    private String description;
    private double rentalPrice;
    private String startDate;
    private String endDate;

    public Ground() {
    }

    public Ground(String id, double area, int statusId, int floors, int typeOfficeId, String description, double rentalPrice, String startDate, String endDate) {
        this.id = id;
        this.area = area;
        this.statusId = statusId;
        this.floors = floors;
        this.typeOfficeId = typeOfficeId;
        this.description = description;
        this.rentalPrice = rentalPrice;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getFloors() {
        return floors;
    }

    public void setFloors(int floors) {
        this.floors = floors;
    }

    public int getTypeOfficeId() {
        return typeOfficeId;
    }

    public void setTypeOfficeId(int typeOfficeId) {
        this.typeOfficeId = typeOfficeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRentalPrice() {
        return rentalPrice;
    }

    public void setRentalPrice(double rentalPrice) {
        this.rentalPrice = rentalPrice;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}

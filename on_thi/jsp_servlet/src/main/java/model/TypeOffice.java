package model;

public class TypeOffice {
    private int typeOfficeId;
    private String name;

    public TypeOffice() {
    }

    public TypeOffice(int typeOfficeId, String name) {
        this.typeOfficeId = typeOfficeId;
        this.name = name;
    }

    public int getTypeOfficeId() {
        return typeOfficeId;
    }

    public void setTypeOfficeId(int typeOfficeId) {
        this.typeOfficeId = typeOfficeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

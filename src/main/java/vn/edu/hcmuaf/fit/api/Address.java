package vn.edu.hcmuaf.fit.api;

public class Address {
    private int provinceID;
    private String provinceName;
    private int districtID;
    private String districtName;
    private String wardCode;
    private String wardName;
    public Address(int provinceID, String provinceName) {
        this.provinceID = provinceID;
        this.provinceName = provinceName;
    }

    public Address(int provinceID, int districtID, String districtName) {
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.districtName = districtName;
    }
    public Address(String wardCode, int districtID, String wardName) {
        this.wardCode = wardCode;
        this.districtID = districtID;
        this.wardName = wardName;
    }

    public Address() {
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getWardCode() {
        return wardCode;
    }

    public void setWardCode(String wardCode) {
        this.wardCode = wardCode;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    @Override
    public String toString() {
        return "Address{" +
                "provinceID=" + provinceID +
                ", provinceName='" + provinceName + '\'' +
                ", districtID=" + districtID +
                ", districtName='" + districtName + '\'' +
                ", wardCode='" + wardCode + '\'' +
                ", wardName='" + wardName + '\'' +
                '}';
    }
}

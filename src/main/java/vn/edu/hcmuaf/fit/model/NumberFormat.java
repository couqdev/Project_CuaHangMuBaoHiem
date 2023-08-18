package vn.edu.hcmuaf.fit.model;

public class NumberFormat {
    public String numberFormat (long price) {
        StringBuilder sb = new StringBuilder("" + price);
        int lin = price < 0? 1:0;
        for (int index = sb.length() -3;index > lin;index-= 3) {
            sb.insert(index, ".");
        }
        return sb.toString();
    }
    public NumberFormat(){
    }
}

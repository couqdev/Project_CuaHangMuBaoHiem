package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.service.ProductService;

import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String, Product> cart;
    private Customer customer;
    private long total;
    private int quantity;

    public Cart() {
        this.cart = new HashMap<String,Product>();
        this.customer = new Customer();
        this.total = 0;
        this.quantity = 0;
    }
public void put(Product p){
    if(cart.containsKey(p.getKey())){
        Product p1 = cart.get(p.getKey());
        p1.setQuantity(p1.getQuantity()+1);
        cart.put(p.getKey(),p1);
    }else{
        cart.put(p.getKey(), p);
    }
    total+= (long) (p.getPrice()-p.getPrice()*p.getDiscount());
    quantity++;
}
    public void putQuantity(Product p){
        if(cart.containsKey(p.getKey())){
            Product p1 = cart.get(p.getKey());
            p1.setQuantity(p1.getQuantity()+p.getQuantity());
            cart.put(p.getKey(),p1);
        }else{
            cart.put(p.getKey(), p);
        }
        total+=(long) ((p.getPrice()-p.getPrice()*p.getDiscount())*p.getQuantity());
        quantity+=p.getQuantity();
    }
    public void updateTotalMoneyQuantity(){
        total =0;
        quantity = 0;
        for(Product p : cart.values()){
            total += p.getQuantity()*((long)(p.getPrice()-p.getPrice()*p.getDiscount()));
            quantity += p.getQuantity();
        }
    }
    public Collection<Product> getListProduct() {
        Collection<Product> list = cart.values();
        return list;
    }
    public int getQuanlity(){
        return this.quantity;
    }
    public long getTotal(){
        return this.total;
    }
    public void remove(String key){
        cart.remove(key);
        updateTotalMoneyQuantity();
    }
    public void update(Product p){
        if(cart.containsKey(p.getKey())){
            cart.put(p.getKey(), p);
        }
        updateTotalMoneyQuantity();
    }
    public void minus(String id){
        Product p1 = this.cart.get(id);
        if(p1.getQuantity()==1){
            remove(id);
        }else {
            p1.setQuantity(p1.getQuantity() - 1);
            cart.put(id, p1);
        }
        updateTotalMoneyQuantity();
    }
    public int getQuantityProduct(String id){
        int quantity = 0;
        try{
            quantity =  cart.get(id).getQuantity();
        }catch (Exception e){
            quantity = 0;
        }
        return quantity;
    }
    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cart=" + cart +
                '}';
    }


    public void setTotal(long total) {
        this.total = total;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public static void main(String[] args) throws SQLException {
        Product p = ProductService.getDetailProduct(1,"M","đỏ");
        Cart c = new Cart();
        p.setQuantity(1);
        c.put(p);
        p.setQuantity(2);
        c.put(p);
        c.put(p);
        System.out.println(c.getQuantityProduct("1dp"));
    }

}

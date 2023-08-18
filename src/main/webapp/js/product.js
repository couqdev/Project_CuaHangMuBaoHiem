function check(){
    var name = addProduct.name.value;
    var price = addProduct.price.value;
    var brand = addProduct.brand.value;
    var type = addProduct.type.value;
    var discount = addProduct.discount.value;
    var decrispe = addProduct.decrispe.value;
    if(name==""){
        document.getElementById("warning_name").innerHTML = "Vui lòng nhập tên";
    }
    if(price==""){
        document.getElementById("warning_price").innerHTML = "Vui lòng nhập giá";
    }
    if(brand==""){
        document.getElementById("warning_brand").innerHTML = "Vui lòng nhập thương hiệu";
    }
    if(type==""){
        document.getElementById("warning_type").innerHTML = "Vui lòng chọn 1";
    }
    if(discount==""){
        document.getElementById("warning_discount").innerHTML = "Vui lòng nhập chiết khấu";
    }
    if(decrispe==""){
        document.getElementById("warning_decrispe").innerHTML = "Vui lòng nhập thông tin sản phẩm";
    }
    if(name!=""){
        document.getElementById("warning_name").innerHTML = "";
    }
    if(price!=""){
        document.getElementById("warning_price").innerHTML = "";
    }
    if(brand!=""){
        document.getElementById("warning_brand").innerHTML = "";
    }
    if(type!=""){
        document.getElementById("warning_type").innerHTML = "";
    }
    if(discount!=""){
        document.getElementById("warning_discount").innerHTML = "";
    }
    if(decrispe!=""){
        document.getElementById("warning_decrispe").innerHTML = "";
    }
}
function checkSCQ(){
    var size = addDetailProduct.size.value;
    var color = addDetailProduct.color.value;
    var quantity = addDetailProduct.quantity.value;

    if(size==""){
        document.getElementById("warning_size").innerHTML = "Vui lòng kích thước";
    }
    if(color==""){
        document.getElementById("warning_color").innerHTML = "Vui lòng nhập màu sắc";
    }
    if(quantity==""){
        document.getElementById("warning_quantity").innerHTML = "Vui lòng nhập số lượng";
    }
    if(size!=""){
        document.getElementById("warning_size").innerHTML = "";
    }
    if(color!=""){
        document.getElementById("warning_color").innerHTML = "";
    }
    if(quantity!=""){
        document.getElementById("warning_quantity").innerHTML = "";
    }
}
window.addEventListener("onclick",function(){
    check()
    checkSCQ()
})
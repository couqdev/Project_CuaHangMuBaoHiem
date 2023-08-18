function addDetail(quantity) {
    var result = "Số lượng còn lại: " + quantity;

    document.getElementById("color1234").innerHTML = result;

}
function addDetail(quantity) {

}
function check() {
    var check1 = size.size.value;
    var check2 = size.color.value;
    if (check1 == "" && check2 == "") {
        document.getElementById("color1234").innerHTML = "Chọn kích thước và màu sắc";
    } else {
        if (check1 == "") {
            document.getElementById("color1234").innerHTML = "Chọn kích thước";
        } else {
            if (check2 == "") {
                document.getElementById("color1234").innerHTML = "Chọn màu sắc";
            }

        }
    }


}

window.addEventListener("onclick", function () {
    check()
})
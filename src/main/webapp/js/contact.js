function check(){
    var name = ct.name.value;
    var email = ct.email.value;
    var subject = ct.subject.value;
    var content = ct.content.value;
var checkemail1 = email.slice(-10);
var checkemail2 = email.slice(-17);
var checkemail3 = email.slice(-14);
    if(name==""){
    document.getElementById("alertname").innerHTML = "Vui lòng nhập tên";
    }
    if(subject==""){
        document.getElementById("alertsubject").innerHTML = "Vui lòng nhập tiêu đề";
    }
    if(content==""){
        document.getElementById("alertcontent").innerHTML = "Vui lòng nhập nội dung";
    }
    if(email==""){
        document.getElementById("alertemail").innerHTML = "Vui lòng nhập email";
    }else{
        if(checkemail1!="@gmail.com" || checkemail2!="@st.hcmuaf.edu.vn" || checkemail3!="@hcmuaf.edu.vn"){
            document.getElementById("alertemail").innerHTML = "Email không đúng";
        }
        if(checkemail1=="@gmail.com" || checkemail2=="@st.hcmuaf.edu.vn" || checkemail3=="@hcmuaf.edu.vn"){
            document.getElementById("alertemail").innerHTML = "";
        }
    }

    if(name!=""){
        document.getElementById("alertname").innerHTML = "";
    }
    if(subject!=""){
        document.getElementById("alertsubject").innerHTML = "";
    }
    if(content!=""){
        document.getElementById("alertcontent").innerHTML = "";
    }
}
window.addEventListener("onclick",function(){
    check()
})
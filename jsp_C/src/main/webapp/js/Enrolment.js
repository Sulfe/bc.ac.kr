function filter(){

    var value, name, item, i;

    value = document.getElementById("value").value.toUpperCase();
    item = document.getElementsByClassName("item_s");
    code = document.getElementsByClassName("item_s");

    for(i=0;i<item.length;i++){
      name = item[i].getElementsByClassName("code_s");
      code = item[i].getElementsByClassName("name_s");
      if(name[0].innerHTML.toUpperCase().indexOf(value) > -1 || code[0].innerHTML.toUpperCase().indexOf(value) > -1 ){
        item[i].style.display = "flex";
      }else{
        item[i].style.display = "none";
      }
    }
}

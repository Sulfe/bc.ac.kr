window.onload = function() {
 
    function onClick() {  //onClick을 보이게 해주는 함수를 생성하였습니다
        document.querySelector('.pop_wrap').style.display ='block';
        document.querySelector('.backbg').style.display ='block';
    }   
    function offClick() {  //offClick을 안보이게 해주는 함수를 생성하였습니다
        document.querySelector('.pop_wrap').style.display ='none';
        document.querySelector('.backbg').style.display ='none';
    }
 
    document.getElementById('pop_link').addEventListener('click', onClick);
    document.querySelector('.pop_close').addEventListener('click', offClick);
    //닫는 링크를 클릭시 팝업창이 닫혀집니다.
};

function agree() { 
    var chkbox = document.getElementsByName('agree'); 
    var chk = false; 
    for(var i=0 ; i<chkbox.length ; i++) { 
        if(chkbox[i].checked) { 
            chk = true; } 
        else { 
            chk = false; } } 
        if(chk) { 
            alert("등록되었습니다.");
            location.reload(); 
        return false; 
        } 
        else { 
            alert("확인란에 체크해주세요.") 
        } 
    } 

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
};


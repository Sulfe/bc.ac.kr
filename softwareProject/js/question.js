$('#q_type').change(onSelectChange) //select  id를 이용하여 셀렉트 변경시마다 onSelectChange함수 실행
$(this)

function onSelectChange() {
  var selected = $('.q_type option:selected')
  var output = ''

  if (selected.val() == 00) {
    output = ''
    $('.q_selDel').hide()
    $('.q_selAdd').hide()
  } else if (selected.val() == 01) {
    output =
      '<input id="q_essay" type="text" placeholder="텍스트 입력" readonly />'
    $('.q_selDel').hide()
    $('.q_selAdd').hide()
  } else if (selected.val() == 02) {
    output =
      '<div class="q_sel"> <input class="q_select" type="radio" readonly /><input class="q_selOption" type="text" placeholder="옵션" /></div>'
    $('.q_selDel').show()
    $('.q_selAdd').show()
    $('.q_selDel').attr('onclick', 'selDelBtn();')
    $('.q_selAdd').attr('onclick', 'selAddBtn();')
  } else {
    output =
      '<div class="q_che"> <input type="checkbox" class="q_check" readonly /><input type="text" class="q_cheOption" placeholder="옵션" /></div>'
    $('.q_selDel').show()
    $('.q_selAdd').show()
    $('.q_selDel').attr('onclick', 'cheDelBtn();')
    $('.q_selAdd').attr('onclick', 'cheAddBtn();')
  }

  $('#q_output').html(output) //div에 output 변수에 담은 text HTML로 출력하기//
}

var sel =
  '<div class="q_sel"><input class="q_select" type="radio" readonly /><input class="q_selOption" type="text" placeholder="옵션" /></div>'
var check =
  '<div class="q_che"> <input type="checkbox" class="q_check" readonly /><input type="text" class="q_cheOption" placeholder="옵션" /></div>'

function selAddBtn() {
  $('.q_output').append(sel)
}

function selDelBtn() {
  $('.q_output').html(sel)
}

function cheAddBtn() {
  $('.q_output').append(check)
}

function cheDelBtn() {
  $('.q_output').html(check)
}

var addQuestionDiv =
  ' <div class="quest"><div class="q_title"><input type="text" placeholder="질문 제목" /><select class="q_type" id="q_type"><option value="00">질문 유형</option><option value="01">주관식</option><option value="02">객관식</option><option value="03">체크박스</option></select></div><div class="q_output" id="q_output"></div><div class="q_btn"><button type="button" id="q_selDel" onclick="selDelBtn()"><i class="bx bx-x"></i></button><button type="button" id="q_selAdd" onclick="selAddBtn()"><i class="bx bx-plus"></i></button><button type="button" id="q_del" ><i class="bx bx-trash"></i></button></div></div>'
function addQuestion() {
  $('#main').append(addQuestionDiv)
}

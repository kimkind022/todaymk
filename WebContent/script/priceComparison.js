$.support.cors = true;

let itemGroup = new Map();
let priceGroup;

$(document).ready(function() {
  itemGroupSetting();
  dateSetting();
  
  $(document).on('change', 'select[name=p_itemcategorycode]', function() {
    let category = $(this).find('option:selected').val();

    $('select[name=p_itemcode]').html("<option value=all>선택</option>");

    itemGroup.forEach(function(item, index) {
      if (category == item.p_itemcategorycode) {
        $('select[name=p_itemcode]').append("<option value=" + item.p_itemcode + ">" + item.p_itemname + "</option>");
      }
    });

  });
  
  $('.dateButton').click(function(){
    let endDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000);
    endDate = endDate.toISOString().slice(0, 10);
    $('input[name=p_endday]').val(endDate);
    
    let startDate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000);
    if ($(this).attr('name') == 'oneMonth') {
      startDate.setMonth(startDate.getMonth() - 1);
    } else if ($(this).attr('name') == 'threeMonth') {
      startDate.setMonth(startDate.getMonth() - 3);
    } else if ($(this).attr('name') == 'sixMonth') {
      startDate.setMonth(startDate.getMonth() - 6);
    } else if ($(this).attr('name') == 'oneYear') {
      startDate.setFullYear(startDate.getFullYear() - 1);
    }  
    startDate = startDate.toISOString().slice(0, 10); 
    $('input[name=p_startday]').val(startDate);
    
  });
  
  $(document).on('change','input[name=p_endday]',function(){
    let startday = new Date($('input[name=p_startday]').val());
    let endDate = new Date($('input[name=p_endday]').val());
    
    if (startday > endDate) {
      $('input[name=p_startday]').val($(this).val());
    }
    $('input[name=p_startday]').attr("max", $(this).val());
  });
  
  $(document).on('click','input[name=priceSearch]',function(){
    let p_itemcode =  $('select[name=p_itemcode]').val();
    
    if (itemGroup.get(p_itemcode) == null) {
      alert("검색 할 상품을 확인해주세요");
    } else {
      let item = itemGroup.get(p_itemcode);
      let startDay = $('input[name=p_startday]').val();
      let endday = $('input[name=p_endday]').val();
      
      $.ajax({
        url : "https://www.kamis.or.kr/service/price/xml.do",
        type : 'get',
        data : {
          "action" : "periodProductList",
          "p_cert_key" : "98492044-a9fc-4e2a-b3cf-d7c5fa552ffc",
          "p_cert_id" : "2864",
          "p_returntype" : "json",
          "p_productclscode" : "01",
          "p_productrankcode" : "04",
          "p_countrycode" : "1101",
          "p_convert_kg_yn" : "y",
          
          "p_itemcategorycode" : item.p_itemcategorycode,
          "p_itemcode" : item.p_itemcode,
          "p_kindcode" : item.p_kindcode,
          "p_startday" : startDay,
          "p_endday" : endday
        },
        async : false,
        dataType : 'jsonp',
        success : function(response) {
          console.log(response);
          
          /*priceGroup = new Map();
          $.each(data, function(index, item) {
            alert(item.yyyy+"/"+item);
            priceGroup.set(item.yyyy+"/"+item.regday, item);
          });*/
        },
        error : function() {
          alert("error");
        }
      });
    }
  });

});


function itemGroupSetting(){
$.ajax({
    url : "selectItemCodeList.fd",
    type : 'post',
    dataType : 'json',
    success : function(data) {
      $.each(data, function(index, item) {
        itemGroup.set(item.p_itemcode, item);
      });
    },
    error : function() {
      alert("error");
    }
  });
}

function dateSetting(){
  let minDateValue = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000);
  minDateValue.setFullYear(minDateValue.getFullYear() - 1);
  minDateValue = minDateValue.toISOString().slice(0, 10);
  
  let maxDateValue = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000);
  maxDateValue = maxDateValue.toISOString().slice(0, 10);
  
  $('input[type=date]').val(maxDateValue);
  $('input[type=date]').attr("max", maxDateValue);
  $('input[type=date]').attr("min", minDateValue);
  
}


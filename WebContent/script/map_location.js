$.support.cors = true;

$(function(){
	$.ajax({
		type: "get",
		url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
		async: false,
		dataType: 'jsonp',
		success: function(data) {
			let html = "<option>선택</option>";

			data.response.result.featureCollection.features.forEach(function(f){
				console.log(f.properties)
				let 행정구역코드 = f.properties.ctprvn_cd;
				let 행정구역명 = f.properties.ctp_kor_nm;
				
				html +=`<option value="${행정구역코드}">${행정구역명}</option>`
				
			})
			
            $('#sido_code').html(html);
			
		},
		error: function(xhr, stat, err) {}
	});
	
	
	$(document).on("change","#sido_code",function(){
		let thisVal = $(this).val();		

		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
			data : {attrfilter : 'sig_cd:like:'+thisVal},
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option>선택</option>";

				data.response.result.featureCollection.features.forEach(function(f){
					console.log(f.properties)
					let 행정구역코드 = f.properties.sig_cd;
					let 행정구역명 = f.properties.sig_kor_nm;
					
					html +=`<option value="${행정구역코드}">${행정구역명}</option>`
					
				})
	            $('#sigoon_code').html(html);
				
			},
			error: function(xhr, stat, err) {}
		});
	});
	
	$(document).on("change","#sigoon_code",function(){ 
		
		let thisVal = $(this).val();		

		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
			data : {attrfilter : 'emd_cd:like:'+thisVal},
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option>선택</option>";

				data.response.result.featureCollection.features.forEach(function(f){
					console.log(f.properties)
					let 행정구역코드 = f.properties.emd_cd;
					let 행정구역명 = f.properties.emd_kor_nm;
					html +=`<option value="${행정구역코드}">${행정구역명}</option>`
					
				})
	            $('#dong_code').html(html);
				
			},
			error: function(xhr, stat, err) {}
		});

	});

	// 읍면 코드로 검색
	$(document).on("change","#dong_code",function(){ 
		
		let thisVal = $(this).val();		

		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADRI_INFO",
			data : {attrfilter : 'li_cd:like:'+thisVal},
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option>선택</option>";

				data.response.result.featureCollection.features.forEach(function(f){
					console.log(f.properties)
					let 행정구역코드 = f.properties.li_cd;
					let 행정구역명 = f.properties.li_kor_nm;
					html +=`<option value="${행정구역코드}">${행정구역명}</option>`
					
				})
	            $('#lee_code').html(html);
				
			},
			error: function(xhr, stat, err) {}
		});

	});
});


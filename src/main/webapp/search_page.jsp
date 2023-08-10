<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/api/WNSearch.jsp" %>
<%
   /*
    * subject: 검색 메인 페이지
    * @original author: SearchTool
    */

   //실시간 검색어 화면 출력 여부 체크
   boolean isRealTimeKeyword = false;
   //오타 후 추천 검색어 화면 출력 여부 체크
   boolean useSuggestedQuery = true;
   String suggestQuery = "";

   //디버깅 보기 설정
   boolean isDebug = false;

   int TOTALVIEWCOUNT = 3;    //통합검색시 출력건수
   int COLLECTIONVIEWCOUNT = 10;    //더보기시 출력건수

String START_DATE = "1970.01.01";	// 기본 시작일

// 결과 시작 넘버
   int startCount = parseInt(getCheckReqXSS(request, "startCount", "0"), 0);	//시작 번호
   String query = getCheckReqXSS(request, "query", "");						//검색어
   String collection = getCheckReqXSS(request, "collection", "ALL");			//컬렉션이름
   String rt = getCheckReqXSS(request, "rt", "");								//결과내 재검색 체크필드
   String rt2 = getCheckReqXSS(request, "rt2", "");							//결과내 재검색 체크필드
   String reQuery = getCheckReqXSS(request, "reQuery", "");					//결과내 재검색 체크필드
   String realQuery = getCheckReqXSS(request, "realQuery", "");				//결과내 검색어
   String sort = getCheckReqXSS(request, "sort", "RANK");						//정렬필드
   String range = getCheckReqXSS(request, "range", "A");						//기간관련필드
   String startDate = getCheckReqXSS(request, "startDate", START_DATE);		//시작날짜
   String endDate = getCheckReqXSS(request, "endDate", getCurrentDate());		//끝날짜
   String writer = getCheckReqXSS(request, "writer", "");						//작성자
   String searchField = getCheckReqXSS(request, "searchField", "");			//검색필드
   String strOperation  = "" ;												//operation 조건 필드
   String exquery = "" ;													//exquery 조건 필드
   int totalCount = 0;

   String[] searchFields = null;

// 상세검색 검색 필드 설정이 되었을때
   if (!searchField.equals("")) {
	// 작성자
	if (!writer.equals("")) {
		exquery = "<WRITER:" + writer + ">";
	}
} else {
	searchField = "ALL";
}

   String[] collections = null;
   if(collection.equals("ALL")) { //통합검색인 경우
       collections = COLLECTIONS;
   } else {                        //개별검색인 경우
       collections = new String[] { collection };
   }

if (reQuery.equals("1")) {
	realQuery = query + " " + realQuery;
} else if (!reQuery.equals("2")) {
	realQuery = query;
}

   WNSearch wnsearch = new WNSearch(isDebug,false, collections, searchFields);

   int viewResultCount = COLLECTIONVIEWCOUNT;
   if ( collection.equals("ALL") ||  collection.equals("") )
       viewResultCount = TOTALVIEWCOUNT;

   for (int i = 0; i < collections.length; i++) {

       //출력건수
       wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount+","+viewResultCount);

       //검색어가 없으면 DATE_RANGE 로 전체 데이터 출력
       if (!query.equals("") ) {
             wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
       } else {
             wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, START_DATE.replaceAll("[.]","/") + ",2030/12/31,-");
             wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "RANK/DESC,DATE/DESC");
       }

       //searchField 값이 있으면 설정, 없으면 기본검색필드
       if (!searchField.equals("") && !searchField.equals("WRITER") && searchField.indexOf("ALL") == -1 ) {
		wnsearch.setCollectionInfoValue(collections[i], SEARCH_FIELD, searchField);
	}

       //operation 설정
       if (!strOperation.equals("")) {
		wnsearch.setCollectionInfoValue(collections[i], FILTER_OPERATION, strOperation);
	}

       //exquery 설정
       if (!exquery.equals("")) {
		wnsearch.setCollectionInfoValue(collections[i], EXQUERY_FIELD, exquery);
	}

       //기간 설정 , 날짜가 모두 있을때
       if (!startDate.equals("")  && !endDate.equals("") ) {
            wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, startDate.replaceAll("[.]","/") + "," + endDate.replaceAll("[.]","/") + ",-");
       }
   };

   wnsearch.search(realQuery, isRealTimeKeyword, CONNECTION_CLOSE, useSuggestedQuery);

    // 디버그 메시지 출력
   String debugMsg = wnsearch.printDebug() != null ? wnsearch.printDebug().trim() : "";
   if ( !debugMsg.trim().equals("")) {
        out.println(debugMsg);
   }

    // 전체건수 구하기
   if ( collection.equals("ALL") ) {
       for (int i = 0; i < collections.length; i++) {
          totalCount += wnsearch.getResultTotalCount(collections[i]);
       }
   } else {
     //개별건수 구하기
       totalCount = wnsearch.getResultTotalCount(collection);
   }

   String thisCollection = "";
   if(useSuggestedQuery) {
      suggestQuery = wnsearch.suggestedQuery;
   }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, viewport-fit=cover">
      <meta name="format-detection" content="telephone=no, address=no, email=no">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
      <title>한국과학기술연구원 eKIST 통합검색</title>
      
      <link rel="stylesheet" href="./css/ark.css">
      <link rel="stylesheet" href="./css/datepicker.css">
      <link rel="stylesheet" href="./css/search.css">
    
      <script type="text/javascript" src="./js/jquery-3.6.0.min.js"></script>
      <script type="text/javascript" src="./js/ark.js"></script>
      <script type="text/javascript" src="./js/ui.js"></script>
      <script type="text/javascript" src="./js/jquery-ui.js"></script>
      <script type="text/javascript" src="./js/search.js"></script>
</head>
<body>
<div id="wrap">
      <header id="header" class="search_header">
            <div class="header_contents">
                  <div class="search_option">
                        <!-- search_top -->
                        <div class="header_box inner">
                              <h1 class="logo_wrap">
                                    <a href="search_00.html">
                                          <img src="images/img_logo.png" alt="한국과학기술연구원 eKIST" class="logo">
                                    </a>
                              </h1>
                              <div class="search_input">
                                    <div class="input_wrap">
                                          <div class="input_box">
                                                <select class="search_select">
                                                    <option>통합검색</option>
                                                    <option>관련 메뉴</option>
                                                    <option>직원 검색</option>
                                                    <option>게시판</option>
                                                    <option>전자결재</option>
                                                    <option>두레이 위키</option>
                                                    <option>도움말 모음</option>
                                                    <option>규정</option>
                                                    <option>전자도서관</option>
                                                </select>

                                                <input type="text" name="query" id="query" value="" placeholder="검색어를 입력해주세요." title="검색어 입력" class="input_search">
                                                
                                                <button type="button" title="검색어 초기화" class="btn_reset sch_reset">검색어 초기화</button>
                                                <script>
                                                    var btnClear = document.querySelector('.sch_reset');
                                                    btnClear.addEventListener('click', function(){
                                                        btnClear.parentNode.querySelector('input').value = "";
                                                    })
                                                </script>

                                                <!-- 자동 검색어 -->
                                                <div id="ark" style="position:relative; z-index:555; top:0px; left:135px; width:330px; ">
                                                      <div id="ark_down" style="position: absolute; display:block; cursor:pointer; top:-22px; right:0px;">
                                                            <img id="ark_img_down" src="./images/arrow_auto.gif" alt="자동완성펼치기">
                                                      </div>
                                                      <div id="ark_up" style="position: absolute; display:none; cursor:pointer; top:-22px; right:0px;">
                                                            <img id="ark_img_up" src="./images/arrow_auto2.gif" alt="자동완성접기">
                                                      </div>
                                                      <div class="ark_wrap" id="ark_wrap" style="position:absolute; top:-0px; left:0px; width:328px;">
                                                            <ul>		
                                                                  <li class="ark_content">			
                                                                        <ul class="fl" id="ark_content_list" style="width:328px;"></ul>		
                                                                  </li>		
                                                                  <li class="ark_footer" id="ark_footer" style="width:328px;"></li>	
                                                            </ul>
                                                      </div>
                                                </div>
                                          </div>
                                          <button type="submit" class="btn_search"><img src="images/icon_search_white.png" title="검색" alt="검색"></button>
                                          <button type="button" class="btn_expand">상세검색</button>
                                    </div>
                              </div>
                              <div class="hs_tag">
                                    <ul class="hs_tag_list">
                                          <li><a href="#">#검색어가길어지면얼만큼길어질것인가</a></li>
                                          <li><a href="#">#검색어02</a></li>
                                          <li><a href="#">#검색어03</a></li>
                                          <li><a href="#">#검색어04</a></li>
                                          <li><a href="#">#검색어05</a></li>
                                          <li><a href="#">#검색어06</a></li>
                                          <li><a href="#">#검색어07</a></li>
                                          <li><a href="#">#검색어08</a></li>
                                          <li><a href="#">#검색어09</a></li>
                                          <li><a href="#">#검색어10</a></li>
                                    </ul>
                              </div>
                        </div>
                    
                        <!-- search_expand -->
                        <div class="option_wrap">
                              <div class="inner">
                                    <div class="option_area">
                                          <div class="l">
                                                <strong>검색기간</strong>
                                          </div>
                                          <div class="r">
                                                <div class="rd_lb_wrap">
                                                    <span class="rd_lb">
                                                        <input type="radio" id="rd1_1" name="option1" class="blind" checked="">
                                                        <label for="rd1_1">전체</label>
                                                    </span>
                                                </div>

                                                <div class="date_wrap">
                                                    <span class="rd_lb">
                                                          <input type="radio" id="rd1_2" name="option1" class="blind">
                                                          <label for="rd1_2">직접입력</label>
                                                    </span>
                                                    <span class="date_input">
                                                          <input type="text" class="st_date datepicker" title="시작일 입력" id="startDate" name="sDate">
                                                    </span>
                                                    <span class="date_char"> ~ </span>
                                                    <span class="date_input">
                                                          <input type="text" class="ed_date datepicker" title="종료일 입력"id="endDate" name="eDate">
                                                    </span>
                                                    <script>
                                                            $(".datepicker").datepicker({
                                                                 dateFormat: 'yy-mm-dd' //달력 날짜 형태
                                                                 ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                                                                 ,showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
                                                                 ,changeYear: true //option값 년 선택 가능
                                                                 ,changeMonth: true //option값  월 선택 가능                
                                                                 ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                                                                 ,buttonImage: "./images/icon_calendar.png" //버튼 이미지 경로
                                                                 ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
                                                                 ,buttonText: "선택" //버튼 호버 텍스트              
                                                                 ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                                                                 ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                                                                 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
                                                                 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
                                                                 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
                                                                 ,minDate: "-10Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                                                                 ,maxDate: "+10y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
                                                             });

                                                            $(function () {
                                                                  $('.datepicker').datepicker();
                                                            });
                                                          
                                                            //초기값을 오늘 날짜로 설정
                                                            $('#startDate').datepicker('setDate', '-1m'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                                                            $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                                                      </script>
                                                </div>
                                                <div class="rd_lb_wrap">
                                                    <span class="rd_lb_big">
                                                        <input type="radio" id="rd1_3" name="option1" class="blind">
                                                        <label for="rd1_3">3개월</label>
                                                    </span>
                                                    <span class="rd_lb_big">
                                                        <input type="radio" id="rd1_4" name="option1" class="blind">
                                                        <label for="rd1_4">6개월</label>
                                                    </span>
                                                    <span class="rd_lb_big">
                                                        <input type="radio" id="rd1_5" name="option1" class="blind">
                                                        <label for="rd1_5">1년</label>
                                                    </span>
                                                </div>
                                          </div>
                                    </div>
                                    <!--//검색기간-->

                                    <div class="option_area">
                                      <div class="l">
                                          <strong>검색방법</strong>
                                      </div>
                                      <div class="r">
                                          <div class="rd_lb_wrap">
                                              <span class="rd_lb">
                                                  <input type="radio" id="rd2_1" name="optionion2" class="blind" checked="">
                                                  <label for="rd2_1">결과 내 재검색(and)</label>
                                              </span>
                                              <span class="rd_lb">
                                                  <input type="radio" id="rd2_2" name="optionion2" class="blind">
                                                  <label for="rd2_2">하나라도 포함된 결과(or)</label>
                                              </span>
                                              <span class="rd_lb">
                                                  <input type="radio" id="rd2_3" name="optionion2" class="blind">
                                                  <label for="rd2_3">제외하는단어 </label>
                                              </span>
                                              <input type="text" class="date_inp">
                                          </div>
                                      </div>
                                    </div>
                                    <!--//검색방법-->

                                    <div class="option_area">
                                      <div class="l">
                                          <strong>검색범위</strong>
                                      </div>
                                      <div class="r">
                                          <div class="ck_lb_wrap">
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck1_1" name="optionion3" class="blind" checked="">
                                                  <label for="ck1_1">전체</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck1_2" name="optionion3" class="blind">
                                                  <label for="ck1_2">제목</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck1_3" name="optionion3" class="blind">
                                                  <label for="ck1_3">내용</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck1_4" name="optionion3" class="blind">
                                                  <label for="ck1_4">파일명</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck1_5" name="optionion3" class="blind">
                                                  <label for="ck1_5">파일내용</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck1_6" name="optionion3" class="blind">
                                                  <label for="ck1_6">작성자</label>
                                              </span>
                                          </div>
                                      </div>
                                    </div>
                                    <!--//검색범위-->

                                    <div class="option_area">
                                      <div class="l">
                                          <strong>파일유형</strong>
                                      </div>
                                      <div class="r">
                                          <div class="ck_lb_wrap">
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_1" name="optionion4" class="blind" checked="">
                                                  <label for="ck2_1">pdf</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_2" name="optionion4" class="blind">
                                                  <label for="ck2_2">hwp</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_3" name="optionion4" class="blind">
                                                  <label for="ck2_3">pptx</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_4" name="optionion4" class="blind">
                                                  <label for="ck2_4">jpg</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_5" name="optionion4" class="blind">
                                                  <label for="ck2_5">png</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_6" name="optionion4" class="blind">
                                                  <label for="ck2_6">word</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_7" name="optionion4" class="blind">
                                                  <label for="ck2_7">xlsx</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_8" name="optionion4" class="blind">
                                                  <label for="ck2_8">xls</label>
                                              </span>
                                              <span class="ck_lb">
                                                  <input type="checkbox" id="ck2_9" name="optionion4" class="blind">
                                                  <label for="ck2_9">zip</label>
                                              </span>
                                          </div>
                                      </div>
                                    </div>
                                    <!--//파일유형-->
                            
                                    <div class="option_area">
                                        <div class="c">
                                              <button type="reset" title="초기화" class="btn_opt btn_opt_reset">초기화</button>
                                              <button type="submit" title="조회" class="btn_opt btn_opt_search">조회</button>
                                        </div>
                                    </div>
                                    <!--//버튼-->
                              </div>
                        </div>
                  </div>
            </div>
      </header>
        
      <main id="container" class="search_container">
            <div class="inner">
                  <!-- 검색결과 탭 -->
                  <div class="search_category">
                        <ul class="tab">
                              <li><a href="<%=request.getRequestURI()%>" class="active">
                                      <p>통합검색</p>
                                      <em>(205)</em>
                                  </a>
                              </li>
                              <li><a href="search_02.html" class="">
                                      <p>관련 메뉴</p>
                                      <em>(6)</em>
                                  </a>
                              </li>
                              <li><a href="search_03.html" class="">
                                      <p>직원 검색</p>
                                      <em>(2)</em>
                                  </a>
                              </li>
                              <li><a href="search_04.html" class="">
                                      <p>게시판</p>
                                      <em>(60)</em>
                                  </a>
                              </li>
                              <li><a href="search_05.html" class="">
                                      <p>전자결재</p>
                                      <em>(10)</em>
                                  </a>
                              </li>
                              <li><a href="search_06.html" class="">
                                      <p>두레이 위키</p>
                                      <em>(1)</em>
                                  </a>
                              </li>
                              <li><a href="search_07.html" class="">
                                      <p>도움말 모음</p>
                                      <em>(11)</em>
                                  </a>
                              </li>
                              <li><a href="search_08.html" class="">
                                      <p>규정</p>
                                      <em>(60)</em>
                                  </a>
                              </li>
                              <li><a href="search_09.html" class="">
                                      <p>전자도서관</p>
                                      <em>(55)</em>
                                  </a>
                              </li>
                        </ul>
                  </div>
                
                  <!-- 검색결과 화면 -->
                  <div id="contents" class="search_contents">
                    <!-- 메인 콘텐츠 -->
                        <div class="search_result">
                              <div class="range_setting">
                                    <ul class="rg_st_ct">
                                      <li><button type="button" class="btn_array_popular">인기도순</button></li>
                                      <li><button type="button" class="btn_array_count">조회순</button></li>
                                      <li><button type="button" class="btn_array_title">제목순</button></li>
                                      <li><button type="button" class="btn_array_date">등록일순</button></li>
                                      <li>
                                          <input type="checkbox" class="blind" id="bt_set_ran">
                                          <label for="bt_set_ran" class="btn_setting" onclick="">가중치 설정</label>
                                          <div class="set_ran_container">
                                                <div class="set_ctrl_box">
                                                      <ul>
                                                            <li>
                                                                  <div class="set_ctrl_cat">
                                                                        <h4>제목</h4>
                                                                        <div class="set_range">
                                                                              <div class="range_slider" id="range01"></div>
                                                                        </div>
                                                                        <div class="slider_value">
                                                                              <span class="range_value" id="currentVal01">30</span> 
                                                                        </div>
                                                                  </div>
                                                                  <script>
                                                                        (function() {
                                                                              $("#range01").slider({
                                                                                    range: "min",
                                                                                    max: 100,
                                                                                    value: 30,
                                                                                    slide: function(e, ui) {
                                                                                          $("#currentVal01").html(ui.value);
                                                                                    }
                                                                              });
                                                                        }).call(this);
                                                                  </script>
                                                            </li>
                                                            <li>
                                                                  <div class="set_ctrl_cat">
                                                                        <h4>내용</h4>
                                                                        <div class="set_range">
                                                                              <div class="range_slider" id="range02"></div>
                                                                        </div>
                                                                        <div class="slider_value">
                                                                              <span class="range_value" id="currentVal02">50</span> 
                                                                        </div>
                                                                  </div>
                                                                  <script>
                                                                        (function() {
                                                                              $("#range02").slider({
                                                                                    range: "min",
                                                                                    max: 100,
                                                                                    value: 50,
                                                                                    slide: function(e, ui) {
                                                                                          $("#currentVal02").html(ui.value);
                                                                                    }
                                                                              });
                                                                        }).call(this);
                                                                  </script>
                                                            </li>
                                                            <li>
                                                                  <div class="set_ctrl_cat">
                                                                        <h4>첨부문서</h4>
                                                                        <div class="set_range">
                                                                              <div class="range_slider" id="range03"></div>
                                                                        </div>
                                                                        <div class="slider_value">
                                                                              <span class="range_value" id="currentVal03">30</span> 
                                                                        </div>
                                                                  </div>
                                                                  <script>
                                                                        (function() {
                                                                              $("#range03").slider({
                                                                                    range: "min",
                                                                                    max: 100,
                                                                                    value: 30,
                                                                                    slide: function(e, ui) {
                                                                                          $("#currentVal03").html(ui.value);
                                                                                    }
                                                                              });
                                                                        }).call(this);
                                                                  </script>
                                                            </li>
                                                            <li>
                                                                  <div class="set_ctrl_cat">
                                                                        <h4>키워드</h4>
                                                                        <div class="set_range">
                                                                              <div class=" range_slider" id="range04"></div>
                                                                        </div>
                                                                        <div class="slider_value">
                                                                              <span class="range_value" id="currentVal04">60</span> 
                                                                        </div>
                                                                        <input type="text" class="range_keyword">
                                                                  </div>
                                                                  <script>
                                                                        (function() {
                                                                              $("#range04").slider({
                                                                                    range: "min",
                                                                                    max: 100,
                                                                                    value: 60,
                                                                                    slide: function(e, ui) {
                                                                                          $("#currentVal04").html(ui.value);
                                                                                    }
                                                                              });
                                                                        }).call(this);
                                                                  </script>
                                                            </li>
                                                      </ul>
                                                </div>
                                                <div class="set_btn_box">
                                                      <button type="button" class="btn_ran_set">적용</button>
                                                      <button type="button" class="btn_ran_set">기본설정</button>
                                                      <button type="button" class="btn_ran_set">취소</button>
                                                </div>
                                          </div>
                                    </li>
                                    </ul>
                              </div>
                        
                              <div class="search_keyword">
                                  <span class="keyword">“휴가”</span>에 대한 통합검색 결과는
                                  <span class="keyword_count">&nbsp;"205"</span>건입니다.
                              </div>
                              
                              <!-- 결과화면 -->
								<%@ include file="./result/result_menu.jsp" %><!--관련 메뉴 -->
							 	<%@ include file="./result/result_staff.jsp" %><!--직원 검색 -->
								<%@ include file="./result/result_bbs.jsp" %><!--게시판 -->
								<%@ include file="./result/result_edms_new.jsp" %><!--전자결재 -->
								<%@ include file="./result/result_wiki.jsp" %><!--두레이 위키 -->
								<%--<%@ include file="./result/result_help.jsp" %><!--도움말 모음 -->
								<%@ include file="./result/result_law.jsp" %><!--규정 -->
                              	<%@ include file="./result/result_lib.jsp" %><!--전자도서관 --> --%>
							<!-- paginate -->
                            
                        </div>
                    
                        <!-- 사이드 콘텐츠 -->
                        <aside class="search_aside">
                              <!-- 인기 검색어 -->
                              <div class="search_aside_section">
                                    <div class="aside_top">
                                          <strong>인기 검색어</strong>  
                                    </div>
                                    <div class="aside_btm">
                                          <ol class="rating">
                                                <li><span class="rt_no rt_popular">1</span><a href="#none">휴가</a></li>
                                                <li><span class="rt_no rt_popular">2</span><a href="#none">출장</a></li>
                                                <li><span class="rt_no rt_popular">3</span><a href="#none">대식당</a></li>
                                                <li><span class="rt_no">4</span><a href="#none">검수</a></li>
                                                <li><span class="rt_no">5</span><a href="#none">메뉴</a></li>
                                                <li><span class="rt_no">6</span><a href="#none">휴가원</a></li>
                                                <li><span class="rt_no">7</span><a href="#none">건강검진</a></li>
                                                <li><span class="rt_no">8</span><a href="#none">두레이</a></li>
                                                <li><span class="rt_no">9</span><a href="#none">연차</a></li>
                                                <li><span class="rt_no">10</span><a href="#none">ONEST</a></li>
                                          </ol>
                                    </div>
                              </div>

                              <!-- 나의 최근 검색어 -->
                              <div class="search_aside_section">
                                    <div class="aside_top">
                                          <strong>나의 최근 검색어</strong>
                                    </div>
                                    <div class="aside_btm">
                                          <ul class="search_record">
                                                <li>
                                                    <a href="#none">검색</a>
                                                    <a href="#none" class="btn_delete">기록삭제</a>
                                                </li>
                                                <li>
                                                    <a href="#none">연구</a>
                                                    <a href="#none" class="btn_delete">기록삭제</a>
                                                </li>
                                                <li>
                                                    <a href="#none">검색어</a>
                                                    <a href="#none" class="btn_delete">기록삭제</a>
                                                </li>
                                                <li>
                                                    <a href="#none">원내메신저</a>
                                                    <a href="#none" class="btn_delete">기록삭제</a>
                                                </li>
                                          </ul>
                                          <a href="#" class="btn_kall_del">전체삭제</a>
                                    </div>
                              </div>
                        </aside>
                  </div>
            </div>
      </main><!--//container-->
</div><!--//wrap-->
</body>
</html>
<%
	if ( wnsearch != null ) {
		wnsearch.closeServer();
	}
%>
<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: staff 페이지
* @original author: SearchTool
*/
	thisCollection = "staff";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
		 <div class="result_contents">
			  <div class="result_top">
		        <h3 class="title">
		            직원 검색 [ <a href="#none" class="result_count" onClick="javascript:doCollection('<%=thisCollection%>');"> <%=numberFormat(thisTotalCount)%></a>건 ]
		        </h3>
		        <a href="#none" class="btn_more" onClick="javascript:doCollection('<%=thisCollection%>');">결과 더보기</a>
		    </div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"Date",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String USER_ENG_NM              = wnsearch.getField(thisCollection,"USER_ENG_NM",idx,false);
                String DEPT_NM                  = wnsearch.getField(thisCollection,"DEPT_NM",idx,false);
                String OFFC_TEL_NO              = wnsearch.getField(thisCollection,"OFFC_TEL_NO",idx,false);
                String CELL_PON_NO              = wnsearch.getField(thisCollection,"CELL_PON_NO",idx,false);
                String GRD_NM                   = wnsearch.getField(thisCollection,"GRD_NM",idx,false);
                String EMAIL                    = wnsearch.getField(thisCollection,"EMAIL",idx,false);
                String WORKPLC                  = wnsearch.getField(thisCollection,"WORKPLC",idx,false);
                String WORKPLC2                 = wnsearch.getField(thisCollection,"WORKPLC2",idx,false);
                String FLEX_TIME_CLS_NM         = wnsearch.getField(thisCollection,"FLEX_TIME_CLS_NM",idx,false);
                String COMP_WORK_YN             = wnsearch.getField(thisCollection,"COMP_WORK_YN",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
                String FILEEXT                  = wnsearch.getField(thisCollection,"FILEEXT",idx,false);
                String FILENAME                 = wnsearch.getField(thisCollection,"FILENAME",idx,false);
                String FILECONTENT              = wnsearch.getField(thisCollection,"FILECONTENT",idx,false);
                String REGDATE                  = wnsearch.getField(thisCollection,"REGDATE",idx,false);
                String TITLE_ORDER              = wnsearch.getField(thisCollection,"TITLE_ORDER",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				TITLE= wnsearch.getKeywordHl(TITLE,"<font color=red>","</font>");
				USER_ENG_NM= wnsearch.getKeywordHl(USER_ENG_NM,"<font color=red>","</font>");
				DEPT_NM= wnsearch.getKeywordHl(DEPT_NM,"<font color=red>","</font>");
				GRD_NM= wnsearch.getKeywordHl(GRD_NM,"<font color=red>","</font>");
				CONTENT= wnsearch.getKeywordHl(CONTENT,"<font color=red>","</font>");
				WRITER= wnsearch.getKeywordHl(WRITER,"<font color=red>","</font>");
				FILENAME= wnsearch.getKeywordHl(FILENAME,"<font color=red>","</font>");
				FILECONTENT= wnsearch.getKeywordHl(FILECONTENT,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
				<div class="result_btm">
        			<div class="result_type_box">
             			 <div class="img_box">
                  			<div class="photo">
                        		<img src="images/img_member_sample.png">
                 			</div>
              			</div>
              		<div class="info_box">
	                    <div class="department_name">
	                          <span><%=DEPT_NM%> / <%=GRD_NM%></span>
	                          <p><%=TITLE %><span><%=USER_ENG_NM%></span></p>
	                    </div>
                    <div class="info">
                          <div class="box_left">
                              <ul>
                                    <li>
                                          <dl>
                                                <dt>연락처<span>·Extension</span></dt>
                                                <dd><%=OFFC_TEL_NO%></dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>이메일<span>·E-mail</span></dt>
                                                <dd><%=EMAIL%></dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>근무호실<span>·Office</span></dt>
                                                <dd><%=WORKPLC%></dd>
                                          </dl>
                                    </li>
                              </ul>
                          </div>
                          <div class="box_right">
                              <ul>
                                    <li>
                                          <dl>
                                                <dt>근무시간<span>·Duty Hours</span></dt>
                                                <dd><%=FLEX_TIME_CLS_NM%></dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>담당업무<span>·Assignment Task</span></dt>
                                                <dd><%=CONTENT%></dd>
                                          </dl>
                                    </li>
                              </ul>
                          </div>
                    </div>
              </div>
        </div>
     </div>
 <%
			}
		}
	}
%>
	</div> 
 <!-- 직원검색 -->
<!-- <div class="result_contents">
    <div class="result_top">
        <h3 class="title">
            직원 검색 [ <a href="search_03.html" class="result_count">2</a>건 ]
        </h3>
        <a href="search_03.html" class="btn_more">결과 더보기</a>
    </div>
    <div class="result_btm">
        <div class="result_type_box">
              <div class="img_box">
                  <div class="photo">
                        <img src="images/img_member_sample.png">
                  </div>
              </div>
              <div class="info_box">
                    <div class="department_name">
                          <span>인사경영팀 / 행정원</span>
                          <p>김이름<span>Kim, ireum</span></p>
                    </div>
                    <div class="info">
                          <div class="box_left">
                              <ul>
                                    <li>
                                          <dl>
                                                <dt>연락처<span>·Extension</span></dt>
                                                <dd>02-958-0000</dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>이메일<span>·E-mail</span></dt>
                                                <dd>abcdefghijk@kist.re.kr</dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>근무호실<span>·Office</span></dt>
                                                <dd>A101</dd>
                                          </dl>
                                    </li>
                              </ul>
                          </div>
                          <div class="box_right">
                              <ul>
                                    <li>
                                          <dl>
                                                <dt>근무시간<span>·Duty Hours</span></dt>
                                                <dd>09시~18시</dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>담당업무<span>·Assignment Task</span></dt>
                                                <dd>국내외출장, 휴가</dd>
                                          </dl>
                                    </li>
                              </ul>
                          </div>
                    </div>
              </div>
        </div>
        <div class="result_type_box">
              <div class="img_box">
                  <div class="photo">
                        <img src="images/img_member_sample.png">
                  </div>
              </div>
              <div class="info_box">
                    <div class="department_name">
                          <span>인사경영팀 / 행정원</span>
                          <p>김이름<span>Kim, ireum</span></p>
                    </div>
                    <div class="info">
                          <div class="box_left">
                              <ul>
                                    <li>
                                          <dl>
                                                <dt>연락처<span>·Extension</span></dt>
                                                <dd>02-958-0000</dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>이메일<span>·E-mail</span></dt>
                                                <dd>abcdefghijk@kist.re.kr</dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>근무호실<span>·Office</span></dt>
                                                <dd>A101</dd>
                                          </dl>
                                    </li>
                              </ul>
                          </div>
                          <div class="box_right">
                              <ul>
                                    <li>
                                          <dl>
                                                <dt>근무시간<span>·Duty Hours</span></dt>
                                                <dd>09시~18시</dd>
                                          </dl>
                                    </li>
                                    <li>
                                          <dl>
                                                <dt>담당업무<span>·Assignment Task</span></dt>
                                                <dd>국내외출장, 휴가</dd>
                                          </dl>
                                    </li>
                              </ul>
                          </div>
                    </div>
              </div>
        </div>
    </div>
</div> -->
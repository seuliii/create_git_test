<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: edms_new 페이지
* @original author: SearchTool
*/
	thisCollection = "edms_new";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			<div class="result_contents">
				<div class="result_top">
			        <h3 class="title">
			            전자 결재 [ <a href="search_06.html" class="result_count"onClick="javascript:doCollection('<%=thisCollection%>');"> <%=numberFormat(thisTotalCount)%></a>건 ]
			        </h3>
			        <a href="#none" class="btn_more" onClick="javascript:doCollection('<%=thisCollection%>');">결과 더보기</a>
			    </div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"Date",idx,false);
                String LINKURL                  = wnsearch.getField(thisCollection,"LINKURL",idx,false);
                String APPID                    = wnsearch.getField(thisCollection,"APPID",idx,false);
                String DOCNO                    = wnsearch.getField(thisCollection,"DOCNO",idx,false);
                String FORMNAME                 = wnsearch.getField(thisCollection,"FORMNAME",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
                String COMNAME                  = wnsearch.getField(thisCollection,"COMNAME",idx,false);
                String DEPTNAME                 = wnsearch.getField(thisCollection,"DEPTNAME",idx,false);
                String POSINAME                 = wnsearch.getField(thisCollection,"POSINAME",idx,false);
                String FUNCNAM                  = wnsearch.getField(thisCollection,"FUNCNAM",idx,false);
                String ROLLNAME                 = wnsearch.getField(thisCollection,"ROLLNAME",idx,false);
                String OFCNAME                  = wnsearch.getField(thisCollection,"OFCNAME",idx,false);
                String COMPANYID                = wnsearch.getField(thisCollection,"COMPANYID",idx,false);
                String DATATYPE                 = wnsearch.getField(thisCollection,"DATATYPE",idx,false);
                String APPDATE                  = wnsearch.getField(thisCollection,"APPDATE",idx,false);
                String APPLINEUSERS             = wnsearch.getField(thisCollection,"APPLINEUSERS",idx,false);
                String SENDER                   = wnsearch.getField(thisCollection,"SENDER",idx,false);
                String DOCBOXID                 = wnsearch.getField(thisCollection,"DOCBOXID",idx,false);
                String TGTQUTH                  = wnsearch.getField(thisCollection,"TGTQUTH",idx,false);
                String CHGDATE                  = wnsearch.getField(thisCollection,"CHGDATE",idx,false);
                String FILENAME                 = wnsearch.getField(thisCollection,"FILENAME",idx,false);
                String FILEEXT                  = wnsearch.getField(thisCollection,"FILEEXT",idx,false);
                String FILECONTENT              = wnsearch.getField(thisCollection,"FILECONTENT",idx,false);
                String FILELINK                 = wnsearch.getField(thisCollection,"FILELINK",idx,false);
                String TITLE_ORDER              = wnsearch.getField(thisCollection,"TITLE_ORDER",idx,false);
                String FILEID                   = wnsearch.getField(thisCollection,"FILEID",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				TITLE= wnsearch.getKeywordHl(TITLE,"<font color=red>","</font>");
				CONTENT= wnsearch.getKeywordHl(CONTENT,"<font color=red>","</font>");
				WRITER= wnsearch.getKeywordHl(WRITER,"<font color=red>","</font>");
				FILENAME= wnsearch.getKeywordHl(FILENAME,"<font color=red>","</font>");
				FILECONTENT= wnsearch.getKeywordHl(FILECONTENT,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
				 <div class="result_btm">
			        <ul class="result_type_list">
			            <li>
			                  <div class="list_top">
			                        <a href="#" class="title"><%=TITLE %></a>
			                        <span class="writer"><%=WRITER %>/<%=DEPTNAME %></span>
			                        <span class="date"><%=APPDATE %></span>
			                  </div>
			                  <div class="list_bottom">
			                        <p><%=CONTENT %> </p>
			                        <ul class="attached_file">
			                              <li><a href="#"><span class="keyword">휴가</span>신청001.pdf</a></li>
			                        </ul>
			                  </div>
			            </li>
			        </ul>
    			</div>
 <%
			}
		}
	}
%>
</div>
<!-- 전자결재 -->
<!-- <div class="result_contents">
    <div class="result_top">
        <h3 class="title">
            전자결재 [ <a href="search_05.html" class="result_count">10</a>건 ]
        </h3>
        <a href="search_05.html" class="btn_more">결과 더보기</a>
    </div>
    <div class="result_btm">
        <ul class="result_type_list">
            <li>
                  <div class="list_top">
                        <a href="#" class="title">[과기부/IITP] 2023년도 암호화 사이버 위험 대응기술 연구개발사업 신규 지원 대상 과제 공고</a>
                        <span class="writer">김남산위의소나무/데이터정보팀</span>
                        <span class="date">2023.02.01</span>
                  </div>
                  <div class="list_bottom">
                        <p>...육 방법 : 대면참석 권장 / 실시간 ON-LINE 병행 - 현장교육 불참 시 실시간 방송 및 녹화자료 청취 가능 - 실시간 ON-LINE 시청 : 통합정보시스템 유용한서비스 인터넷방송국 라이브방송 - 출장<b class="keyword">휴가</b>시 : 강의 녹화자료 청취(22.12.21.(수)까지 청취한 경우 참석 인정) ※ 본교육 이수 시 교육 및 원내 활동 마일리지 1점 부여 감사합니다.
                        </p>
                        <ul class="attached_file">
                              <li><a href="#"><span class="keyword">휴가</span>신청001.pdf</a></li>
                        </ul>
                  </div>
            </li>
            <li>
                  <div class="list_top">
                        <a href="#" class="title">휴가원(연차 김연차)</a>
                        <span class="writer">김연차/데이터정보팀</span>
                        <span class="date">2023.02.01</span>
                  </div>
                  <div class="list_bottom">
                        <p>텍스트가 한 줄만 있을 경우 ...<b class="keyword">휴가</b>...
                        </p>
                        <ul class="attached_file">
                              <li><a href="#"><span class="keyword">휴가</span>신청서.pdf</a></li>
                        </ul>
                  </div>
            </li>
            <li>
                  <div class="list_top">
                        <a href="#" class="title">휴가원(연차 박휴가)</a>
                        <span class="writer">박휴가/데이터정보팀</span>
                        <span class="date">2023.02.01</span>
                  </div>
                  <div class="list_bottom">
                        <p></p>
                  </div>
            </li>
        </ul>
    </div>
</div>




 -->
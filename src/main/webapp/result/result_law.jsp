<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: law 페이지
* @original author: SearchTool
*/
	thisCollection = "law";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			<div class="sectit">
				<h2><%=wnsearch.getCollectionKorName(thisCollection)%></h2>
				<p>| 검색결과 <%=numberFormat(thisTotalCount)%>건</p>
			</div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"Date",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
                String PARAM1                   = wnsearch.getField(thisCollection,"PARAM1",idx,false);
                String PARAM2                   = wnsearch.getField(thisCollection,"PARAM2",idx,false);
                String PARAM3                   = wnsearch.getField(thisCollection,"PARAM3",idx,false);
                String FILEEXT                  = wnsearch.getField(thisCollection,"FILEEXT",idx,false);
                String FILENAME                 = wnsearch.getField(thisCollection,"FILENAME",idx,false);
                String FILECONTENT              = wnsearch.getField(thisCollection,"FILECONTENT",idx,false);
                String ENFORCEMENT_DATE         = wnsearch.getField(thisCollection,"ENFORCEMENT_DATE",idx,false);
                String TITLE_ORDER              = wnsearch.getField(thisCollection,"TITLE_ORDER",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				TITLE= wnsearch.getKeywordHl(TITLE,"<font color=red>","</font>");
				CONTENT= wnsearch.getKeywordHl(CONTENT,"<font color=red>","</font>");
				WRITER= wnsearch.getKeywordHl(WRITER,"<font color=red>","</font>");
				FILENAME= wnsearch.getKeywordHl(FILENAME,"<font color=red>","</font>");
				FILECONTENT= wnsearch.getKeywordHl(FILECONTENT,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
				<dl class="resultsty1">
					<dt>
						<p class="date"><%=DATE%></p>
						<p class="fl"><a href="#"><%=TITLE%></a></p>
					</dt>
					<dd class="lh18"><%=CONTENT%></dd>
              <dd class="lh18"> DOCID : <%=DOCID%></dd>
              <dd class="lh18"> Date : <%=DATE%></dd>
              <dd class="lh18"> PARAM1 : <%=PARAM1%></dd>
              <dd class="lh18"> PARAM2 : <%=PARAM2%></dd>
              <dd class="lh18"> PARAM3 : <%=PARAM3%></dd>
              <dd class="lh18"> FILEEXT : <%=FILEEXT%></dd>
              <dd class="lh18"> FILENAME : <%=FILENAME%></dd>
              <dd class="lh18"> FILECONTENT : <%=FILECONTENT%></dd>
              <dd class="lh18"> ENFORCEMENT_DATE : <%=ENFORCEMENT_DATE%></dd>
              <dd class="lh18"> TITLE_ORDER : <%=TITLE_ORDER%></dd>
              <dd class="lh18"> ALIAS : <%=ALIAS%></dd>
				</dl>
 <%
			}

			if ( collection.equals("ALL") && thisTotalCount > TOTALVIEWCOUNT ) {
%>
				<div class="moreresult"><a href="#none" onClick="javascript:doCollection('<%=thisCollection%>');">더보기</a></div>
<%
			}
		}
	}
%>



                 <!-- 규정 -->
                <!--  <div class="result_contents">
                     <div class="result_top">
                         <h3 class="title">
                             규정 [ <a href="search_08.html" class="result_count">60</a>건 ]
                         </h3>
                         <a href="search_08.html" class="btn_more">결과 더보기</a>
                     </div>
                     <div class="result_btm">
                         <ul class="result_type_list">
                             <li>
                                   <div class="list_top">
                                         <a href="#" class="title">보안업무 취급요령</a>
                                         <span class="date date_long">(재)개정일 : 2023.02.01</span>
                                   </div>
                                   <div class="list_bottom">
                                         <p>1.당직명령을받은자가 출장,<b class="keyword">휴가</b> 기타 부득이한 사유로 당직근무를 할수 없는 경우에는 당직근무 전일까지 당직변경신청서(별표 제39호 서식)를 인사담당 부서장에게 제출하여 당직근무일의 변경승인을 받아야한다. (개정 2015.4.23) 2.(삭제 2015.4.23) 3.제 1항의 규정에 의한변경승인을 받지 아니한 대체근무는 이를 당직근무로 인정... 
                                         </p>
                                   </div>
                             </li>
                         </ul>
                     </div>
                 </div>
            -->
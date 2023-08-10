<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: menu 페이지
* @original author: SearchTool
*/
	thisCollection = "menu";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			 <div class="result_contents">
			 	<div class="result_top">
		           <h3 class="title">
		               관련 메뉴 [ <a href="#none"  onClick="javascript:doCollection('<%=thisCollection%>');" class="result_count"><%=thisTotalCount %></a>건 ]
		           </h3>
		           <a href="#none"  onClick="javascript:doCollection('<%=thisCollection%>');" class="btn_more">결과 더보기</a>
		       </div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"Date",idx,false);
                String MENUPATH                 = wnsearch.getField(thisCollection,"MENUPATH",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
                String LINKURL                  = wnsearch.getField(thisCollection,"LINKURL",idx,false);
                String ENPNO                    = wnsearch.getField(thisCollection,"ENPNO",idx,false);
                String FILEEXT                  = wnsearch.getField(thisCollection,"FILEEXT",idx,false);
                String FILENAME                 = wnsearch.getField(thisCollection,"FILENAME",idx,false);
                String FILECONTENT              = wnsearch.getField(thisCollection,"FILECONTENT",idx,false);
                String TITLE_ORDER              = wnsearch.getField(thisCollection,"TITLE_ORDER",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				TITLE= wnsearch.getKeywordHl(TITLE,"<font color=red>","</font>");
				CONTENT= wnsearch.getKeywordHl(CONTENT,"<font color=red>","</font>");
				WRITER= wnsearch.getKeywordHl(WRITER,"<font color=red>","</font>");
				FILENAME= wnsearch.getKeywordHl(FILENAME,"<font color=red>","</font>");
				FILECONTENT= wnsearch.getKeywordHl(FILECONTENT,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>

				 <div class="result_btm">
				           <ul class="result_type_link">
				               <li>
				               		<p><%=MENUPATH %> > <a href="<%=LINKURL %>" class="rs_link"><%=TITLE %></a></p>
				               </li>
				           </ul>
				       </div>
 <%
			}

		}
	}
%>
   </div>
  <!-- 관련메뉴 -->
  <!--  <div class="result_contents">
       <div class="result_top">
           <h3 class="title">
               관련 메뉴 [ <a href="search_02.html" class="result_count">6</a>건 ]
           </h3>
           <a href="search_02.html" class="btn_more">결과 더보기</a>
       </div>
       <div class="result_btm">
           <ul class="result_type_link">
               <li>
                   <p>경영정보 > 인사 > 휴가/출장 > <a href="#" class="rs_link">휴가신청</a></p>
               </li>
               <li>
                   <p>경영정보 > 인사 > 휴가/출장 > <a href="#" class="rs_link">연차휴가사용계획(시간제)</a></p>
               </li>
               <li>
                   <p>경영정보 > 인사 > 휴가/출장 > <a href="#" class="rs_link">저축연가 휴가원</a></p>
               </li>
           </ul>
       </div>
   </div> -->
   
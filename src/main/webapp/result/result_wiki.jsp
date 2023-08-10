<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: wiki 페이지
* @original author: SearchTool
*/
	thisCollection = "wiki";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			<div class="result_contents">
				<div class="result_top">
			        <h3 class="title">
			            두레이 위키 [ <a href="search_06.html" class="result_count"onClick="javascript:doCollection('<%=thisCollection%>');"> <%=numberFormat(thisTotalCount)%></a>건 ]
			        </h3>
			        <a href="#none" class="btn_more" onClick="javascript:doCollection('<%=thisCollection%>');">결과 더보기</a>
			    </div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"Date",idx,false);
                String WIKI_ID                  = wnsearch.getField(thisCollection,"WIKI_ID",idx,false);
                String PAGE_ID                  = wnsearch.getField(thisCollection,"PAGE_ID",idx,false);
                String PARENT_PAGE_ID           = wnsearch.getField(thisCollection,"PARENT_PAGE_ID",idx,false);
                String WIKI_CONTENTS            = wnsearch.getField(thisCollection,"WIKI_CONTENTS",idx,false);
                String URL                      = wnsearch.getField(thisCollection,"URL",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
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
			        <ul class="list shape_type1">
			            <ul class="result_type_link">
			            <li>
			                <p><%=TITLE %></p>
			            </li>
			        </ul>
			        </ul>
			    </div>
 <%
			}
		}
	}
%>
</div>
 <!-- 두레이 위키 -->
<!-- <div class="result_contents">
    <div class="result_top">
        <h3 class="title">
            두레이 위키 [ <a href="search_06.html" class="result_count">1</a>건 ]
        </h3>
        <a href="search_06.html" class="btn_more">결과 더보기</a>
    </div>
    <div class="result_btm">
        <ul class="list shape_type1">
            <ul class="result_type_link">
            <li>
                <p>KIST-행정위키 > 5. 경영지원본부 > ... > <a href="#" class="rs_link">인사경영팀</a></p>
            </li>
        </ul>
        </ul>
    </div>
</div> -->
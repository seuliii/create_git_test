<%--<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: help 페이지
* @original author: SearchTool
*/
	thisCollection = "help";
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
                String WRITER                   = wnsearch.getField(thisCollection,"WRITER",idx,false);
                String SEQ                      = wnsearch.getField(thisCollection,"SEQ",idx,false);
                String CONTENT                  = wnsearch.getField(thisCollection,"CONTENT",idx,false);
                String TITLE                    = wnsearch.getField(thisCollection,"TITLE",idx,false);
                String LINK                     = wnsearch.getField(thisCollection,"LINK",idx,false);
                String FILEEXT                  = wnsearch.getField(thisCollection,"FILEEXT",idx,false);
                String FILENAME                 = wnsearch.getField(thisCollection,"FILENAME",idx,false);
                String FILECONTENT              = wnsearch.getField(thisCollection,"FILECONTENT",idx,false);
                String TITLE_ORDER              = wnsearch.getField(thisCollection,"TITLE_ORDER",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				WRITER= wnsearch.getKeywordHl(WRITER,"<font color=red>","</font>");
				CONTENT= wnsearch.getKeywordHl(CONTENT,"<font color=red>","</font>");
				TITLE= wnsearch.getKeywordHl(TITLE,"<font color=red>","</font>");
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
              <dd class="lh18"> SEQ : <%=SEQ%></dd>
              <dd class="lh18"> LINK : <%=LINK%></dd>
              <dd class="lh18"> FILEEXT : <%=FILEEXT%></dd>
              <dd class="lh18"> FILENAME : <%=FILENAME%></dd>
              <dd class="lh18"> FILECONTENT : <%=FILECONTENT%></dd>
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

  <!-- 도움말 모음 -->
<div class="result_contents">
    <div class="result_top">
        <h3 class="title">
            도움말 모음 [ <a href="search_07.html" class="result_count">11</a>건 ]
        </h3>
        <a href="search_07.html" class="btn_more">결과 더보기</a>
    </div>
    <div class="result_btm">
        <ul class="result_type_list">
            <li>
                  <div class="list_top">
                        <a href="#" class="title">휴가신청(학생,연구원)</a>
                        <span class="writer">최담당</span>
                        <span class="date">2023.02.01</span>
                  </div>
                  <div class="list_bottom">
                        <ul class="attached_file">
                              <li><a href="#">첨부파일.pdf</a></li>
                              <li><a href="#">첨부파일.pdf</a></li>
                        </ul>
                  </div>
            </li>
            <li>
                  <div class="list_top">
                        <a href="#" class="title">휴가신청(행정원)</a>
                        <span class="writer">최담당</span>
                        <span class="date">2023.02.01</span>
                  </div>
                  <div class="list_bottom">
                        <ul class="attached_file">
                              <li><a href="#">첨부파일.pdf</a></li>
                        </ul>
                  </div>
            </li>
            <li>
                  <div class="list_top">
                        <a href="#" class="title">휴가신청서</a>
                        <span class="writer">최담당</span>
                        <span class="date">2023.02.01</span>
                  </div>
                  <div class="list_bottom">
                        <ul class="attached_file">
                              <li><a href="#">첨부파일.pdf</a></li>
                        </ul>
                  </div>
            </li>
        </ul>
    </div>
</div>

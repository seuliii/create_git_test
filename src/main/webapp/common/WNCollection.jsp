<%@ page pageEncoding = "UTF-8" %>
<%!

	static String SEARCH_IP="127.0.0.1";
	static int SEARCH_PORT=7001;
	static String MANAGER_IP="127.0.0.1";
	static int MANAGER_PORT=7800;

	public String[] COLLECTIONS = new String[]{"lib","law","staff","bbs","menu","edms_new","wiki","help"};
	public String[] COLLECTIONS_NAME = new String[]{"lib","law","staff","bbs","menu","edms_new","wiki","help"};
	public String[] MERGE_COLLECTIONS = new String[]{""};
	public class WNCollection{
	public String[][] MERGE_COLLECTION_INFO = null;
	public String[][] COLLECTION_INFO = null;
		WNCollection(){
			COLLECTION_INFO = new String[][]
			{
			{
			"lib", // set index name
			"lib", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,TITLE,CONTENT,WRITER,PARAM1,PARAM2,PARAM3,FILEEXT,FILENAME,FILECONTENT,PUB_YEAR,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"전자도서관" // collection display name
			}
         ,
			{
			"law", // set index name
			"law", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,TITLE,CONTENT,WRITER,PARAM1,PARAM2,PARAM3,FILEEXT,FILENAME,FILECONTENT,ENFORCEMENT_DATE,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"규정" // collection display name
			}
         ,
			{
			"staff", // set index name
			"staff", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT,USER_ENG_NM,DEPT_NM,GRD_NM",// set search field
			"DOCID,Date,TITLE,USER_ENG_NM,DEPT_NM,OFFC_TEL_NO,CELL_PON_NO,GRD_NM,EMAIL,WORKPLC,WORKPLC2,FLEX_TIME_CLS_NM,COMP_WORK_YN,CONTENT,WRITER,FILEEXT,FILENAME,FILECONTENT,REGDATE,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"직원 검색" // collection display name
			}
         ,
			{
			"bbs", // set index name
			"bbs", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,BODY_TITLE,BODY_CONTENT,FILETITLE,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,GWKEY,DATATYPE,LINKURL,CATID,BBSID,BBSNAME,TITLE,CONTENT,WRITER,DEPTNAME,POSINAME,FUNCNAME,ROLLNAME,OFCLNAME,COMPANYID,FULLPATH,MAPTGTAUTH,MAPEXCEPTAUTH,MAKEDATE,CHGDATE,BODY_CONTENT,BODY_LINK,BODY_FILENAME,BODY_TITLE,FILECONTENT,FILELINK,FILENAME,FILEEXT,FILETITLE,FILEID,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"MAPTGTAUTH,MAPEXCEPTAUTH,FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"게시판" // collection display name
			}
         ,
			{
			"menu", // set index name
			"menu", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,MENUPATH,TITLE,CONTENT,WRITER,LINKURL,ENPNO,FILEEXT,FILENAME,FILECONTENT,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"ENPNO,FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"관련 메뉴" // collection display name
			}
         ,
			{
			"edms_new", // set index name
			"edms_new", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,LINKURL,APPID,DOCNO,FORMNAME,TITLE,CONTENT,WRITER,COMNAME,DEPTNAME,POSINAME,FUNCNAM,ROLLNAME,OFCNAME,COMPANYID,DATATYPE,APPDATE,APPLINEUSERS,SENDER,DOCBOXID,TGTQUTH,CHGDATE,FILENAME,FILEEXT,FILECONTENT,FILELINK,TITLE_ORDER,FILEID,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"FILEEXT,TGTQUTH,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"전자결재" // collection display name
			}
         ,
			{
			"wiki", // set index name
			"wiki", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,WIKI_ID,PAGE_ID,PARENT_PAGE_ID,WIKI_CONTENTS,URL,TITLE,CONTENT,WRITER,FILEEXT,FILENAME,FILECONTENT,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"두레이 위키" // collection display name
			}
         ,
			{
			"help", // set index name
			"help", // set collection name
			"0,3",  // set pageinfo (start,count)
			"1,0,0,0,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
			"basic,rpfmo,100",  // set sort field (field,order) multi sort '/'
			"TITLE,CONTENT,WRITER,FILENAME,FILECONTENT",// set search field
			"DOCID,Date,WRITER,SEQ,CONTENT,TITLE,LINK,FILEEXT,FILENAME,FILECONTENT,TITLE_ORDER,ALIAS",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"FILEEXT,ALIAS", // use check prefix query filed
			"TITLE_ORDER", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"도움말 모음" // collection display name
			}
			};
		}
	}
%>
﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_show" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>
<script runat="server">
private const int site_id = 4;
private const string channel = "video";
override protected void OnInit(EventArgs e)
{
	base.OnInit(e);
	string cacheKey = config.cachekey + "_main_video_show_" + id + "";
	string outHtml = null;
	validate_channel_data(channel);
	if (config.systemcache == 1){
		outHtml = PageCache.GetCache(cacheKey);
	}
	if(null == outHtml){
		StringBuilder templateBuilder = new StringBuilder(220000);
		
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
	string category_title = get_category_title(model.category_id,"视频专区");

	templateBuilder.Append("\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(category_title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/ckplayer/ckplayer.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n//设置视频容器大小\r\nwinResize();\r\n$(window).resize(function() {\r\nwinResize();\r\n});\r\n//初始化视频容器\r\ninitCKPlayer('video-box', '" + Utils.ObjectToStr(model.fields["video_src"]) + "', '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/ckplayer/ckplayer.swf');\r\n});\r\n//改变大小函数\r\nfunction winResize(){\r\nif($(\".section\").width() == 1180){\r\n$(\".video-box\").width(840);\r\n$(\".video-box\").height(473);\r\n}else{\r\n$(\".video-box\").width(601);\r\n$(\".video-box\").height(338);\r\n}\r\n}\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<div class=\"header\">\r\n<div class=\"header-wrap\">\r\n<div class=\"section\">\r\n<div class=\"left-box\">\r\n<a class=\"logo\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</a>\r\n<p class=\"nav\">\r\n<a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">资讯</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">商城</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("video"));

	templateBuilder.Append("\">视频</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">下载</a>\r\n<a href=\"");
	templateBuilder.Append(linkurl("forum_index","index"));

	templateBuilder.Append("\">论坛</a>\r\n</p>\r\n</div>\r\n<div class=\"search\">\r\n<input id=\"keywords\" name=\"keywords\" class=\"input\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入回车搜索\" x-webkit-speech=\"\" />\r\n<input class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" value=\"搜索\" />\r\n</div>\r\n<div class=\"right-box\">\r\n<script type=\"text/javascript\">\r\n$.ajax({\r\ntype: \"POST\",\r\nurl: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\ndataType: \"json\",\r\ntimeout: 20000,\r\nsuccess: function (data, textStatus) {\r\nif (data.status == 1) {\r\n$(\"#menu\").prepend('<li class=\"line\"><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>');\r\n$(\"#menu\").prepend('<li class=\"login\"><em></em><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>');\r\n} else {\r\n$(\"#menu\").prepend('<li class=\"line\"><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>');\r\n$(\"#menu\").prepend('<li class=\"login\"><em></em><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>');\r\n}\r\n}\r\n});\r\n</");
	templateBuilder.Append("script>\r\n<ul id=\"menu\">\r\n<li>\r\n<a href=\"");
	templateBuilder.Append(linkurl("cart"));

	templateBuilder.Append("\">购物车<span id=\"shoppingCartCount\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script></span>件</a>\r\n</li>\r\n<li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Header-->\r\n<div class=\"section clearfix\">\r\n<!--右边-->\r\n<div class=\"list-right\">\r\n<div class=\"sidebar-box\">\r\n<div class=\"line30\"></div>\r\n<h3>视频类别</h3>\r\n<ul class=\"navbar\">\r\n");
	DataTable categoryList1 = get_category_child_list(channel, 0);

	foreach(DataRow cdr1 in categoryList1.Rows)
	{

	templateBuilder.Append("\r\n<li>\r\n<h4><a href=\"");
	templateBuilder.Append(linkurl("video_list",Utils.ObjectToStr(cdr1["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr1["title"]) + "</a></h4>\r\n<p>\r\n");
	DataTable categoryList2 = get_category_child_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr1["id"]), 0));

	foreach(DataRow cdr2 in categoryList2.Rows)
	{

	if (Utils.StrToInt(Utils.ObjectToStr(cdr2["id"]), 0)==model.category_id)
	{

	templateBuilder.Append("\r\n<a href=\"");
	templateBuilder.Append(linkurl("video_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\" class=\"selected\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n");
	}
	else
	{

	templateBuilder.Append("\r\n<a href=\"");
	templateBuilder.Append(linkurl("video_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n</p>\r\n</li>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n</ul>\r\n<div class=\"line20\"></div>\r\n<h3>推荐视频</h3>\r\n<div class=\"focus-list\">\r\n<ul>\r\n");
	DataTable redVideo = get_article_list(channel, 0, 4, "status=0 and is_red=1");

	foreach(DataRow dr in redVideo.Rows)
	{

	templateBuilder.Append("\r\n<li>\r\n<a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("video_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n<b>\r\n<em></em>\r\n<img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n</b>\r\n<span>" + Utils.ObjectToStr(dr["title"]) + "</span>\r\n</a>\r\n</li>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n</ul>\r\n</div>\r\n<div class=\"line10\"></div>\r\n<h3>人气排行</h3>\r\n<ul class=\"rank-list\">\r\n");
	DataTable hotVideo = get_article_list(channel, 0, 10, "status=0", "click desc,id desc");

	int hotdr__loop__id=0;
	foreach(DataRow hotdr in hotVideo.Rows)
	{
		hotdr__loop__id++;


	if (hotdr__loop__id==1)
	{

	templateBuilder.Append("\r\n<li class=\"active\">\r\n");
	}
	else
	{

	templateBuilder.Append("\r\n<li>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n<span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(hotdr["add_time"])).ToString("MM-dd"));

	templateBuilder.Append("</span>\r\n<i class=\"num\">");
	templateBuilder.Append(hotdr__loop__id.ToString());

	templateBuilder.Append("</i><a href=\"");
	templateBuilder.Append(linkurl("video_show",Utils.ObjectToStr(hotdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(hotdr["title"]) + "</a>\r\n</li>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n</ul>\r\n</div>\r\n</div>\r\n<!--/右边-->\r\n<!--左边-->\r\n<div class=\"list-auto\">\r\n<div class=\"line30\"></div>\r\n<div id=\"video-box\" class=\"video-box\"></div>\r\n<div class=\"meta\">\r\n<h1>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("</h1>\r\n<p class=\"meta-info\">\r\n<span class=\"time\">");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("</span>\r\n<span class=\"comm\"><em id=\"comment\">0</em>人评论</span>\r\n<span class=\"view\"><em id=\"view\">0</em>次浏览</span>\r\n<script type=\"text/javascript\">ajaxComment(\"#comment\",\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("\",");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("); ajaxView(\"#view\",\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("\",");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append(");</");
	templateBuilder.Append("script>\r\n分类：");
	templateBuilder.Append(Utils.ObjectToStr(category_title));
	templateBuilder.Append("\r\n</p>\r\n</div>\r\n<div class=\"entry\">\r\n");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("\r\n</div>\r\n<!--上下篇-->\r\n<div class=\"next-prev-single\">\r\n<p class=\"prev\">上一篇：");
	templateBuilder.Append(get_prevandnext_article("video_show", -1, "没有了", 0).ToString());

	templateBuilder.Append("</p>\r\n<p class=\"next\">下一篇：");
	templateBuilder.Append(get_prevandnext_article("video_show", 1, "没有了", 0).ToString());

	templateBuilder.Append("</p>\r\n</div>\r\n<!--/上下篇-->\r\n<div class=\"line15\"></div>\r\n<!--相关推荐-->\r\n<h2 class=\"base-tit\">\r\n<span>相关图片</span>\r\n</h2>\r\n<div class=\"rel-list\">\r\n<ul>\r\n");
	DataTable relList = get_article_list(channel, model.category_id, 4, "is_red=1 and id<>"+model.id);

	foreach(DataRow dr in relList.Rows)
	{

	templateBuilder.Append("\r\n<li>\r\n<div class=\"img-box\">\r\n<a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("video_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n<img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n</a>\r\n</div>\r\n<div class=\"info\">\r\n<h3><a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("video_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></h3>\r\n<p>" + Utils.ObjectToStr(dr["zhaiyao"]) + "</p>\r\n<span>" + Utils.ObjectToStr(dr["add_time"]) + "</span>\r\n</div>\r\n</li>\r\n");
	}	//end for if

	if (relList.Rows.Count<1)
	{

	templateBuilder.Append("\r\n<div class=\"nodata\">暂无相关的视频...</div>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n</ul>\r\n</div>\r\n<!--/相关推荐-->\r\n<div class=\"clear\"></div>\r\n<!--用户评论-->\r\n");
	if (model.is_msg==1)
	{

	templateBuilder.Append("\r\n<h2 class=\"base-tit\">\r\n<i>共有<b id=\"comment2\">0</b>访客发表了评论</i>\r\n<script type=\"text/javascript\">ajaxComment(\"#comment2\",\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("\",");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append(");</");
	templateBuilder.Append("script>\r\n<span>网友评论</span>\r\n</h2>\r\n");

	int comment_count = get_comment_count(model.id, "is_lock=0");

	templateBuilder.Append("<!--取得评论总数-->\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/validate.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/ui-dialog.css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/dialog-plus-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.pagination.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n//初始化评论列表\r\npageInitComment();\r\n//初始化发表评论表单\r\nAjaxInitForm('#comment_form', '#btnSubmit', 1, '', pageInitComment);\r\n});\r\n//初始化评论列表\r\nfunction pageInitComment(){\r\nAjaxPageList('#comment_list', '#pagination', 10, ");
	templateBuilder.Append(Utils.ObjectToStr(comment_count));
	templateBuilder.Append(", '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_list&article_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("', '");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/user-avatar.png');\r\n}\r\n</");
	templateBuilder.Append("script>\r\n<div class=\"comment-add\">\r\n<form id=\"comment_form\" name=\"comment_form\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=comment_add&article_id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\">\r\n<div class=\"editor\">\r\n<textarea id=\"txtContent\" name=\"txtContent\" class=\"input\" datatype=\"*\" sucmsg=\" \"></textarea>\r\n</div>\r\n<div class=\"subcon\">\r\n<input id=\"btnSubmit\" name=\"submit\" class=\"btn right\" type=\"submit\" value=\"提交评论（Ctrl+Enter）\" />\r\n<span>验证码：</span>\r\n<input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"input small\" datatype=\"s4-4\" errormsg=\"请填写4位验证码\" sucmsg=\" \" onkeydown=\"if(event.ctrlKey&&event.keyCode==13){document.getElementById('btnSubmit').click();return false};\" />\r\n<a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" style=\"vertical-align:middle;\" /> 看不清楚？</a>\r\n</div>\r\n</form>\r\n</div>\r\n<div class=\"comment-box\">\r\n<ol id=\"comment_list\" class=\"comment-list\"></ol>\r\n</div>\r\n<!--放置页码-->\r\n<div class=\"page-box\" style=\"margin-left:-8px;\">\r\n<div id=\"pagination\" class=\"digg\"></div>\r\n</div>\r\n<div class=\"line10\"></div>\r\n<!--/放置页码-->");


	}	//end for if

	templateBuilder.Append("\r\n<!--用户评论-->\r\n</div>\r\n<!--/左边-->\r\n</div>\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer clearfix\">\r\n<div class=\"foot-nav\">\r\n");
	DataTable footMenu = get_plugin_method("DTcms.Web.Plugin.Menu", "menu", "get_menu_list", 3, 0);

	foreach(DataRow dr in footMenu.Rows)
	{

	templateBuilder.Append("\r\n<a href=\"" + Utils.ObjectToStr(dr["link_url"]) + "\" target=\"" + Utils.ObjectToStr(dr["target"]) + "\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n</div>\r\n<div class=\"copyright\">\r\n<p>版权所有 ");
	templateBuilder.Append(site.company.ToString());

	templateBuilder.Append(" <a href=\"http://www.miibeian.gov.cn/\" target=\"_blank\" rel=\"nofollow\">");
	templateBuilder.Append(Utils.ObjectToStr(site.crod));
	templateBuilder.Append("</a> DTcms版本号：");
	templateBuilder.Append(Utils.GetVersion().ToString());

	templateBuilder.Append("</p>\r\n<p>");
	templateBuilder.Append(site.copyright.ToString());

	templateBuilder.Append("</p>\r\n<p><script src=\"http://s24.cnzz.com/stat.php?id=1996164&web_id=1996164&show=pic\" language=\"javascript\"></");
	templateBuilder.Append("script></p>\r\n</div>\r\n</div>\r\n<script src=\"/plugins/qqonline/skin/js/qqonline.js\" language=\"javascript\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
		outHtml = templateBuilder.ToString();
		PageCache.WriteCache(outHtml, config.systemcache, config.cachetime, cacheKey, config.fomatpage);
	}
	Response.Write(outHtml);
}
</script>
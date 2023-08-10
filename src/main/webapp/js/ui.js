// 반응형 체크
var mql = window.matchMedia("all and (min-width: 1457px)");
mql.addListener(function () {
	deviceCheck();
});

// 디바이스 체크
function deviceCheck() {
	if (mql.matches) {
		$("html").removeClass("mobile").addClass("desktop");
	} else {
		var varUA = navigator.userAgent.toLowerCase();
		if (varUA.indexOf("iphone") > -1 || varUA.indexOf("ipad") > -1 || varUA.indexOf("ipod") > -1) {
			$("html").removeClass("desktop").addClass("mobile ios-device");
		} else {
			$("html").removeClass("desktop").addClass("mobile");
		}
	}
}
deviceCheck();

// 테이블 가로스크롤 안내
var infoScroll = [];
//infoScroll += ("<div class='info_scroll'><span>양 옆으로 스크롤하여<br>내용을 확인하실 수 있습니다.");
infoScroll += ("<div class='info_scroll'></div>");

$(function () {
	setTimeout(function () { // 개발 적용 시 setTimeout 삭제
		$(".gnb .depth2>li>a").each(function () {
			if ($(this).siblings(".depth3").length) {
				$(this).addClass("has_depth");
			}
		})
	}, 300)

	// desktop gnb
	$(document).on("mouseenter focusin", ".desktop .gnb > .depth1 > li > a", function () {
		$(".desktop .gnb > .depth1 > li > a").removeClass("active");
		$(this).addClass("active");
		$(".desktop .gnb > .depth1 > li > .depth_wrap").css("display", "table");
	});

	$(document).on("mouseleave", ".desktop .gnb", function () {
		$(".desktop .gnb > .depth1 > li a").removeClass("active");
		$(".desktop .gnb > .depth1 > li > .depth_wrap").hide();
	});

	$(document).on("mouseenter focusin", ".desktop .gnb .depth3 > li > a", function () {
		$(".desktop .gnb .depth2 > li > a").removeClass("active");
		$(this).parent().parent().prev().addClass("active");
	});

	$(document).on("mouseleave focusout", ".desktop .gnb .depth3 > li > a", function () {
		$(this).parent().parent().prev().removeClass("active");
	});

	// mobile gnb
	$(document).on("click", ".mobile .header .btn_menu", function () {
		$(".mobile .header .gnb_wrap").addClass("open");
		$(".mobile .header .gnb .depth_wrap").removeAttr("style");
	});

	$(document).on("click", ".mobile .header .gnb_wrap.open .btn_menu_close", function () {
		$(".mobile .header .gnb_wrap").removeClass("open");
		$(".mobile .header .depth1 > li > a").removeClass("active");
	});

	$(document).on("click", ".mobile .header .gnb>.depth1>li>a", function () {
		$(this).toggleClass("active").parent().siblings().find(">a").removeClass("active");

		if ($(this).hasClass('active')) {
			$(this).parent().siblings().find(">.depth_wrap").hide();
			$(this).siblings().show();
		} else {
			$(this).siblings().hide();
		}

		$('#gnb').scrollTop(0);
		return false;
	});

	$(".mobile .header .gnb > .depth1 > li > .depth_wrap > .depth2 > li").each(function () {
		if ($(this).children().length == 2) {
			$(this).find(">a").addClass("open");
		}
	});

	$(document).on("click", ".mobile .header .gnb .depth2 .has_depth", function () {
		$(this).toggleClass("active");
		return false;
	});

	//lnb
	setTimeout(function () { // 개발 적용 시 setTimeout 삭제
		$(".lnb>.depth2>li>a").each(function () {
			if ($(this).siblings(".depth3").length) {
				$(this).addClass("has_depth");
			}
		})
	}, 300)

	//Quick Menu
	setTimeout(function () { // 개발 적용 시 setTimeout 삭제
		$(".btn_quick_menu").on("click", function () {
			$(this).toggleClass("close");
			if ($(this).hasClass("close")) {
				$(".quick_menu").css("right", "0");
				$('.quick_wrap').find('a').attr('tabindex', 0);
			} else {
				$(".quick_menu").css("right", "-169px");
				$('.quick_wrap').find('a').attr('tabindex', -1);
			}
		})
	}, 300)

	//sns share
	$(document).on("click", ".share_wrap .btn_share", function () {
		$(this).toggleClass('close');
		if ($(this).hasClass("close")) {
			$(this).find(">span").text("공유하기 닫기");
			$(this).siblings('.share_sns_box').find('a').attr('tabindex', 0);
		} else {
			$(this).find(">span").text("공유하기 열기");
			$(this).siblings('.share_sns_box').find('a').attr('tabindex', -1);
		}
	});

	//faq
	$(document).on("click", ".q_box", function () {
		$(this).toggleClass('active');
	});

	$(document).ready(function () {
		$("table").each(function () {
			if ($(this).width() > $(this).parent(".table").width()) {
				if ($(window).width() < 1297) {
					if ($("html").attr("lang") == "ko") {
						$(this).parent(".table").prepend(infoScroll);
					}
				}
			}
		})
		// 모바일로 접속했는지 체크
		var filter = "win16|win32|win64|mac|macintel";
		if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
			// 모바일에서 가로 스크롤이 있는 테이블
			$(document).on("touchstart touchmove touchend", ".info_scroll", function () {
				$(this).fadeOut();
			})
		} else {
			$(document).on("touchstart mousedown click", ".info_scroll", function () {
				$(this).fadeOut();
			})
		}


	})

	// 접근성
	$('.gnb>ul>li:last-child>div>ul>li:last-child>a').on('keydown', function (e) {
		if (e.which == 9 != e.shiftKey && e.which == 9) {
			$(".desktop .gnb > .depth1 > li > a").removeClass("active");
			$(".desktop .gnb > .depth1 > li > .depth_wrap").hide();
		}
	});

	$('.tab a.active').attr('title', '선택됨');
	$('.share_sns_box').find('a').attr('tabindex', -1);
	$('.btn_quick_menu:not(.close)').siblings('.quick_wrap').find('a').attr('tabindex', -1);

	$('.agree_txt').each(function () {
		$(this).attr('tabindex', '0');
	})

	// tab
	$(".tab").each(function () {
		var li = $(this).children().length;

		if (li > 3) {
			$(this).addClass("tab_m_3");
		}

		if (li > 5) {
			$(this).addClass("tab_pc_5");
		}
	})

	// 리사이즈 했을 경우
	$(window).resize(function () {
		if (this.resizeTO) {
			clearTimeout(this.resizeTO);
		}
		this.resizeTO = setTimeout(function () {
			$(this).trigger('resizeEnd');
		}, 100);
	});

	// 리사이즈가 끝났을 경우
	$(window).on("resizeEnd", function () {
		if ($(this).width() < 1297) {
			// mobile

		} else {
			// pc
			// sns share
			$(".unit_button .btn_share").removeClass("close");
		}

		$("table").each(function () {
			if ($(this).width() > $(this).parent(".table").width()) {
				if ($(window).width() < 1137) {
					if (!$(this).parent(".table").find(".info_scroll").length) {
						if ($("html").attr("lang") == "ko") {
							$(this).parent(".table").prepend(infoScroll);
						}
					}
				} else {
					$(this).parent(".table").find(".info_scroll").remove();
				}
			} else {
				$(this).parent(".table").find(".info_scroll").remove();
			}
		})
	})

	// datepicker
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년',
		showOn: "button",
		buttonImageOnly: false,
		buttonText: "달력",
		showOn: "both"
	});
	$(".datepicker").datepicker();

	// 개발 시 "setTimeout" 삭제
	setTimeout(function () {
		$(".btn_banner_site").on('click', function () {
			$(this).parents('.banner_site_wrap').toggleClass('open')
			$(".banner_site").slideToggle(300);
			if ($('.banner_site_wrap').hasClass('open')) {
				$(this).find('>.blind').text('닫기')
			} else {
				$(this).find('>.blind').text('열기')
			}
		})
		$(".btn_family_site").on('click', function () {
			$(this).parents('.family_site_wrap').toggleClass('open')
			$(".family_site").slideToggle(300);
			if ($('.family_site_wrap').hasClass('open')) {
				$(this).find('>.blind').text('닫기')
			} else {
				$(this).find('>.blind').text('열기')
			}
		})
	}, 300)

	// 외부영역 클릭 시 닫기
	$(document).mouseup(function (e) {
		var sitewrap = $(".banner_site_wrap");
		var sitewrap2 = $(".family_site_wrap");
		if (sitewrap.has(e.target).length === 0) {
			sitewrap.removeClass("open");
			$(".banner_site").slideUp(300);
			$(".btn_banner_site").find('>.blind').text('열기')
		}
		if (sitewrap2.has(e.target).length === 0) {
			sitewrap2.removeClass("open");
			$(".family_site").slideUp(300);
			$(".btn_family_site").find('>.blind').text('열기')
		}
	});

	$("#pwd_tk_btn").on('click', function () {
		$(this).toggleClass('on');
	})
});

// 레이어팝업
function fn_open_popup(id, e) {
	$(e).attr('data-wa-btn', 'focus');
	$(".layer_popup_box[data-popup=" + id + "]").show();
	$(".layer_popup_box[data-popup=" + id + "]").attr('tabindex', '0').focus();
	$(".layer_popup_box[data-popup=" + id + "] .popup_content").attr('tabindex', '0')
	layerpopupFocus(id)
}

function fn_hide_popup(id) {
	$(".layer_popup_box[data-popup=" + id + "]").hide();
	$("[data-wa-btn='focus']").focus();
	$("[data-wa-btn='focus']").removeAttr('data-wa-btn');
}

// 레이어팝업 focus 접근성
function layerpopupFocus(id) {
	var focusList = $(".layer_popup_box[data-popup=" + id + "]").find('a, button, div[tabindex="0"]');
	var firstFocus = focusList.eq(0);
	var lastFocus = focusList.eq(focusList.length - 1);
	firstFocus.on({
		'keydown': function (e) {
			if (e.shiftKey && e.keyCode == 9) {
				e.preventDefault();
				$(lastFocus).focus();
			}
		}
	})

	lastFocus.on({
		'keydown': function (e) {
			if (!e.shiftKey && e.keyCode == 9) {
				e.preventDefault();
				$(firstFocus).focus();
			}
		}
	})
}

// 컨텐츠 영역 이미지 캡처 다운로드
function contentCapture() {
	loader('on', '이미지 파일 생성 중입니다.');
	window.setTimeout(function () {
		html2canvas(document.getElementById('contents'), {
			scrollY: (window.pageYOffset * -1)
		}).then(function (canvas) {
			loader('off');
			if (navigator.msSaveBlob) {
				var blob = canvas.msToBlob();
				return navigator.msSaveBlob(blob, $('.contents > .content_top > h3').text() + '.jpg');
			} else {
				var link = document.createElement('a');
				link.href = canvas.toDataURL("image/jpeg");
				link.download = $('.contents > .content_top > h3').text() + '.jpg';
				link.click();
			}
		});
	}, 2000);
}

// 컨텐츠 영역 PDF 다운로드
function contentPdf() {
	loader('on', 'PDF 생성 중입니다.');
	window.setTimeout(function () {
		html2canvas(document.getElementById('contents'), {
			scrollY: (window.pageYOffset * -1)
		}).then(function (canvas) {
			var imgData = canvas.toDataURL('image/jpeg');
			var imgWidth = 210;
			var pageHeight = imgWidth * 1.414;
			var imgHeight = canvas.height * imgWidth / canvas.width;
			var heightLeft = imgHeight;
			var doc = new jsPDF('p', 'mm');
			var position = 0;


			doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;

			while (heightLeft >= 20) {
				position = heightLeft - imgHeight;
				doc.addPage();
				doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
				heightLeft -= pageHeight;
			}

			doc.save($('.contents > .content_top > h3').text() + '.pdf');
			loader('off');
		});
	}, 2000);
}

function loader(mode, msg) {
	if (mode == 'on') {
		//$(window).scrollTop(0);
		$('body').append('<div class="loader"><div class="spin"></div><div class="id-msg">' + msg + '</div></div>');
	} else {
		$('.loader').remove();
	}
}

// url 복사
function url_copy(type, params) {
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);

	url = window.document.location.href;

	if (type !== undefined && type != "") {
		url = url.split("?")[0] + "?"
		url += params;
	}

	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

// 서브페이지 현재 메뉴 활성화
// 개발 시 삭제
function currentPage(dep2, dep3) {
	$(".aside>nav>ul>li").eq(dep2 - 1).find(">a").addClass("active");
	if (dep3) {
		$(".aside>nav>ul>li").eq(dep2 - 1).find(">ul>li").eq(dep3 - 1).find(">a").addClass("active");
	}
}

// 전체 메뉴 실행
function allMenu() {
	if (mql.matches) {
		$('body').addClass('all_menu_open');
	}
}

// 전체 메뉴 닫기
function allMenuClose() {
	$('body').removeClass('all_menu_open');
}

// 헤더 언어 설정
function langOpen() {
	$('.lang_select').toggleClass('open')
}

$(function () {
	// 통합검색 헤더
	if ($('.search_header').length) {
		$(window).on('load scroll', function () {
			if ($(document).scrollTop()) {
				$('.search_header').addClass('scrolled')
			} else {
				$('.search_header').removeClass('scrolled')
			}
		})
	}
    
	//통합검색 상세
	$('.search_option .btn_expand').on('click', function () {
		$(this).parents('.search_option').toggleClass('expand');
		$('.option_wrap').slideToggle();
	})
    
    //가중치 설정, 검색결과 정렬 버튼
    $('.range_setting .btn_setting').on('click', function () {
		$(this).parents('.range_setting').toggleClass('rotate_01');
        $('.set_ran_container').slideToggle();
    });
    $('.range_setting .btn_array_date').on('click', function () {
		$(this).parents('.range_setting').toggleClass('rotate_02');
    });
    $('.range_setting .btn_array_title').on('click', function () {
		$(this).parents('.range_setting').toggleClass('rotate_03');
    });
    $('.range_setting .btn_array_count').on('click', function () {
		$(this).parents('.range_setting').toggleClass('rotate_04');
    });
    $('.range_setting .btn_array_popular').on('click', function () {
		$(this).parents('.range_setting').toggleClass('rotate_05');
    });
})
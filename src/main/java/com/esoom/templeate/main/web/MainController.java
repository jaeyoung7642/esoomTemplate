package com.esoom.templeate.main.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.SlideVO;
import com.esoom.templeate.etc.service.EtcService;
import com.esoom.templeate.movie.service.MovieService;
import com.esoom.templeate.news.service.NewsService;
import com.esoom.templeate.photo.service.PhotoService;


@Controller
public class MainController {
	@Autowired
	private EtcService etcService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private PhotoService photoService;
	
	@GetMapping("/main.do")
	public String main(ModelMap model) throws Exception {
		SlideVO slideVO = new SlideVO();
		BoardVO boardVO = new BoardVO();
		//메인슬라이드영역
		List<?> mainSlideList = etcService.mainSlideHome(slideVO);
		//뉴스영역
		List<?> newsList = newsService.newsHome(boardVO);
		//미디어 영역
		List<?> mediaUList = movieService.mediaUHome(boardVO);//유튜브2개
		List<?> mediaSList = movieService.mediaSHome(boardVO);//숏츠2개
		List<?> photoList = photoService.photoHome(boardVO);//사진5개
		model.addAttribute("mainSlideList", mainSlideList);
		model.addAttribute("newsList", newsList);
		model.addAttribute("mediaUList", mediaUList);
		model.addAttribute("mediaSList", mediaSList);
		model.addAttribute("photoList", photoList);
		return "main/main";
	}
	@RequestMapping(value = "/header.do", method = RequestMethod.GET)
	public String header() {
		return "common/header";
	}
	@RequestMapping(value = "/footer.do", method = RequestMethod.GET)
	public String footer() {
		return "common/footer";
	}
	@RequestMapping(value = "/scheduleList.do", method = RequestMethod.GET)
	public String scheduleList() {
		return "dummy/scheduleList";
	}
	@RequestMapping(value = "/teamRank.do", method = RequestMethod.GET)
	public String teamRank() {
		return "dummy/teamRank";
	}
	@RequestMapping(value = "/playerRank.do", method = RequestMethod.GET)
	public String playerRank() {
		return "dummy/playerRank";
	}
	@RequestMapping(value = "/teamRecord.do", method = RequestMethod.GET)
	public String teamRecord() {
		return "dummy/teamRecord";
	}
	@RequestMapping(value = "/playerRecord.do", method = RequestMethod.GET)
	public String plyerRecord() {
		return "dummy/playerRecord";
	}
	@RequestMapping(value = "/ticket.do", method = RequestMethod.GET)
	public String ticket() {
		return "dummy/ticket";
	}
	@RequestMapping(value = "/ticketFaq.do", method = RequestMethod.GET)
	public String ticketFaq() {
		return "dummy/ticketFaq";
	}
	@RequestMapping(value = "/coachList.do", method = RequestMethod.GET)
	public String coachList() {
		return "dummy/coachList";
	}
	@RequestMapping(value = "/playerList.do", method = RequestMethod.GET)
	public String playerList() {
		return "dummy/playerList";
	}
	@RequestMapping(value = "/cheer.do", method = RequestMethod.GET)
	public String cheer() {
		return "dummy/cheer";
	}
	@RequestMapping(value = "/cheer_song.do", method = RequestMethod.GET)
	public String cheer_song() {
		return "dummy/cheer_song";
	}
	@RequestMapping(value = "/jrInfo.do", method = RequestMethod.GET)
	public String jrInfo() {
		return "dummy/jrInfo";
	}
	@RequestMapping(value = "/jrTeacher.do", method = RequestMethod.GET)
	public String jrTeacher() {
		return "dummy/jrTeacher";
	}
	@RequestMapping(value = "/front.do", method = RequestMethod.GET)
	public String front() {
		return "dummy/front";
	}
	@RequestMapping(value = "/ci.do", method = RequestMethod.GET)
	public String ci() {
		return "dummy/ci";
	}
	@RequestMapping(value = "/busan_gym.do", method = RequestMethod.GET)
	public String busan_gym() {
		return "dummy/busan_gym";
	}
	@RequestMapping(value = "/yongin_gym.do", method = RequestMethod.GET)
	public String yongin_gym() {
		return "dummy/yongin_gym";
	}
	@RequestMapping(value = "/all_gym.do", method = RequestMethod.GET)
	public String all_gym() {
		return "dummy/all_gym";
	}
	@RequestMapping(value = "/chistory.do", method = RequestMethod.GET)
	public String chistory() {
		return "dummy/chistory";
	}
	@RequestMapping(value = "/phistory.do", method = RequestMethod.GET)
	public String phistory() {
		return "dummy/phistory";
	}
	@RequestMapping(value = "/seasonReview.do", method = RequestMethod.GET)
	public String seasonReview() {
		return "dummy/review";
	}
	@RequestMapping(value = "/sponsor.do", method = RequestMethod.GET)
	public String sponsor() {
		return "dummy/sponsor";
	}
	@RequestMapping(value = "/kccadList.do", method = RequestMethod.GET)
	public String kccadList() {
		return "dummy/kccadList";
	}
	@RequestMapping(value = "/eventList.do", method = RequestMethod.GET)
	public String eventList() {
		return "dummy/eventList";
	}
	@RequestMapping(value = "/wallpaperList.do", method = RequestMethod.GET)
	public String wallpaperList() {
		return "dummy/wallpaperList";
	}
}

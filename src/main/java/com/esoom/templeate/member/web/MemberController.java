package com.esoom.templeate.member.web;



import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.Mac;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoom.templeate.admin.service.AdminVO;
import com.esoom.templeate.admin.service.BoardTailVO;
import com.esoom.templeate.admin.service.BoardVO;
import com.esoom.templeate.admin.service.FreeBoardVO;
import com.esoom.templeate.admin.service.MemberVO;
import com.esoom.templeate.common.AesUtil;
import com.esoom.templeate.common.IpUtil;
import com.esoom.templeate.common.ShaUtil;
import com.esoom.templeate.free.service.FreeService;
import com.esoom.templeate.member.service.MemberService;
import com.esoom.templeate.movie.service.MovieService;
import com.esoom.templeate.notice.service.NoticeService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FreeService freeService;
	@Autowired
	private ShaUtil shaUtil;
	@Autowired
	private IpUtil ipUtil;
	@Autowired
    private AesUtil aesUtil;
	
	@GetMapping("/loginForm.do")
	public String loginForm(ModelMap model,HttpServletRequest request) throws Exception {
		String id = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("remember")) {
					id = cookie.getValue();
				}
			}
		}
		request.setAttribute("remember", id);
		return "member/loginForm";
	}
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public Map<String, Object> adminLogin(HttpSession session, @ModelAttribute("MemberVO") MemberVO memberVO,String remember,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		String returnUrl = "";
		if(remember == null) {
			remember = "";
		}
		System.out.println(memberVO.getId());
		// 입력한 아이디로 사용자 정보 조회
		MemberVO userInfo = memberService.getMember(memberVO);
		System.out.println("userInfo"+userInfo);
		if (userInfo != null) {
			if (remember.equals("on")) {
	            Cookie cookie = new Cookie("remember", userInfo.getId());
	            response.addCookie(cookie);
	        } else {
	            Cookie cookie = new Cookie("remember", "");
	            response.addCookie(cookie);
	        }
			// 비밀번호 암호화된 정보와 입력한 비밀번호 비교
			String pwd = shaUtil.encrypt(memberVO.getPwd());
			if (pwd.equals(userInfo.getSha_pwd())) { // 로그인 성공
				int cnt = memberService.loginUpdate(userInfo);
				if(cnt>0) {
					session.setAttribute("loginUserMap", userInfo);
					result.put("loginMsg", "");
				}else {
					result.put("loginMsg", "로그인중 오류가 발생했습니다. 관리자에게 문의하세요.");
				}
			} else {// 비밀번호가 틀렸을 경우
				System.out.println("3");
				result.put("loginMsg", "아이디 및 비밀번호를 확인해주세요.");
			}
		} else { // 아이디가 없을 경우
			System.out.println("4");
			result.put("loginMsg", "아이디 및 비밀번호를 확인해주세요.");
		}
		return result;
	}
	@GetMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main.do";
	}
	@GetMapping("/mypage.do")
	public String mypage(ModelMap model,HttpServletRequest request,HttpSession session) throws Exception {
		BoardVO boardVO = new BoardVO();
		FreeBoardVO freeBoardVO = new FreeBoardVO();
		MemberVO loginUserMap = (MemberVO) session.getAttribute("loginUserMap");
		freeBoardVO.setId(loginUserMap.getId());
		List<?> movieList = movieService.mypageMovieList(boardVO);
		model.addAttribute("movieList", movieList);
		
		List<?> noticeList = noticeService.mypageNoticeList(boardVO);
		model.addAttribute("noticeList", noticeList);

		List<?> freeList = freeService.mypageFreeList(freeBoardVO);
		model.addAttribute("freeList", freeList);
		
		
		
		return "member/mypage";
	}
	@GetMapping("/joinForm1.do")
	public String joinForm1(ModelMap model) throws Exception {
		return "member/joinForm1";
	}
	@GetMapping("/joinForm2.do")
	public String joinForm2(ModelMap model,HttpServletRequest request,HttpSession session) throws Exception {
		String tURL = "https://svc.niceapi.co.kr:22001/digital/niceid/oauth/oauth/token";
		String uParam="grant_type=client_credentials&scope=default";
		
		String clientID="605a8ef0-4a9a-459a-95af-212b06a8b275";
		String secretKey="426bc5973f865c56d601474883f53655";
		
		String Auth = Base64.getEncoder().encodeToString((clientID+":"+secretKey).getBytes());
		String responseData = testHttpRequest(tURL, uParam,Auth);
		String access_token="";
		
		try{
		    JSONParser jsonParse = new JSONParser();
		    JSONObject jsonObj = (JSONObject) jsonParse.parse(responseData);
		    JSONObject dataBody = (JSONObject) jsonParse.parse(jsonObj.get("dataBody").toString());
		    
		    access_token= dataBody.get("access_token").toString();
		            
		}catch (ParseException e){
		    e.printStackTrace();
		}

		String client_id = "605a8ef0-4a9a-459a-95af-212b06a8b275";
		String productID = "2101979031";
	    
	    //운영용
//		String returnURL = request.getScheme()+"://"+request.getServerName()+"/niceResult";
		//개발용
//		String returnURL = "http://kccdev.esoom.co.kr:8080/niceResult";

		String returnURL = "http://123.143.147.76:8081/niceResult.do";
	    //URL의 경우 프로토콜(http/https)부터 사용바랍니다. 다를 경우 CORS 오류가 발생 할 수 있습니다.
	    //예) http://localhost/checkplus_success.jsp
	    
	    SimpleDateFormat TestDate = new SimpleDateFormat("yyyyMMddhhmmss");
	        
	    String req_dtim = TestDate.format(new Date());    
	    String req_no="REQ"+req_dtim+Double.toString(Math.random()).substring(2,6);
	    //요청고유번호(req_no)의 경우 업체 정책에 따라 거래 고유번호 설정 후 사용하면 됩니다.
	    //제공된 값은 예시입니다.
	    
	    Date currentDate = new Date();
	    long current_timestamp = currentDate.getTime() /1000;
	    
	     Auth = Base64.getEncoder().encodeToString((access_token+":"+current_timestamp+":"+client_id).getBytes());
	    
	     tURL = "https://svc.niceapi.co.kr:22001/digital/niceid/api/v1.0/common/crypto/token";
	    
	     uParam="{\"dataHeader\":{\"CNTY_CD\":\"kr\"},"
	            + "\"dataBody\":{\"req_dtim\":\""+req_dtim+"\","
	            +"\"req_no\":\""+req_no+"\","
	            +"\"enc_mode\":\"1\""
	            + "}}";
	    
	     responseData = testHttpRequest(tURL, uParam, Auth, productID);
	    
	    
	    String token_version_id = "";
	    String sitecode = "";
	    String token_val = "";    
	    
	    try{
	        JSONParser jsonParse = new JSONParser();
	        JSONObject jsonObj = (JSONObject) jsonParse.parse(responseData);
	                
	        JSONObject dataBody = (JSONObject) jsonParse.parse(jsonObj.get("dataBody").toString());
	        
	        token_version_id = dataBody.get("token_version_id").toString();
	        sitecode = dataBody.get("site_code").toString();
	        token_val = dataBody.get("token_val").toString();
	                
	    }catch (ParseException e){
	        e.printStackTrace();
	    }
	    
	    String result = req_dtim.trim()+req_no.trim()+token_val.trim();

	    String resultVal = encryptSHA256(result);
	    
	    String key =resultVal.substring(0,16);
	    String iv =resultVal.substring(resultVal.length()-16);
	    String hmac_key =resultVal.substring(0,32);
	    
	    String plain ="{"
	    +"\"requestno\":\""+req_no+"\","
	    +"\"returnurl\":\""+returnURL+"\","
	    +"\"sitecode\":\""+sitecode+"\","
	    +"\"methodtype\":\"get\""
	    +"}";
	    
	    String enc_data = encryptAES(plain, key, iv);

	    byte[] hmacSha256 = hmac256(hmac_key.getBytes(), enc_data.getBytes());
	    String integrity = Base64.getEncoder().encodeToString(hmacSha256);
	    
	    // 인증 완료 후 success페이지에서 사용을 위한 key값은 DB,세션등 업체 정책에 맞춰 관리 후 사용하면 됩니다.
	    // 예시에서 사용하는 방법은 세션이며, 세션을 사용할 경우 반드시 인증 완료 후 세션이 유실되지 않고 유지되도록 확인 바랍니다. 
	    // key, iv, hmac_key 값들은 token_version_id에 따라 동일하게 생성되는 고유값입니다.
	    // success페이지에서 token_version_id가 일치하는지 확인 바랍니다.
	    session.setAttribute("req_no", req_no);
	    session.setAttribute("key" , key);
	    session.setAttribute("iv" , iv);
	    session.setAttribute("hmac_key" , hmac_key);
	    session.setAttribute("token_version_id", token_version_id);
	    String check3 = request.getParameter("check3");
	    session.setAttribute("check3", check3);
	    model.addAttribute("enc_data",enc_data);
	    model.addAttribute("token_version_id",token_version_id);
	    model.addAttribute("integrity_value",integrity);
		return "member/joinForm2";
	}
	@RequestMapping(value = "/joinForm3.do", method = RequestMethod.GET)
	public String joinForm3(ModelMap model,HttpServletRequest request,HttpSession session) throws Exception {
		String name= (String)session.getAttribute("name");
		String gender= (String)session.getAttribute("gender");
		String birthdate= (String)session.getAttribute("birthdate");
		String di= (String)session.getAttribute("di");
		String mobileno= (String)session.getAttribute("mobileno");
		String adYn= (String)session.getAttribute("check3");
		String yyyy = birthdate.substring(0,4);
		String mm = birthdate.substring(4, 6);
		String dd = birthdate.substring(6, 8);
		 // LocalDate 객체 생성
        LocalDate birthDate = LocalDate.of(Integer.parseInt(yyyy), Integer.parseInt(mm), Integer.parseInt(dd));
        LocalDate today = LocalDate.now();
        // 만나이 계산
        int age = today.getYear() - birthDate.getYear();
        // 생일이 지나지 않았으면 만나이 -1
        if (today.isBefore(birthDate.plusYears(age))) {
            age--;
        }
        // 만나이가 14세 미만인지 확인
        if (age < 14) {
        	model.addAttribute("msg", "만 14세 미만은 가입하실 수 없습니다");
			return "redirect:/joinForm1";
        }
		String fistNum = mobileno.substring(0, 3); // '010'
        String middleNum = mobileno.substring(3, 7); // '0000'
        String lastNum = mobileno.substring(7, 11);  // '0000'
        Map<String, Object> paramMap = new HashMap<String, Object>();
        model.addAttribute("name", name);
        model.addAttribute("gender", gender);
        model.addAttribute("birthdate", birthdate);
        model.addAttribute("di", di);
        model.addAttribute("mobileno", mobileno);
        model.addAttribute("yyyy", yyyy);
        model.addAttribute("mm", mm);
        model.addAttribute("dd", dd);
        model.addAttribute("fistNum", fistNum);
        model.addAttribute("middleNum", middleNum);
        model.addAttribute("lastNum", lastNum);
        model.addAttribute("adYn", adYn);
		return "member/joinForm3";
	}
	@RequestMapping(value = "/joinForm4.do", method = RequestMethod.GET)
	public String joinForm4(ModelMap model) throws Exception {
    	return "member/joinForm4";
    }
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
    public String join(ModelMap model,@ModelAttribute("MemberVO") MemberVO memberVO,HttpServletRequest request,HttpSession session) throws Exception {
    	String di = (String)session.getAttribute("di");
    	String ip = ipUtil.getClientIP(request);
    	
    	memberVO.setPwd(shaUtil.encrypt(memberVO.getPwd()));
    	String tel = memberVO.getFistNum()+"-"+memberVO.getMiddleNum()+"-"+memberVO.getLastNum();
    	tel = aesUtil.encryptAes2(tel);
    	memberVO.setTel(tel);
    	
    	String jumin = memberVO.getYyyy()+"-"+memberVO.getMm()+"-"+memberVO.getDd();
    	jumin = aesUtil.encryptAes2(jumin);
    	memberVO.setJumin(jumin);
    	String email = memberVO.getEmail_id()+"@"+memberVO.getEmail_domain();
    	email = aesUtil.encryptAes2(email);
    	memberVO.setEmail(email);
    	if("".equals(memberVO.getChk_email()) || memberVO.getChk_email() == null) {
    		memberVO.setChk_email("N");
    	}
    	memberVO.setZipcode(aesUtil.encryptAes2(memberVO.getZipcode()));
    	memberVO.setAddr(aesUtil.encryptAes2(memberVO.getAddr()));
    	memberVO.setDaddr(aesUtil.encryptAes2(memberVO.getDaddr()));
    	memberVO.setDi(di);
    	memberVO.setIp(ip);
    	MemberVO duplicateDi = memberService.duplicateDi(memberVO);
    	int result = 0;
    	if(duplicateDi != null) {
    		model.addAttribute("msg", "가입 이력이 있는 회원입니다");
    		return "redirect:/joinForm1";
    	}else {
    		result = memberService.insertMember(memberVO);
    	}
    	String returnUrl ="";
    	if (result > 0) {
    		MemberVO loginUserMap = memberService.getMember(memberVO);
    		if (loginUserMap != null && loginUserMap.toString() != "") {
    			session.setAttribute("loginUserMap", loginUserMap);
    		}
    		returnUrl = "redirect:/joinForm4";
    	}else {
    		model.addAttribute("msg", "서버 오류! 관리자에게 문의 바랍니다.");
    		returnUrl = "redirect:/joinForm3";
    	}
    	return returnUrl;
    }
	@RequestMapping(value = "/niceResult.do", method = RequestMethod.GET)
	public String niceResult(ModelMap model,HttpServletRequest request,HttpSession session,
			@RequestParam(value = "enc_data") String enc_data,
			@RequestParam(value = "token_version_id") String token_version_id,
			@RequestParam(value = "integrity_value") String integrity_value) throws Exception {
		String req_no = (String)session.getAttribute("req_no");
	    String key = (String)session.getAttribute("key");
	    String iv = (String)session.getAttribute("iv");
	    String hmac_key = (String)session.getAttribute("hmac_key");
	    String s_token_version_id = (String)session.getAttribute("token_version_id");
	    String enctime ="";
	    String requestno ="";
	    String responseno ="";
	    String authtype ="";
	    String name ="";
	    String birthdate = "";
	    String gender ="";
	    String nationalinfo="";
	    String ci ="";
	    String di ="";
	    String mobileno ="";
	    String mobileco ="";

	    String sMessage ="";
	            
	     byte[] hmacSha256 = hmac256(hmac_key.getBytes(), enc_data.getBytes());
	    String integrity = Base64.getEncoder().encodeToString(hmacSha256);
	    
	    
	    if (!integrity.equals(integrity_value)){
	        sMessage = "무결성 값이 다릅니다. 데이터가 변경된 것이 아닌지 확인 바랍니다.";
	    }else{
	        String dec_data = getAesDecDataPKCS5(key.getBytes(), iv.getBytes(), enc_data);
	        
	        JSONParser jsonParse = new JSONParser();
	        JSONObject plain_data = (JSONObject) jsonParse.parse(dec_data);
	        
	        if (!req_no.equals(plain_data.get("requestno").toString())){
	            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
	        }else{
	            sMessage = "복호화 성공";
	            
	            enctime =plain_data.get("enctime").toString();
	            requestno =plain_data.get("requestno").toString();
	            responseno =plain_data.get("responseno").toString();
	            authtype =plain_data.get("authtype").toString();
	            name = URLDecoder.decode(plain_data.get("utf8_name").toString(), "UTF-8");
	            birthdate = plain_data.get("birthdate").toString();
	            gender =plain_data.get("gender").toString();
	            nationalinfo=plain_data.get("nationalinfo").toString();
	            ci =plain_data.get("ci").toString();
	            di =plain_data.get("di").toString();
	            mobileno =plain_data.get("mobileno").toString();
	            mobileco =plain_data.get("mobileco").toString();
	            session.setAttribute("name", name);
	            session.setAttribute("di", di);
	            session.setAttribute("gender", gender);
	            session.setAttribute("birthdate", birthdate);
	            session.setAttribute("mobileno", mobileno);
	        }
	    } 
		return "member/niceResult";
	}
	@ResponseBody
	@RequestMapping(value = "/duplicateId.do", method = RequestMethod.GET)
	public String duplicateId(@ModelAttribute("MemberVO") MemberVO memberVO)throws Exception {
    	String result ="true"; 
		int cnt = memberService.duplicateMember(memberVO);
		System.out.println("cnt=========="+cnt);
		if(cnt >0) {
			result = "false";
		}
		return result;
	}
	@ResponseBody
    @RequestMapping(value = "/duplicateEmail.do", method = RequestMethod.GET)
    public String duplicateEmail(@ModelAttribute("MemberVO") MemberVO memberVO)throws Exception {
    	String result ="true"; 
    	memberVO.setEmail(aesUtil.encryptAes2(memberVO.getEmail()));
    	int cnt = memberService.duplicateMember(memberVO);
    	System.out.println("cnt=========="+cnt);
    	if(cnt >0) {
    		result = "false";
    	}
    	return result;
    }
	public static String testHttpRequest(String targetURL, String parameters , String Auth) {
        HttpURLConnection connection = null;
        
            try {
                URL url = new URL(targetURL);
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST"); 
                connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
                connection.setRequestProperty("Authorization","Basic "+Auth);
                connection.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream (connection.getOutputStream());
                     
                wr.writeBytes(parameters);
                wr.close();
                
                InputStream is = connection.getInputStream();
                
                BufferedReader rd = new BufferedReader(new InputStreamReader(is, "utf-8"));
                StringBuilder response = new StringBuilder(); 
                String line;
                while ((line = rd.readLine()) != null) {
                    response.append(line);
                    response.append('\r');
                }
                rd.close();
                return response.toString();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }
        }
	//대칭키 생성을 위한 함수
    public static String encryptSHA256(String result)throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(result.getBytes());
        byte[] arrHashValue = md.digest();
        String resultVal = Base64.getEncoder().encodeToString(arrHashValue);

        return resultVal;
    }
        
    //암호화를 위한 함수
    public static String encryptAES(String reqData, String key, String iv) 
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException,
            InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException{
        SecretKey secureKey = new SecretKeySpec(key.getBytes(), "AES");
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(iv.getBytes()));
        byte[] encrypted = c.doFinal(reqData.trim().getBytes());
        String reqDataEnc =Base64.getEncoder().encodeToString(encrypted);
        
        return reqDataEnc;
    }
    
    //무결성값 생성을 위한 함수
    public static byte[] hmac256(byte[] secretKey,byte[] message) 
            throws NoSuchAlgorithmException, InvalidKeyException{
        byte[] hmac256 = null;
        Mac mac = Mac.getInstance("HmacSHA256");
        SecretKeySpec sks = new SecretKeySpec(secretKey, "HmacSHA256");
        mac.init(sks);
        hmac256 = mac.doFinal(message);
        
        return hmac256;     
      }
    public static String testHttpRequest(String targetURL, String parameters , String Auth, String productID) {
        HttpURLConnection connection = null;
        
        try {
            URL url = new URL(targetURL);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST"); 
            connection.setRequestProperty("Content-Type","application/json");
            connection.setRequestProperty("Authorization","bearer "+Auth);
            connection.setRequestProperty("productID", productID);
            connection.setDoOutput(true);
            
            DataOutputStream wr = new DataOutputStream (connection.getOutputStream());
            
            wr.writeBytes(parameters);
            wr.close();
            InputStream is = connection.getInputStream();
            
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, "utf-8"));
            
            StringBuilder response = new StringBuilder(); 
            String line;
            while ((line = rd.readLine()) != null) {
                response.append(line);
                response.append('\r');
            }
            rd.close();
            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (connection != null) {
            connection.disconnect();
            }
        }
    }
    public static String getAesDecDataPKCS5(byte[] key, byte[] iv, String base64Enc) throws Exception {
        SecretKey secureKey = new SecretKeySpec(key, "AES");
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(iv));
        byte[] cipherEnc = Base64.getDecoder().decode(base64Enc);
                
        String Dec = new String(c.doFinal(cipherEnc), "utf-8");
                
        return Dec;
    }
}

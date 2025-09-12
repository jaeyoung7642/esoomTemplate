package egovframework.com.cmm.web;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.egovframe.rte.fdl.cryptography.EgovEnvCryptoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스
 * 
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일          수정자        수정내용
 *  ----------     --------    ---------------------------
 *  2009.03.25     이삼섭        최초 생성
 *  2016.10.13     장동한        deleteFileInf 메소드 return 방식 수정
 *  2022.12.02     윤창원        File ID 암호화 처리
 *  2022.12.22     신용호        JSTL 커스텀 태그 추가 및 기능 보완
 *
 *      </pre>
 */
@Controller
public class EgovFileMngController {

	/** 로그설정 */
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngController.class);

	/** 암호화서비스 */
	private static EgovEnvCryptoService cryptoService;

	@Resource(name = "egovEnvCryptoService")
	public void setEgovEnvCryptoService(EgovEnvCryptoService cryptoService) {
		this.cryptoService = cryptoService;
	}

	/**
	 * 원본 문자열을 암호화 하는 메서드.
	 * @param source 원본 문자열
	 * @return 암호화 문자열
	 */
	public static String decrypt(String base64AtchFileId) {
		String returnVal = "FILE_ID_DECRIPT_EXCEPTION_02";
		if (base64AtchFileId!=null && !"".equals(base64AtchFileId)) {
			try {
				returnVal = cryptoService.decrypt(base64AtchFileId);
			} catch (Exception e) {
				LOGGER.debug(e.getMessage());
			}
		}
		return returnVal;
	}

}
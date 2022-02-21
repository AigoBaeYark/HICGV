package com.hicgv.main.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import oracle.net.aso.p;
import oracle.security.crypto.core.Padding.ID;

public class getMoviesCrawlFinal {

	// 여기서 API 2개와 CGV 사이트 사용해야함
	// 영화진흥위원회에서 가져와야 할것
	// 사용이유 - 영화코드 단일화 및 영화정보를 한번에 가져오기 위해
	// KEY=e65350d6dfb171753380a52de708b7a8
	// 영화코드(movieCd) 값 1개
	// 랭크 (rank) api에서 가져오거나 계산하거나
	// 영화배우(actors) 값 여러개 - 받으면서 풀지 받고나서 풀지?
	// 영화이름한글(movieNm)
	// 영화이름영문(movieNmOg)
	// 개봉일(openDt)
	// 장르(genreAlt)
	// 제작국가이름(nationNm)
	// 제작국가코드?(nations)
	// 상영시간(showTm)
	// 관람객오늘(audiCnt)
	// 관람객누적(audiAcc)
	// 관람객어제(계산필요 audiInten) --전일 대비 관객수 증감분을 출력

	// 일별 박스오피스 주소 (당일날 관람객은 안나오고 당일 전날까지 나옴)
	// http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json
	// 꼭 넣어야 할 값 targetDt=랭크를 알고싶은 날짜
	// 여기서 가져올것
	// 영화코드(movieCd), 관람객오늘(audiCnt), 관람객누적(audiAcc), 관람객누적(audiAcc), 관람객어제(계산필요
	// audiInten), 랭크(rank)
	//
	// 영화 목록
	// http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json
	// 꼭 넣어야 할 값 최신페이지일수록 최신영화 curPage = (default = 1) 한페이지에 기본적으로 10개의 영화가 나옴
	// 영화이름(movieNm utf-8형식)으로도 조회가능
	// 여기서 가져올것
	// 최신 영화코드(movieCd), 개봉일(openDt), 제작국가이름(nationNm), 제작국가코드?(nations)
	//
	// 영화 상세정보
	// http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json
	// 꼭 넣어야 할 값 영화코드(movieCd)
	// 여기서 가져올것
	// 영화배우(actors) 값 여러개 - 받으면서 풀지 받고나서 풀지?, 영화이름한글(movieNm), 영화이름영문(movieNmOg),
	// 개봉일(openDt),
	// 장르(genreAlt), 제작국가이름(nationNm), 제작국가코드?(nations), 상영시간(showTm)
	// 여기까지 영화진흥위원회 API

	// 네이버 영화검색 API
	// 사용이유 - 영화진흥위원회에는 영화 줄거리나 사진, 영상같은것이 없기때문에 다른곳에서 가져와야 함
	// https://openapi.naver.com/v1/search/movie.json
	// 꼭 넣어야 할 값 검색내용(query)-영화제목 여기서 더 비교하려면 검색을 원하는 영화의 최소 제작년도(yearfrom)
	// 기본적으로 10개 가져옴
	// 여기서 가져올것
	// 제목(title) = DB혹은 영화진흥위원API와 대조해서 같으면 데이터 가져옴(혹은 제작년도 pubDate, 감독 director 까지
	// 비교해야 할 수도-이름중복영화제거)
	// 포스터(image) = 이거 화질 안좋음
	// 영화정보링크(link) = 여기로 들어가서 포스터이미지, 사진, 영상같은거 따올수도 있음

	// 영화진흥위원회
	private static final String DAILYURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
	private static final String MOVIELISTURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json";
	private static final String MOVIEINFOURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
	private static final String MOVIEAPIKEY = "e65350d6dfb171753380a52de708b7a8";

	// 네이버
	private static final String NAVERAPIURL = "https://openapi.naver.com/v1/search/movie.json";
	private static String NAVERID = "reYcpdl2OMmpJINXgbNk";
	private static String NAVERSECRET = "27N9KP87tK";

	private String searchTitle;
	private String day;

	// 제목으로 검색 (영화API, 네이버API 둘 다 UTF-8로 변경해줘야함)
	public void searchToTitleNaver(String searchTitle) {
		String naverResult = null;
		try {
			this.searchTitle = URLEncoder.encode(searchTitle, "UTF-8");
			naverResult = readyNaver(this.searchTitle);
		} catch (Exception e) {
			throw new RuntimeException("영화타이틀 변환 실패", e);
		}
		parseNaverData(naverResult);

	}


	// 네이버 API 시작
	private String readyNaver(String searchTitle) {
		// 검색할 내용
		String naverUrl = NAVERAPIURL + "?query=" + searchTitle;
		Map<String, String> requestHeaders = new HashMap<String, String>();
		// 네이버 API는 request를 해야 사용가능
		requestHeaders.put("X-Naver-Client-Id", NAVERID);
		requestHeaders.put("X-Naver-Client-Secret", NAVERSECRET);
		String responseBody = getNaver(naverUrl, requestHeaders);

		return responseBody;
	}

	private String getNaver(String naverUrl, Map<String, String> requestHeaders) {
		// 주소를 불러오기
		HttpURLConnection con = naverConnect(naverUrl);

		try {
			// get방식으로 가져옴
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				// 리퀘스트 요청
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				// 정상호출
				return readNaverBody(con.getInputStream());
			} else {
				// 에러발생
				return readNaverBody(con.getErrorStream());
			}

		} catch (Exception e) {
			throw new RuntimeException("API 요청 및 응답 실패");
		}

	}

	private HttpURLConnection naverConnect(String naverUrl) {
		// 주소 가져오기
		try {
			URL naverApiUrl = new URL(naverUrl);
			return (HttpURLConnection) naverApiUrl.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못됨", e);
		} catch (Exception e) {
			throw new RuntimeException("연결실패", e);
		}

	}

	private String readNaverBody(InputStream body) {
		// 여기서 요청된 후 주소결과값을 보내줌(json 내용이 담김)
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder naverResponseBody = new StringBuilder();
			String line;
			while ((line = lineReader.readLine()) != null) {
				naverResponseBody.append(line);
			}
			return naverResponseBody.toString();

		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패함", e);
		}

	}

	private void parseNaverData(String responseBody) {
		// 받은 json 내용을 여기서 정리
		String title; // 영화 제목
		String link; // 영화 링크
		String image; // 영화 포스터링크

		try {
			JSONObject jsonObject = new JSONObject(responseBody);
			// System.out.println(jsonObject.get("items"));
			JSONArray obj = jsonObject.getJSONArray("items");
			System.out.println(obj);
			for (int i = 0; i < obj.length(); i++) {
				JSONObject item = obj.getJSONObject(i);

				title = item.getString("title");
				link = item.getString("link");
				image = item.getString("image");

				System.out.println("title : " + title + " link : " + link + " image : " + image);
			}

		} catch (Exception e) {
			throw new RuntimeException("데이터 불러오기 실패", e);
		}

	}

	// 네이버 API 끝 //링크따라가서 이미지, 영상 같은거 따올려면 내용 더 추가

	// 영화진흥위원회

	public void searchToDate(String day) {
		// 일별 관람객 및 랭크를 가져오고싶은 날짜 (오늘날짜 제외)
		this.day = day;
		String dailyResult = getMovieUrlJson(getDailyMovieApiUrl());
		System.out.println("daily : "+dailyResult);
		parseDailyData(dailyResult);
	}
	
	public void searchToTitleMovieInfoApi(String searchTitle) {
		
		this.searchTitle = searchTitle; 
		String movieInfoResult = getMovieUrlJson(getMovieInfoApiUrl());
		System.out.println("movieInfo : "+movieInfoResult);
		//parseMovieInfoData(movieInfoResult);
		
	}

	

	private String getDailyMovieApiUrl() {
		String movieUrl = DAILYURL + "?key=" + MOVIEAPIKEY + "&targetDt=" + day;

		return movieUrl;
	}
	private String getMovieInfoApiUrl() {
		String movieUrl = MOVIELISTURL + "?key=" + MOVIEAPIKEY + "&movieNm=" + searchTitle;

		return movieUrl;
	}

	
	private String getMovieUrlJson(String movieApiUrl) {
		String dailyResult = null;
		try {
			URL url = new URL(movieApiUrl);
			InputStream inputStream = url.openStream();
			return dailyResult = readUrlyBody(inputStream);

		} catch (Exception e) {
			throw new RuntimeException("daily API 응답 실패", e);
		}

	}

	private String readUrlyBody(InputStream inputStream) {
		//url을 읽어들여서 나온 json 을 넘겨줌
		InputStreamReader reader = new InputStreamReader(inputStream);
		try (BufferedReader lineReader = new BufferedReader(reader)) {

			StringBuilder dailyResult = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				dailyResult.append(line);
			}
			return dailyResult.toString();

		} catch (Exception e) {
			throw new RuntimeException("API 불러오기 실패");
		}
		
	}
	
	private void parseDailyData(String dailyResult) {
		LinkedList<HashMap<String, String>> dailyDataList = new LinkedList<HashMap<String, String>>();
		System.out.println(dailyResult);
		
		JSONObject jsonObject = null;
		
		String title; // 영화제목
		String movieCd; // 영화 코드
		String audiCnt; // 당일 관람객
		try {
			jsonObject = new JSONObject(dailyResult.toString());
			JSONObject jsonObject1 = (JSONObject) jsonObject.get("boxOfficeResult");

			JSONArray jsonArray = jsonObject1.getJSONArray("dailyBoxOfficeList");
			
			//1위부터 10위까지 순차적으로 넣음
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				HashMap<String, String> dailyDataMap = new HashMap<String, String>();

				
				movieCd = item.getString("movieCd");
				title = item.getString("movieNm");
				audiCnt = item.getString("audiCnt");
				
				System.out.println("rank : "+item.getString("rank")+"movieCd : " + movieCd + " movieNm : " + title + " audiCnt : " + audiCnt);
				dailyDataMap.put("movieCd", movieCd);
				dailyDataMap.put("title", title);
				dailyDataMap.put("rank", item.getString("rank"));
				dailyDataMap.put("audiCnt", audiCnt);
				
				dailyDataList.add(dailyDataMap);
				
			}
			for (HashMap<String, String> hashMap : dailyDataList) {
				System.out.println(hashMap.get("movieCd"));
				System.out.println(hashMap.get("title"));
				System.out.println(hashMap.get("rank"));
				System.out.println(hashMap.get("audiCnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	private void parseMovieInfoData(String movieInfoResult) {
		LinkedList<HashMap<String, String>> dailyDataList = new LinkedList<HashMap<String, String>>();
		System.out.println(movieInfoResult);
		
		JSONObject jsonObject = null;
		
		String title; // 영화제목
		String movieCd; // 영화 코드
		String audiCnt; // 당일 관람객
		try {
			jsonObject = new JSONObject(movieInfoResult.toString());
			JSONObject jsonObject1 = (JSONObject) jsonObject.get("boxOfficeResult");

			JSONArray jsonArray = jsonObject1.getJSONArray("dailyBoxOfficeList");
			
			//1위부터 10위까지 순차적으로 넣음
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				HashMap<String, String> dailyDataMap = new HashMap<String, String>();

				
				movieCd = item.getString("movieCd");
				title = item.getString("movieNm");
				audiCnt = item.getString("audiCnt");
				
				System.out.println("rank : "+item.getString("rank")+"movieCd : " + movieCd + " movieNm : " + title + " audiCnt : " + audiCnt);
				dailyDataMap.put("movieCd", movieCd);
				dailyDataMap.put("title", title);
				dailyDataMap.put("rank", item.getString("rank"));
				dailyDataMap.put("audiCnt", audiCnt);
				
				dailyDataList.add(dailyDataMap);
				
			}
			for (HashMap<String, String> hashMap : dailyDataList) {
				System.out.println(hashMap.get("movieCd"));
				System.out.println(hashMap.get("title"));
				System.out.println(hashMap.get("rank"));
				System.out.println(hashMap.get("audiCnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
}

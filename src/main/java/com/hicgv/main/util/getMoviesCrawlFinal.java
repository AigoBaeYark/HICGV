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
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

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
	private static String NAVERVIDEO = "https://movie.naver.com/movie/bi/mi/media.naver?code="; // 뒤에 코드만 붙이면 그 링크로 가서
																								// 가져오기
	private static String NAVERPHOTO = "https://movie.naver.com/movie/bi/mi/photoView.naver?code=";

	// 검색 내용
	private String searchTitle;
	private String day;
	private int startYear;	//검색할 시작연도
	private int totCnt;
	private int curPage; //curPage 

	// 결과 담기
	private LinkedList<HashMap<String, String>> resultMoviesList = new LinkedList<HashMap<String, String>>();

	// 제목으로 검색 (영화API, 네이버API 둘 다 UTF-8로 변경해줘야함)
	private LinkedList<HashMap<String, String>> searchToTitleNaver(String searchTitle, LinkedList<HashMap<String, String>> movieListData) {
		System.out.println("searchTitle2 : "+this.searchTitle);
		
		try {
			String naverResult = null;
			if(totCnt>10) {
				System.out.println("tot 10 넘음");
				int totCntPerPage=totCnt/10;
				System.out.println("totCnt/10 : "+totCnt);
				//첫번째 한번은 무조건 for문 밖에서
				System.out.println("size : "+movieListData.size());
				naverResult = readyNaver(this.searchTitle, movieListData.size());
				parseNaverData(naverResult, movieListData);	//데이터 변환해서 resultMoviesList 에 넣기
				
				for(this.curPage=2; this.curPage<=totCntPerPage+1 ; this.curPage++) {
					
					//두번째 페이지부터는 for문 안에서
					LinkedList<HashMap<String, String>> tempList = searchToTitleMovieInfoApi(this.searchTitle,this.curPage);
					System.out.println("searchTitle : "+this.searchTitle);
					naverResult = readyNaver(this.searchTitle, totCnt);
					parseNaverData(naverResult, tempList);	//데이터 변환해서 resultMoviesList 에 넣기
				}
			}else {
				//this.searchTitle = URLEncoder.encode(searchTitle, "UTF-8");
				System.out.println("size : "+movieListData.size());
				naverResult = readyNaver(this.searchTitle, movieListData.size());
				parseNaverData(naverResult, movieListData);	//데이터 변환해서 resultMoviesList 에 넣기
			}
			
			
		} catch (Exception e) {
			throw new RuntimeException("영화타이틀 변환 실패", e);
		}
		
		
		return this.resultMoviesList;	//최종적으로 넘김
	}

	public void getTrailers(String searchTitle) {

	}

	// 네이버 API 시작
	private String readyNaver(String searchTitle,int displayVal) {
		// 검색할 내용 //타이틀과 제작년도 같이 받
		int display = 10;
		if(displayVal>10)
			display=displayVal;
		System.out.println("disply size : "+display);
		String naverUrl = NAVERAPIURL + "?query=" + searchTitle + "&display="+100+"&yearfrom="+this.startYear;
		System.out.println("readNaver : "+naverUrl);
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

	private LinkedList<HashMap<String, String>> parseNaverData(String responseBody, LinkedList<HashMap<String, String>> movieListData) {
		// 받은 json 내용을 여기서 정리	여기서 최종적으로 데이터 비교해서 합침
		String title = null; // 영화 제목
		String link = null; // 영화 링크
		String year = null;
		String naverMovieCd = null; // 네이버 영화코드
		String image = null; // 영화 포스터링크
		String description = null; // 영화 줄거리
		int lengthBig = 2;
		int lengthSmall = 2;
		int flag = 0; // 어떤 api가 주체가 되어 비교할지 //0 네이버 1위원회
		
		LinkedList<HashMap<String, String>> finalResultList = new LinkedList<HashMap<String, String>>();
		
		try {
			JSONObject jsonObject = new JSONObject(responseBody);
			// System.out.println(jsonObject.get("items"));
			if(jsonObject.getJSONArray("items")==null)
				return null;
			
			
			JSONArray objNaver = jsonObject.getJSONArray("items");
			
			System.out.println(objNaver);
			String[] strArr = null;

			// 네이버 API 정보가 크면 네이버가 큰사이즈로 아니면 위원회 API가 큰사이즈로
			if (objNaver.length() > movieListData.size()) {
				lengthBig = objNaver.length();
				lengthSmall = movieListData.size();
				flag = 1;
			} else {
				lengthBig = movieListData.size();
				lengthSmall = objNaver.length();
				flag = 0;
			}

			// 네이버가 주체(네이버의 정보가 더적음)
			if (flag == 0) {
				for (int i = 0; i < lengthSmall; i++) {
					JSONObject item = objNaver.getJSONObject(i);

					title = item.getString("title");
					
					// 제목에 있는 hmtl태그를 제외한 문자열
					//title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
					
					title = Jsoup.parse(title).text();
					System.out.println("title : " + title);
					link = item.getString("link");
					year = item.getString("pubDate"); // 제작년도 가져옴
					System.out.println("pubDate : " + year);
					naverMovieCd = link.substring(link.lastIndexOf("=") + 1); // 영화 코드만 가져오기
					strArr = (link.split("=")); // https://movie.naver.com/movie/bi/mi/basic.nhn?code='영화코드'
					image = item.getString("image");
					HashMap<String, String> naverLinkTempMap = parseNaverLink(link); // 링크로 들어가서 가져오기

					for (int j = 0; j < lengthBig; j++) {
						HashMap<String, String> movieListMap = movieListData.get(j);
						
						
						
						
						//자바태그 특수문자 등 제거한 한글, 영어, 숫자만 가져옴
						String match = "[^\uAC00-\uD7A30-9a-zA-Z]";
						String aftertitle_korMatch =  movieListMap.get("title_kor");
						aftertitle_korMatch = aftertitle_korMatch.replaceAll(match,"");
						String afterTitleMatch = title.replaceAll(match,"");
						
						System.out.println("replace 후 : " + aftertitle_korMatch);
						System.out.println("title replace 후 : " + title.replaceAll(match,""));
						
						if (afterTitleMatch.equals(aftertitle_korMatch) && (year.equals(movieListMap.get("year")) || year.equals(movieListMap.get("opening_date").substring(0,4)))) {
							System.out.println("같은영화 : " + movieListMap.get("title"));
							HashMap<String, String> finalMap = new HashMap<String,String>();
							finalMap.put("movie_id", movieListMap.get("movie_id"));			//영화 고유코드
							finalMap.put("title_kor", movieListMap.get("title_kor"));		//영화 한글제목
							finalMap.put("title_eng", movieListMap.get("title_eng"));		//영화 영문제목
							finalMap.put("opening_date", movieListMap.get("opening_date"));	//영화 개봉일
							finalMap.put("genre", movieListMap.get("genre"));				//영화 장르
							finalMap.put("year", year);										//영화 제작년도
							finalMap.put("poster", naverLinkTempMap.get("poset")); // 링크로 들어가서 가져오기
							finalMap.put("description", naverLinkTempMap.get("description")); // 링크로 들어가서 가져오기
							
							this.resultMoviesList.add(finalMap);	//최종으로 보낼 리스트
							continue;
						}
					}

					System.out.println("title : " + title + " link : " + link + " image : " + image);
					System.out.println("naverMovieCd : " + naverMovieCd);
				}
			}

			// 위원회가 주체(위원회의 정보가 더적음)
			else if (flag == 1) {
				for (int i = 0; i < lengthSmall; i++) {
					HashMap<String, String> movieListMap = movieListData.get(i);

					for (int j = 0; j < lengthBig; j++) {
						JSONObject item = objNaver.getJSONObject(j);

						title = item.getString("title");
					
						//  제목에 있는 hmtl태그를 제외한 문자열
						//title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")
						
						title = Jsoup.parse(title).text();	//html 태그 제거
						year = item.getString("pubDate"); // 제작년도 가져옴
						
						//자바태그 특수문자 등 제거한 한글, 영어, 숫자만 가져옴
						String match = "[^\uAC00-\uD7A30-9a-zA-Z]";
						String aftertitle_korMatch =  movieListMap.get("title_kor");
						aftertitle_korMatch = aftertitle_korMatch.replaceAll(match,"");
						String afterTitleMatch = title.replaceAll(match,"");
						
						System.out.println("replace 후 : " + aftertitle_korMatch);
						System.out.println("title replace 후 : " + title.replaceAll(match,""));

						if (aftertitle_korMatch.equals(afterTitleMatch) && (movieListMap.get("year").equals(year) || movieListMap.get("opening_date").substring(0,4).equals(year))) {
							HashMap<String, String> finalMap = new HashMap<String,String>();
							
							System.out.println("같은영화2 : " + title);
							link = item.getString("link");
							System.out.println("pubDate : " + year);
							naverMovieCd = link.substring(link.lastIndexOf("=") + 1); // 영화 코드만 가져오기
							strArr = (link.split("=")); // https://movie.naver.com/movie/bi/mi/basic.nhn?code='영화코드'
							image = item.getString("image");
							HashMap<String, String> naverLinkTempMap = parseNaverLink(link);
							
							
							finalMap.put("movie_id", movieListMap.get("movie_id"));			//영화 고유코드
							finalMap.put("title_kor", movieListMap.get("title_kor"));		//영화 한글제목
							finalMap.put("title_eng", movieListMap.get("title_eng"));		//영화 영문제목
							finalMap.put("opening_date", movieListMap.get("opening_date"));	//영화 개봉일
							finalMap.put("genre", movieListMap.get("genre"));				//영화 장르
							finalMap.put("year", year);										//영화 제작년도
							finalMap.put("poster", naverLinkTempMap.get("poset")); 			// 링크로 들어가서 가져오기
							finalMap.put("description", naverLinkTempMap.get("description")); // 링크로 들어가서 가져오기
							
							this.resultMoviesList.add(finalMap);	//최종으로 보낼 리스트
							continue;
						}

					}
				}
			}
			return finalResultList;

			// for (String string : strArr) {
			// System.out.println(string);
			// }

		} catch (Exception e) {
			throw new RuntimeException("데이터 불러오기 실패", e);
		}

	}

	// 네이버 API 끝 //링크따라가서 이미지, 영상 같은거 따올려면 내용 더 추가

	private HashMap<String, String> parseNaverLink(String link) {
		HashMap<String, String> naverLinkMap = new HashMap<String,String>();
		String description=null; // 영화 줄거리
		String poster; // 영화 포스터
		Connection connection = Jsoup.connect(link);
		

		try {

			Document document = connection.get();
			Elements posterElements = document.select("div.mv_info_area");
			description = document.select("div.story_area").select("p.con_tx").toString();
			
//			for (Element element : descriptionElements) {
//				System.out.println(element);
//			}

			for (Element element : posterElements) {
				poster = element.select("img").attr("src").toString();
				System.out.println("poster : " + poster);
				naverLinkMap.put("poset", poster);
				
				
			}
			naverLinkMap.put("description", description);
			
			return naverLinkMap;
			
		} catch (Exception e) {
			throw new RuntimeException("네이버링크 불러오기 실패", e);
		}
	}

	// 영화진흥위원회

	public void searchToDate(String day) {
		// 일별 관람객 및 랭크를 가져오고싶은 날짜 (오늘날짜 제외)
		this.day = day;
		String dailyResult = getMovieUrlJson(getDailyMovieApiUrl());
		System.out.println("daily : " + dailyResult);
		parseDailyData(dailyResult);
	}

	public LinkedList<HashMap<String, String>> searchToTitleMovieInfoApi(String searchTitle) {
		try {
			this.resultMoviesList = new LinkedList<HashMap<String, String>>();
			this.searchTitle = URLEncoder.encode(searchTitle, "UTF-8");
			String movieInfoResult = getMovieUrlJson(getMovieInfoApiUrl());
			System.out.println("movieInfo : " + movieInfoResult);
			return searchToTitleNaver(searchTitle, parseMovieListData(movieInfoResult));	

		} catch (Exception e) {
			throw new RuntimeException("검색 실패", e);
		}

	}
	
	//검색했는데 10개의 데이터가 넘어서 페이지를 넘겨야 할 때, curPage 값은 최소 2 이상
	public LinkedList<HashMap<String, String>> searchToTitleMovieInfoApi(String searchTitle, int curPage) {
		try {
			String movieInfoResult = getMovieUrlJson(getMovieInfoApiUrl(curPage));
			System.out.println("movieInfo : " + movieInfoResult);
			return parseMovieListData(movieInfoResult);

		} catch (Exception e) {
			throw new RuntimeException("검색 실패", e);
		}

	}

	private String getDailyMovieApiUrl() {
		String movieUrl = DAILYURL + "?key=" + MOVIEAPIKEY + "&targetDt=" + day;

		return movieUrl;
	}

	private String getMovieInfoApiUrl() {
		String movieUrl = MOVIELISTURL + "?key=" + MOVIEAPIKEY + "&movieNm=" + this.searchTitle;
		System.out.println("api URL : "+movieUrl);

		return movieUrl;
	}
	
	private String getMovieInfoApiUrl(int curPage) {
		
		String movieUrl = MOVIELISTURL + "?key=" + MOVIEAPIKEY + "&movieNm=" + this.searchTitle+"&curPage="+curPage;
		System.out.println("2페이지 이상 : "+movieUrl);
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
		// url을 읽어들여서 나온 json 을 넘겨줌
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

			// 1위부터 10위까지 순차적으로 넣음
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				HashMap<String, String> dailyDataMap = new HashMap<String, String>();

				movieCd = item.getString("movieCd");
				title = item.getString("movieNm");
				audiCnt = item.getString("audiCnt");

				System.out.println("rank : " + item.getString("rank") + "movieCd : " + movieCd + " movieNm : " + title
						+ " audiCnt : " + audiCnt);
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

	// 비교할 타이틀, 년도
	private LinkedList<HashMap<String, String>> parseMovieListData(String movieInfoResult) {
		LinkedList<HashMap<String, String>> movieListData = new LinkedList<HashMap<String, String>>();
		System.out.println(movieInfoResult);
		
		JSONObject jsonObject = null;

		String title; // 영화제목
		String titleEn;//영화제목 (영문)
		String movieCd; // 영화 코드
		String openDt;	//개봉날짜
		String year; // 제작년도
		String genreAlt;	//장르
		this.startYear=2022; //검색할 최소연도
		try {
			jsonObject = new JSONObject(movieInfoResult.toString());
			JSONObject jsonObject1 = (JSONObject) jsonObject.get("movieListResult");
			this.totCnt = Integer.parseInt(jsonObject1.get("totCnt").toString());
			System.out.println("totCnt : "+this.totCnt);
			JSONArray jsonArray = jsonObject1.getJSONArray("movieList");

			// 1위부터 10위까지 순차적으로 넣음
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				HashMap<String, String> dailyDataMap = new HashMap<String, String>();
				
				if(item.getString("prdtYear").equals("") || item.getString("prdtYear")==null) {
					System.out.println("년도 없음");
				}else if(startYear>item.getInt("prdtYear")) {
					System.out.println("년도 변경 : "+item.getInt("prdtYear"));
					this.startYear = item.getInt("prdtYear");
					System.out.println(this.startYear );
				}
				
				
				
				movieCd = item.getString("movieCd");
				title = item.getString("movieNm");
				titleEn = item.getString("movieNmEn");
				openDt = item.getString("openDt");
				if (item.getString("openDt").equals("") || item.getString("openDt").equals(null) ) {
					openDt="00000000";
				}
				genreAlt = item.getString("genreAlt");
				year = item.getString("prdtYear");
				

				System.out.println("movieCd : " + movieCd + " movieNm : " + title + " prdtYear : " + year);
				dailyDataMap.put("movie_id", movieCd);	//영화고유코드
				dailyDataMap.put("title_kor", title);	//영화 한글제목
				dailyDataMap.put("title_eng", titleEn);	//영화 영문제목
				dailyDataMap.put("year", year);			//영화 제작년도
				
				dailyDataMap.put("opening_date", openDt);	//영화 개봉일
				dailyDataMap.put("genre", genreAlt);		//영화 장르
				
				movieListData.add(dailyDataMap);

			}
			
			for (HashMap<String, String> hashMap : movieListData) {
				System.out.println("movie_id "+hashMap.get("movie_id"));
				System.out.println("title_kor "+hashMap.get("title_kor"));
				System.out.println("title_eng "+hashMap.get("title_eng"));
				System.out.println("year "+hashMap.get("year"));
				System.out.println("opening_date "+hashMap.get("opening_date"));
				System.out.println("genre "+hashMap.get("genre"));
			}
			System.out.println("movieListDataSize : " + movieListData.size());
			return movieListData;
		} catch (Exception e) {
			throw new RuntimeException("JSON 데이터 읽기 실패", e);
		}

	}

	private void mergeData() {
		// 위원회 APi 제목(movieNm) = 네이버 API 제목(title), 위원회 API 개봉연도 (prdtYear) = 네이버 API
		// 개봉연도(pubDate)

	}

}

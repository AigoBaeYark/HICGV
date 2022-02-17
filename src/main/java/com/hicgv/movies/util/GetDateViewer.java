package com.hicgv.movies.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class GetDateViewer {

	// 영화진흥위원회 Api 사용
	// 일일 관람객 URL
	private String apiURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
	public static final String KEY = "e65350d6dfb171753380a52de708b7a8"; // 발급받은 api키
	private String[] rank = { "", "", "", "", "", "", "", "", "", "" };
	public String today;
	

	public ArrayList<Map<String, String>> getDateViewer(String today) { //생성자였는데 바꿈 (생성자면 리턴을 못 만드니까)
		// 일별관람객을 가져오고싶은 날짜 입력
		this.today = today.toString();
		String res = getOpenTodayViewer(getApiUrl());
		return parseData(res);
	}

	public String getApiUrl() {
		// 키값과 날짜를 주소에 넣어서 보내줌
		apiURL = apiURL + "?key=" + KEY + "&targetDt=" + today;
		System.out.println(apiURL);
		return apiURL;
	}

	public String getOpenTodayViewer(String apiURL) {
		String responseBody = null;
		try {
			URL url = new URL(apiURL);
			InputStream in = url.openStream();
			responseBody = readBody(in);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return responseBody;
	}

	private String readBody(InputStream body) {
		InputStreamReader reader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(reader)) {

			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) { //.readLine() 개행 문자를 기준으로 모든 줄을 읽어서 한 라인씩 리스트로 값을 반환
				responseBody.append(line);
			}
			return responseBody.toString();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("API 불러오기 실패");
		}
	}

	private ArrayList<Map<String, String>> parseData(String responseBody) {
		String title=null; // 영화제목
		String movieCd=null; // 영화 코드
		String audiCnt=null; // 당일 관람객
		String openDt=null; // 영화 개봉일
		ArrayList<Map<String, String>> b = new ArrayList<Map<String, String>>();


		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject(responseBody.toString());
			JSONObject jsonObject1 = (JSONObject) jsonObject.get("boxOfficeResult");

			JSONArray jsonArray = jsonObject1.getJSONArray("dailyBoxOfficeList");

			for (int i = 0; i < jsonArray.length(); i++) {
				Map<String, String> a = new HashMap<String, String>(); //포문안에다 넣어야지 똑같은 값이 계속 안 나옴

				
				System.out.println(jsonArray);
				
				JSONObject item = jsonArray.getJSONObject(i);
				a.put("title", title = item.getString("movieNm"));
				
				a.put("movieCd", movieCd = item.getString("movieCd"));
				a.put("audiCnt", audiCnt = item.getString("audiCnt"));
				a.put("openDt", openDt = item.getString("openDt")); 
				a.put("rank", rank[i] = item.getString("rank")); //(맵으로 묶어주기) "jsp내 JSTL이름",밸류 - "키"
				b.add(a); //리스트로받기
				
				System.out.println("rank : " + rank[i] + "movieCd : " + movieCd + " movieNm : " + title + " audiCnt : "
						+ audiCnt + " openDt : " + openDt);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;

	}
}

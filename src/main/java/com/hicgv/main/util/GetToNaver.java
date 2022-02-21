package com.hicgv.main.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class GetToNaver {

	private static String APIURL = "https://openapi.naver.com/v1/search/movie.json";
	private static String ID = "reYcpdl2OMmpJINXgbNk";
	private static String SECRET = "27N9KP87tK";
	private String text;

	public GetToNaver(String movieTitle) {
		String tempBody = null;
		try {

			// naver API 는 검색어를 uff-8로 변환하여 보내야함
			text = URLEncoder.encode(movieTitle, "utf-8");
			System.out.println(text);

			// 검색어를 입력받아 가장 처음나오는 영화만 받아오기 display = 1 은 여러개중에 가장 처음값만 보여줌
			String url = APIURL + "?query=" + text + "&start=1&display=1";
			tempBody = exam(url);

		} catch (Exception e) {
			throw new RuntimeException("검색어 불러오기 실패");
		}
		System.out.println(tempBody);
		parseData(tempBody);

	}

	public String exam(String url) {

		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("X-Naver-Client-Id", ID);
		requestHeaders.put("X-Naver-Client-Secret", SECRET);
		String responseBody = get(url, requestHeaders);
		return responseBody;

	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	private static void parseData(String responseBody) {
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
}

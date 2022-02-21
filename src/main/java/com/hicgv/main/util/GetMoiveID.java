package com.hicgv.main.util;

import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class GetMoiveID {
	//cgv에서 영화ID 가져오기
	
	private String movieIDURL = "http://www.cgv.co.kr/movies";
	Connection connection = Jsoup.connect(movieIDURL);
	//private String url = "www.cgv.co.kr/search/?query="+title_kor;
	
	// list<map<string, Object>> 테스트
//	
//	ArrayList<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
//			
//	for(int i=0; i<5;i++) {
//		Map<String, Object> tempMap = new HashMap<String, Object>();
//
//		tempMap.put("key", "value"+i);
//		tempMap.put("temp", "temp"+i);
//		tempMap.put("map", "map"+i);
//		tempList.add(tempMap);
//	}
//	
//	for(int i=0; i<tempList.size();i++) {
//		System.out.println(i + " 번째");
//		Map<String, Object> m = tempList.get(i);
//		System.out.println("key : "+m.get("key"));
//		System.out.println("temp "+m.get("temp"));
//		System.out.println("map : "+m.get("map"));
//	}
	
	
	// jsoup 테스트
	/*
	String url = "http://www.cgv.co.kr/movies/";
	Connection connection = Jsoup.connect(url);
	ArrayList<String> rankli = new ArrayList<String>();
	ArrayList<String> titleli = new ArrayList<String>();
	try {
		//cgv 홈페이지에서 랭크, 제목 가져오기
		Document document = connection.get();
		Elements e = document.select("div.sect-movie-chart");
		Iterator<Element> rank = e.select("strong.rank").iterator();
		Iterator<Element> title = e.select("strong.title").iterator();

		while (rank.hasNext()) {
			
			// rank 앞의 no. 없애기
			// rankli.add(rank.next().text().substring(3));

			// Iterator 출력, 리스트에 넣기
			System.out
					.println(rankli.add(rank.next().text().substring(3)) + "\t" + titleli.add(title.next().text()));
			// System.out.println(rank.next().text() + "\t" +
			// titleli.add(title.next().text()));

		}

		for (String li : rankli) {
			// 리스트에 잘 들어갔는지 확인
			System.out.println(li + "\t" + titleli.get(Integer.parseInt(li)));

			// dao.insertMovie(li,titleli.get(Integer.parseInt(li)));
			// dao.dailyViewer(movie_id, api가져온 관람객);

		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	*/
	
	
	
	public void getMoviesID() {
		ArrayList<String> idstr = new ArrayList<String>();
		ArrayList<Integer> idIntegers = new ArrayList<Integer>();
		try {
			Document document = connection.get();
			Elements elements = document.select("span.thumb-image");
			for (Element element : elements) {
				//span class = thumbs-image 이하의 값들을 가져옴
				//System.out.println("elements : " + element);
				for (Element e : element.children()) {
					//하나 밑의 자식들을 가져옴
					//System.out.println(e);
					//String absSrc =e.text;
					//System.out.println("000"+e.select("img"));
					//img태그만 선택하고 src가 있으면 리스트에 넣음(이미지 주소만 가져옴)
					if(e.select("img").hasAttr("src")) {
						idstr.add(e.attr("src"));
					}
				}
			}
			
			for (String element : idstr) {
				System.out.println(element);
				//이미지 주소에서 ID만 자름
				idIntegers.add(Integer.parseInt(element.substring(52,57)));
			}
			
			
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
	}
	
}

package com.hicgv.movies.api;

import java.io.IOException;
import java.util.Iterator;

import javax.print.Doc;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MovieCrawling {
	public static void getGetcgv() {
		// Jsoup를 이용해서 http://www.cgv.co.kr/movies/ 크롤링
		final String url = "http://www.cgv.co.kr/movies/"; //크롤링할 url지정
		Document doc=null;  //Document에는 페이지의 전체 소스가 저장됨
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements element = doc.select("div.sect-movie-chart");
		
		System.out.println("div.sect-movie-chart");
		
		//Iterator을 사용하여 하나씩 값 가져오기(list라고 생각하기)
		Iterator<Element> it1 = element.select("img").iterator(); //포스터
		Iterator<Element> it2 = element.select("strong.title").iterator(); //영화명
		Iterator<Element> it3 = element.select("strong.percent").iterator(); //예매율
		//개봉날짜는 API로
		
		while (it1.hasNext()) {
			System.out.println(it1.next().text()+"\t"+it2.next().text());
			
		}
		
	}
	
	
				
				
		
}

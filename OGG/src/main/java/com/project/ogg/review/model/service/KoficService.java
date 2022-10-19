package com.project.ogg.review.model.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Kofic;

@Service
public class KoficService {

	private static String clientId = "Vhxz0BJwK3UchDgb2mDS";
	private static String clientSecret = "_2S7a6mTPf";
	URL url;
	URLConnection urlConn;
	XmlPullParserFactory factory;
	XmlPullParser parser;
	
	public void con(String keyword, int yearfrom, int yearto, int display, int start) {
		try {
			url = new URL("https://openapi.naver.com/v1/search/movie.xml?query=" 
					+ URLEncoder.encode(keyword, "UTF-8")
					+ (yearfrom != 0 ? "&yearfrom=" + yearfrom : "") 
					+ (yearto != 0 ? "&yearto=" + yearto : "")
					+ (display != 0 ? "&display=" + display : "") 
					+ (start != 0 ? "&start=" + start : ""));
			urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientId);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			factory = XmlPullParserFactory.newInstance();
			parser = factory.newPullParser();
			
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			e.printStackTrace();
		}
	}
	
	public List<Film> searchFilm(String keyword, int display, int start){
		List<Film> list = null;
		con(keyword, 0, 0, display, start);
		int eventType;
		try {
			eventType = parser.getEventType();
			Film film = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<Film>();
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if (tag.equals("item")) {
						list.add(film);
						film = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					if ("item".equals(tag)) {
						film = new Film();
						break;
					} else if ("title".equals(tag)) {
						if (film != null)
							film.setTitle(parser.nextText().replace("<b>", "").replace("</b>", ""));
						break;
					} else if ("link".equals(tag)) {
						if (film != null)
							film.setLink(parser.nextText());
						break;
					} else if ("image".equals(tag)) {
						if (film != null) {
							film.setImage(parser.nextText());
						}
						break;
					} else if ("subtitle".equals(tag)) {
						if (film != null)
							film.setSubtitle(parser.nextText());
						break;
					} else if ("pubDate".equals(tag)) {
						if (film != null)
							film.setPubDate(parser.nextText());
						break;
					} else if ("director".equals(tag)) {
						if (film != null)
							film.setDirector(parser.nextText());
						break;
					} else if ("actor".equals(tag)) {
						if (film != null)
							film.setActor(parser.nextText());
						break;
					} else if ("userRating".equals(tag)) {
						if (film != null) {
							film.setUserRating(parser.nextText());
						}
						break;
					}
				}
				}
				eventType = parser.next();
			}
		} catch (XmlPullParserException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Film getMovieDetail(String keyword, int year) {
		keyword = keyword.replaceAll("&amp;", "&");
		con(keyword, year, year, 1, 1);
		int eventType;
		try {
			eventType = parser.getEventType();
			Film film = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if (tag.equals("item")) {
						return film;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					if ("item".equals(tag)) {
						film = new Film();
						break;
					} else if ("title".equals(tag)) {
						if (film != null)
							film.setTitle(parser.nextText().replace("<b>", "").replace("</b>", ""));
						break;
					} else if ("link".equals(tag)) {
						if (film != null)
							film.setLink(parser.nextText());
						break;
					} else if ("image".equals(tag)) {
						if (film != null) {
							film.setImage(parser.nextText());
						}
						break;
					} else if ("subtitle".equals(tag)) {
						if (film != null)
							film.setSubtitle(parser.nextText());
						break;
					} else if ("pubDate".equals(tag)) {
						if (film != null)
							film.setPubDate(parser.nextText());
						break;
					} else if ("director".equals(tag)) {
						if (film != null)
							film.setDirector(parser.nextText());
						break;
					} else if ("actor".equals(tag)) {
						if (film != null)
							film.setActor(parser.nextText());
						break;
					} else if ("userRating".equals(tag)) {
						if (film != null) {
							film.setUserRating(parser.nextText());
						}
						break;
					}
				}
				}
				eventType = parser.next();
			}
		} catch (XmlPullParserException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public List<Kofic> getBoxOffice() {
		SimpleDateFormat dformat = new SimpleDateFormat("yyyymmdd");
		String today = dformat.format(new Date());
		List<Kofic> list = new ArrayList<>();
		try {
			url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=fb7aac4fd107828cdac2dbd0e06fdb7c&targetDt="
							+ today);
			urlConn = url.openConnection();
			factory = XmlPullParserFactory.newInstance();
			parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));
			int eventType;
			eventType = parser.getEventType();
			Kofic kofic = null;
			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if (tag.equals("dailyBoxOffice")) {
						list.add(kofic);
						kofic = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					if ("dailyBoxOffice".equals(tag)) {
						kofic = new Kofic();
						break;
					} else if ("rnum".equals(tag)) {
						if (kofic != null)
							kofic.setRnum(parser.nextText());
						break;
					} else if ("rank".equals(tag)) {
						if (kofic != null)
							kofic.setRank(parser.nextText());
						break;
					} else if ("rankInten".equals(tag)) {
						if (kofic != null) {
							kofic.setRankInten(parser.nextText());
						}
						break;
					} else if ("rankOldAndNew".equals(tag)) {
						if (kofic != null)
							kofic.setRankOldAndNew(parser.nextText());
						break;
					} else if ("movieCd".equals(tag)) {
						if (kofic != null)
							kofic.setMovieCd(parser.nextText());
						break;
					} else if ("movieNm".equals(tag)) {
						if (kofic != null)
							kofic.setMovieNm(parser.nextText());
						break;
					} else if ("openDt".equals(tag)) {
						if (kofic != null)
							kofic.setOpenDt(parser.nextText());
						break;
					} else if ("salesAmt".equals(tag)) {
						if (kofic != null) {
							kofic.setSalesAmt(parser.nextText());
						}
						break;
					} else if ("salesShare".equals(tag)) {
						if (kofic != null) {
							kofic.setSalesShare(parser.nextText());
						}
						break;
					} else if ("salesInten".equals(tag)) {
						if (kofic != null) {
							kofic.setSalesInten(parser.nextText());
						}
						break;
					} else if ("salesChange".equals(tag)) {
						if (kofic != null) {
							kofic.setSalesChange(parser.nextText());
						}
						break;
					} else if ("audiCnt".equals(tag)) {
						if (kofic != null) {
							kofic.setAudiCnt(parser.nextText());
						}
						break;
					} else if ("audiInten".equals(tag)) {
						if (kofic != null) {
							kofic.setAudiInten(parser.nextText());
						}
						break;
					} else if ("audiChange".equals(tag)) {
						if (kofic != null) {
							kofic.setAudiChange(parser.nextText());
						}
						break;
					} else if ("audiAcc".equals(tag)) {
						if (kofic != null) {
							kofic.setAudiAcc(parser.nextText());
						}
						break;
					} else if ("scrnCnt".equals(tag)) {
						if (kofic != null) {
							kofic.setScrnCnt(parser.nextText());
						}
						break;
					} else if ("showCnt".equals(tag)) {
						if (kofic != null) {
							kofic.setShowCnt(parser.nextText());
						}
						break;
					}

				}
				}
				eventType = parser.next();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			e.printStackTrace();
		}
		return list;
	}

}

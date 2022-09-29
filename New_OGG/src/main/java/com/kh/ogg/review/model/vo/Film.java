package com.kh.ogg.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Film {

//	private String fCode;
//	private Date fDate;
//	private String fDir;
//	private String fTitle;
//	private String fContent;
//	private String fGenre;
//	private String fNat;
//	private int fStarred;
//	private String fDib;
	
    public String title;
    public String link;
    public String image;
    public String subtitle;
    public String pubDate;
    public String director;
    public String actor;
    public String userRating;
}

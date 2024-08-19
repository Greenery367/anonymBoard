package com.test.board.Repository.Model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	private int id;
	private String title;
	private String content;
	private String author;
	private int status;
	private int password;
	private Timestamp createdAt;

}

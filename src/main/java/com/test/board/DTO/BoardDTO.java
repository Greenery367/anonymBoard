package com.test.board.DTO;

import com.test.board.Repository.Model.Board;

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
public class BoardDTO {
	private String title;
	private String content;
	private String author;
	private int status;
	private int password;
	
	
	public Board toBoard() {
		Board board = Board.builder().title(this.title)
									.content(this.content)
									.author(this.author)
									.password(this.password)
									.build();
		return board;
	}
}

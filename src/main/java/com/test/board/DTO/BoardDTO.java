package com.test.board.dto;

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

// 게시글 작성 DTO
public class BoardDTO {
	private String title;
	private String content;
	private String author;
	private int status;
	private int password;

	public Board toBoard() {
		Board board = Board.builder().title(this.title).content(this.content).author(this.author)
				.password(this.password).build();
		return board;
	}
}

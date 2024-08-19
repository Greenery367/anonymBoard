package com.test.board.Repository.Interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.test.board.DTO.BoardDTO;
import com.test.board.Repository.Model.Board;

@Mapper
public interface BoardRepository {
	
	public List<Board> selectAllBoard(); // 전체 글 조회 기능
	public int addBoard(Board board); // 전체 글 조회 기능
	public Board selectBoardByIdAndPassword(@Param("boardId")int boardId, @Param("password")int password); // id/pw로 글 조회하기
	public int updateBoard(@Param("boardId")int boardId, @Param("title")String title,
							@Param("content")String content); // 글 수정 기능
	public int deleteBoard(int boardId); // 글 삭제 기능
	public List<Board> selectByKeyword(String keyword); // 글 조회 기능
	public List<Board> selectAllBoardforPagination(@Param("limit")int limit, @Param("offset")int offset); // 페이징 처리

}

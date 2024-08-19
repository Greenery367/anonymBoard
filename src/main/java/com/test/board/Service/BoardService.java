package com.test.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.board.Repository.Interfaces.BoardRepository;
import com.test.board.Repository.Model.Board;
import com.test.board.dto.BoardDTO;
import com.test.board.dto.UpdateDTO;
import com.test.board.handler.exception.DataDeliveryException;

@Service
public class BoardService {

	// DI
	@Autowired
	private final BoardRepository boardRepository;

	// 생성자 의존 주입
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	/**
	 * 전체 게시글 조회
	 * 
	 * @return
	 */
	public List<Board> selectAllBoard() {
		List<Board> boardList = new ArrayList<>();
		boardList = boardRepository.selectAllBoard();
		return boardList;
	}

	public List<Board> selectAllBoardforPagination(int limit, int offset) {
		List<Board> boardList = new ArrayList<>();
		boardList = boardRepository.selectAllBoardforPagination(limit, offset);
		return boardList;
	}

	/**
	 * 새 글 작성하기
	 * 
	 * @param dto
	 */
	@Transactional
	public void addNewBoard(BoardDTO dto) {
		Board board = dto.toBoard();
		boardRepository.addBoard(board);
	}

	/**
	 * 게시글 인증 처리
	 * 
	 * @param boardId
	 * @param password
	 * @return
	 */
	public Board selectBoardByIdAndpassword(int boardId, int password) {
		Board board = boardRepository.selectBoardByIdAndPassword(boardId, password);
		return board;
	}

	/**
	 * 게시글 수정 처리
	 * 
	 * @param boardId
	 * @param dto
	 * @return
	 */
	@Transactional
	public int updateBoard(int boardId, UpdateDTO dto) {
		int resultRow = boardRepository.updateBoard(boardId, dto.getTitle(), dto.getContent());
		if (resultRow != 1) {
			throw new DataDeliveryException("수정에 실패했습니다.", HttpStatus.NOT_FOUND);
		}
		return resultRow;
	}

	/**
	 * 게시글 삭제 처리
	 * 
	 * @param boardId
	 * @return
	 */
	@Transactional
	public int deleteBoard(int boardId) {
		int resultRow = boardRepository.deleteBoard(boardId);
		if (resultRow != 1) {
			throw new DataDeliveryException("삭제에 실패했습니다.", HttpStatus.NOT_FOUND);
		}
		return 0;
	}

}

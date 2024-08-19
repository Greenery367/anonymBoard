package com.test.board.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.board.DTO.BoardDTO;
import com.test.board.DTO.UpdateDTO;
import com.test.board.Handler.Exception.DataDeliveryException;
import com.test.board.Repository.Model.Board;
import com.test.board.Service.BoardService;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.board.Handler.Exception.DataDeliveryException;
import com.test.board.Handler.Exception.UnAuthorizedException;
import com.test.board.Handler.Exception.RedirectException;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	private HttpSession httpSession;
	
	public BoardController(BoardService boardService) {
		this.boardService=boardService;
	}
	
	/**
	 * 게시판 리스트 띄우기
	 * @param model
	 * @return
	 */
	@GetMapping("/main/{currentPage}")
	public String main(Model model, @PathVariable(name="currentPage", required=false)int currentPage) {
		List<Board> boardList = boardService.selectAllBoard();
		int totalPages=(int)Math.ceil((double)boardList.size()/5); // 총 페이지 수
		int limit=5;
		int offset;
		
		offset=(currentPage-1)*limit;
		
		List<Board> listForPagination = boardService.selectAllBoardforPagination(limit, offset);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);		
		model.addAttribute("listForPagination", listForPagination);
		return "boardPage";
	}
	
	/**
	 * 게시글 작성 화면 띄우기
	 * @return
	 */
	@GetMapping("/write-board")
	public String writeNewBoardPage() {
		return "writePage";
	}
	
	/**
	 * 게시글 작성 처리
	 * @param dto
	 * @return
	 */
	@PostMapping("/write-board")
	public String writeNewBoardProc(BoardDTO dto) {
		BoardDTO newBoard=dto;
		boardService.addNewBoard(dto);
		return "redirect:/board/main";
	}
	
	
	/**
	 * 작성자 인증 페이지
	 * @param boardId
	 * @param type
	 * @return
	 */
	@GetMapping({"/check-author/{boardId}"})
	public String checkAuthorpage(@PathVariable("boardId")int boardId,
									@RequestParam("type") String type,
									Model model) {
		
		model.addAttribute("boardId", boardId);
		model.addAttribute("type", type);
		return "checkAuthorPage";
	}
	
	/**
	 * 작성자 인증 처리 후
	 * @param boardId
	 * @param type
	 * @param password
	 * @return
	 */
	@PostMapping({"/check-author/{boardId}"})
	public String checkAuthorProc(@PathVariable(name="boardId")int boardId,
								@RequestParam(name="type")String type, 
								@RequestParam(name="password")int password) {
	
		Board checkBoard=boardService.selectBoardByIdAndpassword(boardId, password);
		
		// 사용자 인증 처리
		if(checkBoard==null) {
			throw new UnAuthorizedException("잘못된 비밀번호입니다.", HttpStatus.NOT_FOUND);
		}
		
		
		if(type.equals("update")) {
			return "/updatePage";
		} else if(type.equals("delete")) {
			return "/deletePage";
		}
		
		return "/updatePage";
	}

	/**
	 * 
	 * @param boardId
	 * @param dto
	 * @return
	 */
	@PostMapping("/update-board/{boardId}")
	public String updateBoardProc(@PathVariable(name="boardId")int boardId, UpdateDTO dto) {
		int result=boardService.updateBoard(boardId, dto);
		return "redirect:/board/main";
	}
	
	@GetMapping("/delete-board/{boardId}")
	public String deleteBoardProc(@PathVariable(name="boardId")int boardId, UpdateDTO dto) {
		int result=boardService.deleteBoard(boardId);
		if(result==1) {
			System.out.println("성공ㅋ");
			return "redirect:/board/main";
		}
		return "redirect:/board/main";
	}
}

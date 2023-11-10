package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class musicDAO extends DBConnector {

	
	// 음악 등록
	public int AddMusic(musicDTO dto) {
		int result = 0;
		
		String ADD_MUSIC_SQL = "insert into music values(null, ?, ?, ?, ?, ?, false)";
		
		try {
			psmt = con.prepareStatement(ADD_MUSIC_SQL);
			psmt.setString(1, dto.getYoutubeId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getArtist());
			psmt.setString(4, dto.getId());
			psmt.setString(5, dto.getCreated());
			result = psmt.executeUpdate();
			
			System.out.println("AddMusic 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("AddMusic 실패");
		}
		
		return result;
	}
	
	
	// 음악 리스트 불러오기
	public List<musicDTO> SelectMusicList(String id) {
		List<musicDTO> musicList = new ArrayList<musicDTO>();
		String SELECT_MUSIC_SQL = "select * from music where id = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_MUSIC_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				musicDTO music = new musicDTO();
				music.setNo(rs.getInt("no"));
				music.setYoutubeId(rs.getString("youtubeId"));
				music.setTitle(rs.getString("title"));
				music.setArtist(rs.getString("artist"));
				music.setId(rs.getString("id"));
				music.setCreated(rs.getString("created"));
				music.setPicked(rs.getBoolean("picked"));
				musicList.add(music);
			}
			
			System.out.println("SelectMusicList 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("SelectMusicList 실패");
		}
		
		return musicList;
	}
	
	
}

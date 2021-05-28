package woo.edu.c.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class boardVo {
	
	private int bnum;
	private String btitle;
	private String bcontent;
	private String bdate;
	private String bname;

}

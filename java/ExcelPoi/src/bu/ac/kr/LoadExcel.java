package bu.ac.kr;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class LoadExcel {

	public static void main(String args[]) {

		List<UserVo> list = new ArrayList<UserVo>();

		try {
			FileInputStream file = new FileInputStream("src/bu/resorces/test.xlsx");
			@SuppressWarnings("resource")
			XSSFWorkbook workbook = new XSSFWorkbook(file);

			int rowindex = 0;
			int columnindex = 0;
			XSSFSheet sheet = workbook.getSheetAt(0); // 시트 수
			int rows = sheet.getPhysicalNumberOfRows(); // 행 수

			for (rowindex = 1; rowindex < rows; rowindex++) {
				XSSFRow row = sheet.getRow(rowindex);
				UserVo uv = new UserVo();
				if (row != null) {
					int cells = row.getPhysicalNumberOfCells(); // 셀 수
					for (columnindex = 0; columnindex <= cells; columnindex++) {
						XSSFCell cell = row.getCell(columnindex);
						String value = "";

						if (cell == null) {
							continue;
						} else {
							switch (cell.getCellType()) {
							case XSSFCell.CELL_TYPE_FORMULA:
								value = cell.getCellFormula();
								break;
							case XSSFCell.CELL_TYPE_STRING:
								value = cell.getStringCellValue();
								break;
							case XSSFCell.CELL_TYPE_NUMERIC:
								value = cell.getNumericCellValue() + "";
								break;
							case XSSFCell.CELL_TYPE_BOOLEAN:
								value = cell.getBooleanCellValue() + "";
								break;
							case XSSFCell.CELL_TYPE_ERROR:
								value = cell.getErrorCellValue() + "";
								break;
							default:
								break;
							}
							switch (columnindex) {
							case 0:
								uv.setUserName(value);
								break;
							case 1:
								uv.setUserAge(value);
								break;
							case 2:
								uv.setUserSex(value);
								break;
							default:
								break;
							}

						}

					} // for columnindex
				}
				list.add(uv);
			} // for rowIndex
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
	}

}

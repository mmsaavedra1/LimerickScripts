/** @OnlyCurrentDoc */

function Formatearplanilla() {
  var spreadsheet = SpreadsheetApp.getActive();
  spreadsheet.getRange("A1").activate();
  spreadsheet.getActiveSheet().setColumnWidth(8, 282);
  var currentCell = spreadsheet.getCurrentCell();
  spreadsheet.getActiveRange().getDataRegion().activate();
  currentCell.activateAsCurrentCell();
  spreadsheet.getActiveRangeList().setHorizontalAlignment("center");
  spreadsheet.getRange("G2").activate();
  currentCell = spreadsheet.getCurrentCell();
  spreadsheet
    .getSelection()
    .getNextDataRange(SpreadsheetApp.Direction.DOWN)
    .activate();
  currentCell.activateAsCurrentCell();
  currentCell = spreadsheet.getCurrentCell();
  spreadsheet
    .getSelection()
    .getNextDataRange(SpreadsheetApp.Direction.DOWN)
    .activate();
  currentCell.activateAsCurrentCell();
  spreadsheet
    .getActiveRangeList()
    .clear({ contentsOnly: true, skipFilteredRows: true });
  spreadsheet.getRange("G2").activate();
  spreadsheet.getCurrentCell().setFormula("=SUM(B2:F2)");
  spreadsheet.getRange("G3").activate();
  spreadsheet.getActiveSheet().setColumnWidth(6, 157);
  spreadsheet.getRange("H:H").activate();
  spreadsheet.getActiveRangeList().setHorizontalAlignment("left");
  spreadsheet.getRange("G2").activate();
  spreadsheet
    .getActiveRange()
    .autoFillToNeighbor(SpreadsheetApp.AutoFillSeries.DEFAULT_SERIES);
  spreadsheet.getRangeList(["A:A", "1:1"]).activate().setFontWeight("bold");
  spreadsheet.getActiveSheet().setFrozenRows(1);
  spreadsheet.getActiveSheet().setFrozenColumns(1);
  var sheet = SpreadsheetApp.getActiveSheet();
  var cells = sheet.getDataRange();
  var rows = cells.getNumRows();
  var cols = cells.getNumColumns();
  for (n = 1; n <= rows; n++) {
    for (k = 1; k <= cols; k++) {
      var cell = cells.getCell(n, k);
      if (cell.getValue() == "NC" || cell.getValue() == -1) {
        cell.setBackgroundRGB(244, 199, 195);
        if (k == 4 || k == 5) {
          cell.setValue("3");
        } else if (cell.getValue() == -1) {
          cell.setValue("MU");
        }
      }
    }
  }
}

#  Soduku Solver

### Steps in Algorithm
1.  VNImageRequestHandler Find rect  
2.  Is Rect sudoku? (coreMl Model)  
3. Break into 81 Cell Images  
4. OCR Cell Images, and populate Sudoku Data Model*  

#### Project Notes  
* Might use Tesseract for OCR, if so be sure to set the following:
api.setPageSegMode(TessBaseAPI.pageSegMode.PSM_SINGLE_CHAR);

Could Build an OCR model for specific sudoku cells, since I am only making it for the one book, font differences and handwriting differences don't really matter.  This is something I could come back to later after Dandy Hacks.

### TODOs:
[ ] Find algorithm to solve soduku with 
[ ] Build a sudoku data model
[ ] Build Puzzle Image isolater (Rect finder then is sudoku model)
[ ] Break Single puzzle into 81 seperate Images
[ ] OCR Cell checker to populate our data model
[ ] Solve sudoku 
[ ] Build ARKit Image out of sudoku puzzle
[ ] Overlay Image on top of sudoku puzzle




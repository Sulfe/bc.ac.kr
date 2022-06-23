// Pagination Class (usage below!)
const Pagination = class {
  constructor() {
    this.totalPages = 0;
    this.currentPage = 1;
    this.pagingContainer = document.getElementById("paging-items");
    this.pageChangeAction = (page) => {
      console.log(`Now on page ${page}, add your own function!`); 
    };
    this.refreshPaging();
  }
  refreshPaging(){
    this.clearList();
    let pagingList = []
    if(this.totalPages > 5){
      
      // If current page is below 4
      if(this.currentPage < 4){
        pagingList = [1, 2, 3, 4, "..", this.totalPages]
      }
      
      // if pages is in between the first page and the last page with a margin of 3
      if(this.currentPage >= 4 && this.currentPage <= (this.totalPages - 3)){
        pagingList = [1, "..", this.currentPage-1, this.currentPage, this.currentPage+1, "..", this.totalPages]
      }
      
      // if current page is higher than the total pages minus 3
      if(this.currentPage > (this.totalPages - 3)){
        pagingList = [1, ".."]
        for(let i = 0; i <= 3; i++){
          pagingList.push((this.totalPages - 3) + i)
        }
      }
    }else{
      for(let i = 1; i <= this.totalPages; i++){
        pagingList.push(i)
      }
    }
    
    // Generate pages
    pagingList.forEach((page, i) => {
      this.createPageNumber(page)
    })
    
    // Hide / Show buttons
    if(this.totalPages == 1){
      document.getElementById("paging-prev-button").classList.add("paging-button-hide")
      document.getElementById("paging-next-button").classList.add("paging-button-hide")
    }else{
      if(this.currentPage > 1 ){
        document.getElementById("paging-prev-button").classList.remove("paging-button-hide")
      }else{
        document.getElementById("paging-prev-button").classList.add("paging-button-hide")
      }

      if(this.currentPage >= this.totalPages){
        document.getElementById("paging-next-button").classList.add("paging-button-hide")
      }else{
        document.getElementById("paging-next-button").classList.remove("paging-button-hide")
      }
    }
  }
  createPageNumber(number){
    let pageItem = document.createElement("li");
    let pageNumber = document.createTextNode(number);
    
    if(!isNaN(number)){
      let pageItemButton = document.createElement("button");
      pageItemButton.addEventListener('click', () => {
        this.setCurrentPage(number)
      });
      pageItemButton.appendChild(pageNumber);
      if(number === this.currentPage){
        pageItemButton.classList.add("paging-item-active")
      }
      pageItem.appendChild(pageItemButton);
    }else{
      pageItem.appendChild(pageNumber);
    }
    this.pagingContainer.appendChild(pageItem);
  }
  nextPage(){
    if(this.currentPage >= 1 && this.currentPage < this.totalPages){
      this.setCurrentPage(this.currentPage + 1)
    }
  }
  prevPage(){
    if(this.currentPage <= this.totalPages && this.currentPage > 1){
      this.setCurrentPage(this.currentPage - 1)
    }
  }
  setCurrentPage(page){
    this.currentPage = page;
    this.pageChangeAction(page);
    this.refreshPaging();
  }
  setTotalPages(total){
    this.totalPages = total;
    this.refreshPaging();
  }
  setPageChangeAction(newAction){
    this.pageChangeAction = newAction;
  }
  clearList(){
    while (this.pagingContainer.firstChild) {
      this.pagingContainer.removeChild(this.pagingContainer.firstChild);
    }
  }
};

// Working with it
let paging = new Pagination();

// Set total pages
paging.setTotalPages(10);

// Set current page
paging.setCurrentPage(1);

// Set page change action
paging.setPageChangeAction((page) => {
  console.log(`Should now be on page ${page}`);
})

// Set button events
document.getElementById("paging-prev-button").addEventListener('click', () => {
  paging.prevPage();
});

document.getElementById("paging-next-button").addEventListener('click', () => {
  paging.nextPage();
});
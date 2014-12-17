<div id="basic-modal-content">
    <h2 id="modalTitle"></h2>
    <div class="row">
    <div class="col-md-4">
        <img id = "modalImage" src="" class="img-responsive" style="max-height: 600px; test-align:left">
        <p id = "modalGenres" ></p>
        <p id = "modalLanguage" ></p>
        <p id = "modalCopies" ></p>
        <p id = "modalPublisher" ></p>
        <div class = "col-md-6"> <button class ="btn btn-default" type="button" id ="returnBook"  onclick="returnBook(this)">Return Book</button> </div>
        <button class ="btn btn-default" type="button" onclick="borrowBook(document.location.hash)">Borrow Book</button>
    </div>
    <div class="col-md-8">
        <h3>Description</h3>
        <div id = "modalDescription" style="text-align:center; font-size:14px; line-height: 30px"></div>
    </div>
    </div><link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
</div>	